import SwiftUI

struct PolaroidPreviewView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.2)) // Màu xám nhạt
                .frame(width: 300, height: 350)
                .overlay(
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 2)
                        .frame(width: 240, height: 240)
                        .overlay(
                            Text("Ảnh")
                                .foregroundColor(.gray)
                        )
                )
            TextField("Thêm chú thích", text: .constant(""))
                .padding()
        }
    }
}
