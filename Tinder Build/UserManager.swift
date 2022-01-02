//
//  UserManager.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/02.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "")
    @Published var matches: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
    }
    
    private func loadUser() {
        self.currentUser = User.example
    }
    
    private func loadMatches() {
        self.matches = Person.examples
    }
    
    // Networking here later
//    private func loadUser() {
//        self.currentUser = User.example
//        loadMatches()
//    }
//    
//    private func loadMatches(user: User) {
//        self.matches = [Person.example, Person.example2]
//    }
}
