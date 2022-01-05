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
    @Binding var inFullScreenMode: Bool
    
    func updateImageIndex(addition: Bool) {
        let newIndex: Int
        
        if addition {
            newIndex = imageIndex + 1
        } else {
            newIndex = imageIndex - 1
        }
        
        imageIndex = min(max(0, newIndex), person.imageURLS.count - 1)
    }
    
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.4
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack {
                    KFImage(person.imageURLS[imageIndex])
                        .placeholder {
                            Color.white
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                    
                    VStack {
                        HStack {
                            Image("likeButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .opacity(Double(person.xPosition / screenCutoff) - 1)
                            
                            Spacer()
                            
                            Image("nopeButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .opacity(Double(person.xPosition / screenCutoff) * -1 - 1)
                        }
                        
                        Spacer()
                    }
                    
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
                
                VStack {
                    HStack {
                        ForEach(0..<person.imageURLS.count) { imageIndex in
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 4)
                                .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray.opacity(0.5))
                        }
                    }
                    .padding(.top, 6)
                    .padding(.horizontal, inFullScreenMode ? 0 : 12)
                    
                    Spacer()
                    
                    if !inFullScreenMode {
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(person.name)
                                        .font(.system(size: 32, weight: .heavy))
                                    
                                    Text(String(person.age))
                                        .font(.system(size: 28, weight: .light))
                                }
                                
                                Text(person.bio)
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(2)
                            }
                            
                            Spacer()
                            
                            Button(action: { inFullScreenMode = true }, label: {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 26, weight: .medium))
                            })
                        }
                        .padding(16)
                    }
                }
                .foregroundColor(Color.white)
            }
            .cornerRadius(6)
            .shadow(radius: 5)
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.example, inFullScreenMode: .constant(false))
    }
}
