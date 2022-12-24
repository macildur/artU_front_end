//
//  Category.swift
//  ArtU
//
//  Created by Eliza Hales on 11/7/22.
//

import SwiftUI

struct Category: Identifiable, Hashable {
    var id = UUID()
    let categoryId: Int
    let name: String
    let value: String
}
