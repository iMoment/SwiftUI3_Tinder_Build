//
//  User.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/02.
//

import Foundation

struct User {
    var name: String
    var isGoldSubscriber: Bool = false
}

extension User {
    static let example = User(name: "Stanley", isGoldSubscriber: false)
}
