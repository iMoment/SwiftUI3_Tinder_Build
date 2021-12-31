//
//  ChatView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/31.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatManager: ChatManager
    private var person: Person
    
    init(person: Person) {
        self.person = person
        self.chatManager = ChatManager(person: person)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack {
                ForEach(chatManager.messages.indices) { messageIndex in
                    let message = chatManager.messages[messageIndex]
                    MessagesView(message: message)
                }
            }
        })
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}
