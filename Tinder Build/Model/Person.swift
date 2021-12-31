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
}

extension Person {
    static let example = Person(name: "Sanghwa", imageURLS: [URL(string: "https://picsum.photos/400/300")!])
}
