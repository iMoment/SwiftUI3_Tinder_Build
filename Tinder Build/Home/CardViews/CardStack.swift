//
//  CardStack.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/05.
//

import SwiftUI

struct CardStack: View {
    var people: [Person]
    @State private var inFullScreenMode: Bool = false
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            ForEach(people) { person in
                CardView(person: person, inFullScreenMode: $inFullScreenMode)
            }
        }
        .frame(width: screen.width, height: inFullScreenMode ? screen.height : 550)
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack(people: Person.examples)
    }
}
