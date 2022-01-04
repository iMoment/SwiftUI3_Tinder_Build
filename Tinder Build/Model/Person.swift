//
//  Person.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import Foundation

struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    
    var name: String
    var imageURLS: [URL]
    var bio: String
    
    var age: Int
}

extension Person {
    static let example = Person(
        name: "Sanghwa",
        imageURLS: [
            URL(string: "https://picsum.photos/400/300")!,
            URL(string: "https://picsum.photos/400/301")!,
            URL(string: "https://picsum.photos/400/302")!,
            URL(string: "https://picsum.photos/400/303")!
        ],
        bio: "This is my bio.",
        age: 21
    )
    static let example2 = Person(
        name: "Gihwan",
        imageURLS: [URL(string: "https://picsum.photos/400/301")!],
        bio: "I really love pizza.",
        age: 25
    )
    static let example3 = Person(
        name: "MK",
        imageURLS: [URL(string: "https://picsum.photos/400/302")!],
        bio: "I need to drink soju everyday.",
        age: 28
    )
    static let example4 = Person(
        name: "ByungYoon",
        imageURLS: [URL(string: "https://picsum.photos/400/303")!],
        bio: "Playing video games is more important than you.",
        age: 30
    )
    static let example5 = Person(
        name: "Sarah",
        imageURLS: [URL(string: "https://picsum.photos/400/304")!],
        bio: "Hi, I attend Hongik University located in Mapo-gu",
        age: 23
    )
    
    static let examples: [Person] = [
        Person.example,
        Person.example2,
        Person.example3,
        Person.example4,
        Person.example5
    ]
}
