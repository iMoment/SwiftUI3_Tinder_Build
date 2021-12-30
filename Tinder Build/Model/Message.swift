//
//  Message.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import Foundation

struct Message {
    var messageContent: String
    var person: Person? = nil
    
    var fromCurrentUser: Bool {
        return person == nil
    }
}

extension Message {
    static let exampleSent = Message(messageContent: "Hello there")
    static let exampleReceived = Message(messageContent: "Hi, nice to meet you.", person: Person.example)
}
