//
//  MessageThread.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import Foundation

struct MessageThread {
    var person: Person
    var lastMessage: String
}

extension MessageThread {
    static let example = MessageThread(person: Person.example, lastMessage: "Hello, my name is Sanghwa.")
}
