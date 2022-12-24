//
//  Subcategory.swift
//  ArtU
//
//  Created by Eliza Hales on 11/7/22.
//

import SwiftUI

struct Subcategory: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let value: String
    let secondaryCategory: String
}
