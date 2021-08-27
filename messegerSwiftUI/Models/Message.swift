//
//  Message.swift
//  messegerSwiftUI
//
//  Created by Стас Жингель on 24.08.2021.
//

import Foundation

enum MessageType : String {
    case sent
    case received
}

struct Message {
    let text: String
    let type: MessageType
    let created: String
}
