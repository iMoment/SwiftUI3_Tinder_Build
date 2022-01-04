//
//  CardImageScroller.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/04.
//

import SwiftUI
import Kingfisher

struct CardImageScroller: View {
    var person: Person
    @State private var imageIndex: Int = 0
    
    func updateImageIndex(addition: Bool) {
        let newIndex: Int
        
        if addition {
            newIndex = imageIndex + 1
        } else {
            newIndex = imageIndex - 1
        }
        
        imageIndex = min(max(0, newIndex), person.imageURLS.count - 1)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                KFImage(person.imageURLS[imageIndex])
                    .placeholder {
                        Color.white
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
                
                HStack {
                    Rectangle()
                        .onTapGesture(perform: {
                            updateImageIndex(addition: false)
                        })
                    
                    Rectangle()
                        .onTapGesture(perform: {
                            updateImageIndex(addition: true)
                        })
                }
                .foregroundColor(Color.white.opacity(0.01))
            }
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.example)
    }
}
