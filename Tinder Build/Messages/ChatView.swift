//
//  ChatView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/31.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatManager: ChatManager
    @State private var typingMessage: String = ""
    private var person: Person
    
    init(person: Person) {
        self.person = person
        self.chatManager = ChatManager(person: person)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer()
                    .frame(height: 60)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVStack {
                        ForEach(chatManager.messages.indices) { messageIndex in
                            let message = chatManager.messages[messageIndex]
                            withAnimation(Animation.easeIn) {
                                MessagesView(message: message)
                                    .transition(.move(edge: .trailing))
                            }
                        }
                    }
                })
                
                ZStack(alignment: .trailing) {
                    Color.textFieldBackground
                    
                    TextField("Type a message", text: $typingMessage)
                        .foregroundColor(Color.textPrimary)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                    .padding(.horizontal)
                    
                    Button(action: { sendMessage() }, label: {
                        Text("Send")
                    })
                    .padding(.horizontal)
                    .foregroundColor(typingMessage.isEmpty ? Color.textPrimary : Color.blue)
                }
                .frame(height: 40)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            ChatViewHeader(
                personName: person.name,
                imageURL: person.imageURLS.first) {
                    // TODO: Video Action
                }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    func sendMessage() {
        chatManager.sendMessage(Message(messageContent: typingMessage))
        typingMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}
