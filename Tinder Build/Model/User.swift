//
//  User.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/02.
//

import Foundation

struct User {
    var name: String
    var age: Int
    var jobTitle: String
    
    var isGoldSubscriber: Bool = false
    var profileTip: String = ""
    var imageURLS: [URL] = []
}

extension User {
    static let example = User(
        name: "Stanley",
        age: 33,
        jobTitle: "iOS Developer",
        isGoldSubscriber: false,
        profileTip: "Photo Tip: Make waves with a beach photo and get more likes",
        imageURLS: [URL(string: "https://picsum.photos/400/310")!]
    )
}
