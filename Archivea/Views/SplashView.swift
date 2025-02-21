//
//  SplashView.swift
//  Archivea
//
//  Created by iredefbmac_33 on 25/01/25.
//

import SwiftUI

struct SplashView: View {
    @State var isActive : Bool = true
    
    @StateObject var loginManager =  LoginManager()
    
    let splashTime = 0.1;
    // tempo em segundos do splash
    
    var body: some View {
        VStack {
            if isActive {
                Text("Archivea")
                    .font(.largeTitle)
                    .foregroundColor(.mint)
                Image("archivealogo2")
                    .frame(width: 500, height: 500, alignment: .center)
                    .cornerRadius(10)
                    .scaledToFit()
            } else {
                MainView()
                    .environmentObject(loginManager)
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
