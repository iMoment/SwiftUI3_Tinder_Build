//
//  MessageView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    
    var body: some View {
        HStack {
            if message.fromCurrentUser {
                Spacer()
            }
            
            Text(message.messageContent)
                .padding(10)
                .foregroundColor(Color.white)
                .background(message.fromCurrentUser ? Color.blue : Color.gray)
                .cornerRadius(10)
            
            if !message.fromCurrentUser {
                Spacer()
            }
        }
        .padding()
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message.exampleSent)
    }
}
