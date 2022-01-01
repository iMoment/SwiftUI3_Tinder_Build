//
//  Person.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import Foundation

struct Person: Hashable {
    var name: String
    var imageURLS: [URL]
    var bio: String
}

extension Person {
    static let example = Person(
        name: "Sanghwa",
        imageURLS: [URL(string: "https://picsum.photos/400/300")!],
        bio: "This is my bio."
    )
    static let example2 = Person(
        name: "Gihwan",
        imageURLS: [URL(string: "https://picsum.photos/400/301")!],
        bio: "I really love pizza."
    )
}
