import SwiftUI

struct PhotoBookCreationView: View {
    let template: Template
    @State private var photoBookTitle: String = ""
    @State private var isShowingImagePicker: Bool = false
    @State private var imagesData: [Data] = []
    @State private var captions: [String] = []
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var photoBookViewModel: PhotoBookViewModel

    var body: some View {
        NavigationView {
            VStack {
                Text("Tạo PhotoBook")
                    .font(.title)
                    .padding()

                TextField("Nhập tên PhotoBook", text: $photoBookTitle)
                    .padding()
                    .border(.gray)
                    .padding()

                Button("Chọn ảnh từ thư viện") {
                    isShowingImagePicker = true
                }
                .padding()
                .sheet(isPresented: $isShowingImagePicker) {
                    ImagePicker(imagesData: $imagesData)
                }

                // Hiển thị ảnh đã chọn (nếu có)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<imagesData.count, id: \.self) { index in
                            if let uiImage = UIImage(data: imagesData[index]) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
                }

                Button("DONE") {
                    // Tạo PhotoPage
                    let newPage = PhotoPage(imagesData: imagesData, captions: captions)

                    // Tạo PhotoBook và thêm page
                    var newPhotoBook = PhotoBook(title: photoBookTitle, template: template, pages: [newPage])

                    // Lưu PhotoBook vào thư viện cá nhân
                    photoBookViewModel.addPhotoBook(photoBook: newPhotoBook)
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Templates")
                        }
                    }
                }
            }
        }
    }

    struct ImagePicker: UIViewControllerRepresentable {
        @Binding var imagesData: [Data]

        func makeUIViewController(context: Context) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            return picker
        }

        func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            let parent: ImagePicker

            init(_ parent: ImagePicker) {
                self.parent = parent
            }

            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let image = info[.originalImage] as? UIImage,
                   let data = image.jpegData(compressionQuality: 0.8) {
                    parent.imagesData.append(data)
                }

                picker.dismiss(animated: true)
            }

            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true)
            }
        }
    }
}
