//
//  ChatRow.swift
//  messegerSwiftUI
//
//  Created by Стас Жингель on 24.08.2021.
//

import SwiftUI

struct ChatRow: View {
    let type: MessageType
    let text: String
    init(text: String, type: MessageType){
        self.text = text
        self.type = type
    }
    var isSender: Bool {
        return type == .sent
    }
    
    var body: some View {
        HStack {
            if isSender {Spacer()}
            if !isSender {
                VStack {
                    Spacer()
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(.pink)
                }
                
            }
            HStack {
                Text(text)
                    .foregroundColor(isSender ? .white : Color(.label))
                    .padding()
            }
            .background(isSender ? Color.blue : Color(.systemGray4))
            .padding(isSender ? .leading : .trailing, isSender ? UIScreen.main.bounds.width/3 : UIScreen.main.bounds.width/5)
            .cornerRadius(6.0)
            if !isSender {Spacer()}
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatRow(text: "Test", type: .sent)
                .preferredColorScheme(.dark)
            ChatRow(text: "test ", type: .received)
                .preferredColorScheme(.dark)
        }
    }
}
