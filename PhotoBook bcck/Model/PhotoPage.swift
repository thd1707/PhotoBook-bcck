//
//  PhotoPage.swift
//  PhotoBook bcck
//
//  Created by TY on 06/09/2025.
//

import Foundation
import SwiftUI

struct PhotoPage: Identifiable, Codable {
    var id = UUID()
    var imagesData: [Data] // Dữ liệu ảnh (Data) để lưu vào máy
    var captions: [String]
}
