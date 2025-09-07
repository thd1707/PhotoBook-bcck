import SwiftUI

struct CollagePreviewView: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 150, height: 200)
                    .overlay(
                        Text("Ảnh 1")
                            .foregroundColor(.gray)
                    )
                Rectangle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 150, height: 200)
                    .overlay(
                        Text("Ảnh 2")
                            .foregroundColor(.gray)
                    )
            }
            TextField("Thêm chú thích", text: .constant(""))
                .padding()
        }
    }
}
