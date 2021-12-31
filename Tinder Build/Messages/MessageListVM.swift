//
//  MessageListVM.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/31.
//

import Foundation

class MessageListVM: ObservableObject {
    @Published var messageThreads: [MessageThread] = []
    
    init() {
        loadThreads()
    }
    
    func loadThreads() {
        // Handle networking to load messageThreads from a server
        self.messageThreads = [MessageThread.example]
    }
}
