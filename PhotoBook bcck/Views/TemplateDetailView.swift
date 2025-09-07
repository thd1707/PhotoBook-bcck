import SwiftUI

struct TemplateDetailView: View {
    let template: Template
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingPhotoBookCreationView: Bool = false

    @ViewBuilder
    var templatePreview: some View {
        switch template.layout {
        case .fullImage:
            ClassicPreviewView()
        case .twoImages:
            CollagePreviewView()
        case .imageWithCaption:
            PolaroidPreviewView()
        case .diary:
            DiaryPreviewView()
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Preview Layout")
                    .font(.title)
                    .padding()

                templatePreview

                HStack {
                    Button("← Quay lại") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()

                    Button("Chọn template này") {
                        isShowingPhotoBookCreationView = true
                    }
                    .padding()
                }
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
            .sheet(isPresented: $isShowingPhotoBookCreationView) {
                PhotoBookCreationView(template: template)
            }
        }
    }
}
