//
//  UserManager.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/02.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "", age: 0, jobTitle: "")
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    @Published var personCardStack: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
        loadPersonCardStack()
    }
    
    private func loadUser() {
        self.currentUser = User.example
    }
    
    private func loadMatches() {
        self.matches = Person.examples
    }
    
    private func loadTopPicks() {
        self.topPicks = Person.examples.shuffled()
    }
    
    private func loadPersonCardStack() {
        self.personCardStack = Person.examples
    }
    
    public func swipe(_ person: Person, _ direction: SwipeDirection) {
        self.personCardStack.removeLast()
        // Networking to backend
    }
    
    public func superLike(_ person: Person) {
        self.personCardStack.removeLast()
        // Networking to backend
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

enum SwipeDirection {
    case like
    case reject
}
