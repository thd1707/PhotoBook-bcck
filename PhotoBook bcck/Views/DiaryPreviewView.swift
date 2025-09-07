import SwiftUI

struct DiaryPreviewView: View {
    var body: some View {
        VStack {
            Rectangle()
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 300, height: 200)
                .overlay(
                    Text("Ảnh lớn")
                        .foregroundColor(.gray)
                )
            HStack {
                Rectangle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 90, height: 90)
                    .overlay(
                        Text("Ảnh nhỏ 1")
                            .foregroundColor(.gray)
                    )
                Rectangle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 90, height: 90)
                    .overlay(
                        Text("Ảnh nhỏ 2")
                            .foregroundColor(.gray)
                    )
                Rectangle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 90, height: 90)
                    .overlay(
                        Text("Ảnh nhỏ 3")
                            .foregroundColor(.gray)
                    )
            }
            TextField("Thêm chú thích", text: .constant(""))
                .padding()
        }
    }
}
