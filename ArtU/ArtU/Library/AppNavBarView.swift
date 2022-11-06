//
//  AppNavBarView.swift
//  ArtU
//
//  Created by Eliza Hales on 10/28/22.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                CustomNavLink(destination:
                                Text("Destination")
                                .customNavigationTitle("Second Screen")
                                .customNavigationSubtitle("This should be showing!")
                , buttonType: {
                    Text("Navigate")
                }, moduleName: "module name")
            }
            .customNavBarItems(title: "New title!", subtitle: "Subtitle!", backButtonHidden: false)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView().previewInterfaceOrientation(.landscapeLeft)
    }
}

extension AppNavBarView {
    
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                //Image("green_background").resizable().ignoresSafeArea()
                
                NavigationLink(
                    destination:
                        Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                    ,
                    label: {
                        Text("Navigate")
                    })
            }
            .navigationTitle("New title here")
        }
    }
}
