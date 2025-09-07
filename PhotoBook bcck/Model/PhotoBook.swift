//
//  PhotoBook.swift
//  PhotoBook bcck
//
//  Created by TY on 06/09/2025.
//


import SwiftUI

struct PhotoBook: Identifiable, Codable {
    var id = UUID()
    var title: String
    var template: Template
    var pages: [PhotoPage] = []
}
