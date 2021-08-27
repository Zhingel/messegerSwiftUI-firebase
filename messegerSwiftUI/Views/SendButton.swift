//
//  SendButton.swift
//  messegerSwiftUI
//
//  Created by Стас Жингель on 24.08.2021.
//

import SwiftUI

struct SendButton: View {
    @EnvironmentObject var model: AppStateModel
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
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        model.sendMessege(text: text)
        text = ""
    }
}

//struct SendButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SendButton()
//    }
//}
