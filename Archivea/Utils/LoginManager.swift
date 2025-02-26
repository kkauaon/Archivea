//
//  LoginManager.swift
//  Archivea
//
//  Created by iredefbmac_33 on 21/02/25.
//
import Foundation
import SwiftUI

class LoginManager: ObservableObject {
    @Published var profile: MyProfile?
    
    init(profile: MyProfile? = nil) {
        self.profile = profile
    }
    
    func login(profile: MyProfile) {
        self.profile = profile
    }
    
    func logout() {
        self.profile = nil
    }
}
