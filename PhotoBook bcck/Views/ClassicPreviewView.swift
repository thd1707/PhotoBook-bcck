import SwiftUI

struct ClassicPreviewView: View {
    var body: some View {
        VStack {
            Rectangle()
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 300, height: 400)
                .overlay(
                    VStack {
                        Text("Ảnh sẽ hiển thị ở đây")
                            .foregroundColor(.gray)
                        Text("Caption")
                            .foregroundColor(.gray)
                    }
                )
            TextField("Thêm chú thích", text: .constant(""))
                .padding()
        }
    }
}
