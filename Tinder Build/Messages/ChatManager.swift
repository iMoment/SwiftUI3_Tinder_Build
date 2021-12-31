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
    
    public func sendMessage(_ message: Message) {
        // Networking
        messages.append(message)
        
        // If networking failure, show error with retry options
    }
    
    private func loadMessages() {
        messages = [Message.exampleSent, Message.exampleReceived]
    }
}
