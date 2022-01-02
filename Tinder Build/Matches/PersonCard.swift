//
//  PersonCard.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/02.
//

import SwiftUI
import Kingfisher

struct PersonCard: View {
    var person: Person
    var shouldBlur: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                KFImage(person.imageURLS.first)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .if(shouldBlur) {
                        $0.blur(radius: 25)
                    }
                
                Text("\(person.name), \(person.age)")
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.system(size: 18, weight: .semibold))
                    .if(shouldBlur) {
                        $0.redacted(reason: .placeholder)
                    }
            }
            .cornerRadius(16)
        }
    }
}

struct PersonCard_Previews: PreviewProvider {
    static var previews: some View {
        PersonCard(person: Person.example, shouldBlur: false)
            .frame(width: 125)
    }
}
