import SwiftUI

struct PhotoBookDetailView: View {
    let photoBook: PhotoBook

    var body: some View {
        ScrollView {
            VStack {
                Text(photoBook.title)
                    .font(.largeTitle)
                    .padding()

                ForEach(photoBook.pages) { page in
                    VStack {
                        ForEach(0..<page.imagesData.count, id: \.self) { index in
                            if let uiImage = UIImage(data: page.imagesData[index]) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                            }
                            // Kiểm tra xem caption có tồn tại hay không trước khi hiển thị
                            if index < page.captions.count {
                                Text(page.captions[index])
                                    .font(.caption)
                            }
                        }
                    }
                    .padding()
                    .border(Color.gray)
                }
            }
        }
    }
}
