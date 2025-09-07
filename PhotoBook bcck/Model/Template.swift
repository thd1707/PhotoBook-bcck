//
//  Template.swift
//  PhotoBook bcck
//
//  Created by TY on 06/09/2025.
//

import Foundation
import SwiftUI

enum TemplateLayout: String, Codable, CaseIterable {
    case fullImage = "fullImage"
    case imageWithCaption = "imageWithCaption"
    case twoImages = "twoImages"
    case diary = "diary"
}

struct Template: Identifiable, Codable {
    var id = UUID()
    var name: String
    var layout: TemplateLayout
    var coverImageName: String // Tên file ảnh bìa
}

// Dữ liệu mẫu cho các template
let templates: [Template] = [
    Template(name: "Classic", layout: .fullImage, coverImageName: "classic_cover"),
    Template(name: "Collage", layout: .twoImages, coverImageName: "collage_cover"),
    Template(name: "Polaroid", layout: .imageWithCaption, coverImageName: "polaroid_cover"),
    Template(name: "Diary", layout: .diary, coverImageName: "diary_cover")
]
