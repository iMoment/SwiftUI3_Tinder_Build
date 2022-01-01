//
//  MessageRow.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/01.
//

import SwiftUI
import Kingfisher

struct MessageRow: View {
    var messageThread: MessageThread
    
    var body: some View {
        HStack {
            RoundedImage(imageURL: messageThread.person.imageURLS.first)
                .frame(height: 90)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(messageThread.person.name)
                    .font(.system(size: 21, weight: .semibold))
                
                Text(messageThread.lastMessage)
                    .foregroundColor(.textPrimary)
                    .lineLimit(1)
            }
            
            Spacer()
        }
    }
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(messageThread: MessageThread.example)
    }
}
