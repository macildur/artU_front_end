//
//  CustomNavLink.swift
//  ArtU
//
//  Created by Eliza Hales on 10/28/22.
//

import SwiftUI

struct CustomNavLink<Destination:View, Label:View>: View {
    
    @State private var doNavigate: Bool = false
    
    var destination: Destination
    var buttonType: Label
    var name: String

    
    init(destination: Destination, @ViewBuilder buttonType: () -> Label, name: String) {
        self.destination = destination
        self.buttonType = buttonType()
        self.name = name
    }
    
    var body: some View {
        if (name == "module") {
            NavigationLink(destination: destination, label: {buttonType}).buttonStyle(ModuleButtonStyle())
        } else if (name == "navigation") {
            NavigationLink(destination: destination, label: {buttonType}).buttonStyle(LessonButtonStyle())
        }
    }
}

struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            CustomNavLink (
                destination: Text("destination"), buttonType: {Text("Click Me")}, name: "stringVal")
        }.previewInterfaceOrientation(.landscapeLeft)
    }
}
