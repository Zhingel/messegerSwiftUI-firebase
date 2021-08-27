//
//  ChatView.swift
//  messegerSwiftUI
//
//  Created by Стас Жингель on 24.08.2021.
//

import SwiftUI
struct CustomField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(7)
    }
     
}

struct ChatView: View {
    @State var message: String = ""
    let otherUsername: String
    init(otherUsername: String) {
        self.otherUsername = otherUsername
    }
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ChatRow(text: "Hello world", type: .sent)
                    .padding(3)
                ChatRow(text: "Hello world", type: .received)
                    .padding(3)
            }
            HStack {
                TextField("Message...", text: $message)
                    .modifier(CustomField())
             SendButton(text: $message)
            }
            .padding()
        }
        .navigationTitle(otherUsername)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(otherUsername:  "Will")
            .preferredColorScheme(.dark)
    }
}
