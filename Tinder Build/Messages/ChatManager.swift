//
//  ChatManager.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/31.
//

import Foundation

class ChatManager: ObservableObject {
    @Published var messages: [Message] = []
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        loadMessages()
    }
    
    private func loadMessages() {
        messages = [Message.exampleSent, Message.exampleReceived]
    }
}
