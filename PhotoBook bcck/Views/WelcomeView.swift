import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Ảnh nền
                Image("background").resizable().scaledToFill().opacity(0.5).ignoresSafeArea()
                VStack {
                    Text("Tạo một PhotoBook của riêng bạn")
                        .font(.largeTitle)
                        .font(.custom("Times New Roman", size: 10))
                        .foregroundColor(.orange)
                        .bold()
                        .padding()

                    NavigationLink(destination: TemplateListView()) {
                        Text("Tạo mới")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue))
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20) // Khoảng cách giữa hai nút

                    NavigationLink(destination: PhotoBookListView()) {
                        Text("Xem thư viện")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue))
                            .cornerRadius(10)
                    }
                }
                .navigationBarTitle("PhotoBook", displayMode: .inline)
                .foregroundColor(.white) // Đặt màu chữ trắng cho toàn bộ nội dung
            }
        }
    }
}
