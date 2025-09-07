import SwiftUI

struct TemplateListView: View {
    @State private var selectedTemplate: Template? = nil

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(templates) { template in
                        TemplateView(template: template)
                            .onTapGesture {
                                selectedTemplate = template
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("Chọn Template")
            .sheet(item: $selectedTemplate) { template in
                TemplateDetailView(template: template)
            }
        }
    }
}

struct TemplateView: View {
    let template: Template

    var body: some View {
        VStack {
            Image(template.coverImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 200)
                .cornerRadius(10)
                .shadow(radius: 5) // Tạo hiệu ứng nổi cho cuốn sách

            Text(template.name)
                .font(.headline)
                .padding(.top, 5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}
