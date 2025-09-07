import SwiftUI

struct PhotoBookListView: View {
    @EnvironmentObject var photoBookViewModel: PhotoBookViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(photoBookViewModel.photoBooks) { photoBook in
                    NavigationLink(destination: PhotoBookDetailView(photoBook: photoBook)) {
                        Text(photoBook.title)
                    }
                }
            }
            .navigationTitle("Thư viện PhotoBook")
        }
    }
}
