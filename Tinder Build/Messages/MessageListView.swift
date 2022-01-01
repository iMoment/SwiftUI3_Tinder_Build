//
//  MessageListView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/31.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var vm: MessageListVM = MessageListVM()
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    TextField("Search Matches", text: $searchText)
                        .disableAutocorrection(true)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color.textFieldBackground)
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.textPrimary)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.leading, 4)
                                
                                Spacer()
                            }
                        )
                        .padding(.horizontal, 10)
                        .animation(.easeIn(duration: 0.25), value: isEditing)
                        .onTapGesture(perform: {
                            self.isEditing = true
                        })
                    
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.searchText = ""
                            self.endEditing(true)
                        }, label: {
                            Text("Cancel")
                        })
                        .padding(.trailing, 10)
                        .animation(.easeIn(duration: 0.25))
                        .transition(.move(edge: .trailing))
                    }
                }
                
                Spacer()
                    .frame(height: 14)
                
                ZStack {
                    VStack {
                        ForEach(vm.messageThreads.filter({ searchText.isEmpty ? true : displayThread($0) }), id: \.self) { thread in
                            
                            NavigationLink(
                                destination: ChatView(person: thread.person),
                                label: {
                                    MessageRow(messageThread: thread)
                                })
                                .buttonStyle(PlainButtonStyle())
                                .animation(.easeIn(duration: 0.25), value: searchText)
                                .transition(.slide)
                        }
                    }
                    
                    if isEditing && searchText.isEmpty {
                        Color.white.opacity(0.5)
                    }
                }
                
                Spacer()
            }
        }
        .modifier(HideNavigationView())
    }
    
    func displayThread(_ thread: MessageThread) -> Bool {
        // Person name
        if thread.person.name.contains(searchText) { return true }
        // Last message sent
        if thread.lastMessage.contains(searchText) { return true }
        // Person bio
        if thread.person.bio.contains(searchText) { return true }
        
        return false
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageListView()
        }
    }
}
