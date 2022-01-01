//
//  MessageThread.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import Foundation

struct MessageThread: Hashable {
    var person: Person
    var lastMessage: String
}

extension MessageThread {
    static let example = MessageThread(person: Person.example, lastMessage: "Hello, my name is Sanghwa. Happy New Year! How are you doing today?")
    
    static let examples: [MessageThread] = [
        MessageThread(person: Person.example, lastMessage: "Hello, my name is Sanghwa. Happy New Year! How are you doing today?"),
        MessageThread(person: Person.example2, lastMessage: "Hi there.")
    ]
}
