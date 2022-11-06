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
    var moduleName: String

    
    init(destination: Destination, @ViewBuilder buttonType: () -> Label, moduleName: String) {
        self.destination = destination
        self.buttonType = buttonType()
        self.moduleName = moduleName
    }
    
    var body: some View {
        NavigationLink(destination: destination, label: {buttonType}).buttonStyle(ModuleButtonStyle(moduleName: moduleName))
    }
}

struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            CustomNavLink (
                destination: Text("destination"), buttonType: {Text("Click Me")}, moduleName: "stringVal")
        }.previewInterfaceOrientation(.landscapeLeft)
    }
}
