//
//  ShortTextField.swift
//  ArtU
//
//  Created by Trav Feller on 10/26/22.
//

import Foundation
import SwiftUI

struct ShortTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .cornerRadius(10.0)
            .frame(width: 363, height: 40)
            .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(Color.white))
    }
}
