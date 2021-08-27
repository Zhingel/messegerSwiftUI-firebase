//
//  SendButton.swift
//  messegerSwiftUI
//
//  Created by Стас Жингель on 24.08.2021.
//

import SwiftUI

struct SendButton: View {
    @Binding var text: String
    var body: some View {
        Button(action: {
                self.sendMessage() }) {
            Image(systemName: "paperplane")
                .font(.system(size: 25))
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55 )
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
    func sendMessage() {
        guard !text.isEmpty else {
            return
        }
    }
}

//struct SendButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SendButton()
//    }
//}
