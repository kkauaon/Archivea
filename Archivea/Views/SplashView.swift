//
//  SplashView.swift
//  Archivea
//
//  Created by iredefbmac_33 on 25/01/25.
//

import SwiftUI

struct SplashView: View {
    @State var isActive : Bool = true
    
    let splashTime = 2.5; // tempo em segundos do splash
    
    var body: some View {
        ZStack {
            if isActive {
                Text("Archivea")
            } else {
                LoginRegisterView()
            }
        }
        .onAppear {
            // https://medium.com/@liyicky/how-to-make-a-splash-screen-in-swift-ui-83b02984a6ab
            DispatchQueue.main.asyncAfter(deadline: .now() + splashTime) {
                withAnimation {
                    isActive = false
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
