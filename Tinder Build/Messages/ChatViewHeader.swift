//
//  ChatViewHeader.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/31.
//

import SwiftUI

struct ChatViewHeader: View {
    @Environment(\.presentationMode) var presentationMode
    
    let personName: String
    let imageURL: URL?
    let videoAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.top)
                .shadow(radius: 3)
            
            HStack {
                Button(action: { presentationMode.wrappedValue.dismiss() }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.textPrimary)
                        .font(.system(size: 28, weight: .semibold))
                })
                
                Spacer()
                
                VStack(spacing: 6) {
                    RoundedImage(imageURL: imageURL)
                        .frame(height: 40)
                    
                    Text(personName)
                        .foregroundColor(Color.textSecondary)
                        .font(.system(size: 14))
                }
                
                Spacer()
                
                Button(action: { videoAction() }, label: {
                    Image(systemName: "video.fill")
                        .font(.system(size: 20, weight: .bold))
                })
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 10)
        }
        .frame(height: 50)
    }
}

struct ChatViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person.example
        ChatViewHeader(
            personName: person.name,
            imageURL: person.imageURLS.first,
            videoAction: {
                //
            }
        )
    }
}
