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
    
    let splashTime = 1.0;
    // tempo em segundos do splash
    
    var body: some View {
        VStack {
            if isActive {
                Text("Archivea")
                    .font(.largeTitle)
                    .foregroundColor(Color(hex: 0x25A36C))
                Image("archivealogo2")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
            } else {
                MainView()
                    .environmentObject(loginManager)
            }
        }
        .onAppear {
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
