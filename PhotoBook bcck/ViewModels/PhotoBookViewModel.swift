//
//  PhotoBookViewModel.swift
//  PhotoBook bcck
//
//  Created by TY on 06/09/2025.
//

import Foundation
import SwiftUI

class PhotoBookViewModel: ObservableObject {
    @Published var photoBooks: [PhotoBook] = [] {
        didSet {
            savePhotoBooks()
        }
    }

    init() {
        loadPhotoBooks()
    }

    // MARK: - Lưu và tải dữ liệu

    private func savePhotoBooks() {
        if let encodedData = try? JSONEncoder().encode(photoBooks) {
            UserDefaults.standard.set(encodedData, forKey: "photoBooks")
        }
    }

    private func loadPhotoBooks() {
        guard let data = UserDefaults.standard.data(forKey: "photoBooks"),
              let decodedData = try? JSONDecoder().decode([PhotoBook].self, from: data) else {
            return
        }
        photoBooks = decodedData
    }

    // MARK: - Thêm, sửa, xóa PhotoBook

    func addPhotoBook(photoBook: PhotoBook) {
        photoBooks.append(photoBook)
    }

    func updatePhotoBook(photoBook: PhotoBook) {
        // Tìm và cập nhật PhotoBook trong mảng photoBooks
        if let index = photoBooks.firstIndex(where: { $0.id == photoBook.id }) {
            photoBooks[index] = photoBook
        }
    }

    func deletePhotoBook(photoBook: PhotoBook) {
        photoBooks.removeAll { $0.id == photoBook.id }
    }
}
