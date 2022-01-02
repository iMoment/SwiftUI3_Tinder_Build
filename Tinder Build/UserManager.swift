//
//  UserManager.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/02.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "")
    
    init() {
        loadUser()
    }
    
    // Networking here later
    private func loadUser() {
        self.currentUser = User.example
    }
}
