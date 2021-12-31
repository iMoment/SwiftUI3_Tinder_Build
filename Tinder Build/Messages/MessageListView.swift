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
        VStack {
            HStack {
                TextField("Search Matches", text: $searchText)
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
                    .onTapGesture(perform: {
                        self.isEditing = true
                    })
                    .animation(.easeIn(duration: 0.25))
                
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchText = ""
                        self.endEditing(true)
                    }, label: {
                        Text("Cancel")
                    })
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.easeIn(duration: 0.25))
                }
            }
            
            Spacer()
        }
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
