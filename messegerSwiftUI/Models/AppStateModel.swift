//
//  AppStateModel.swift
//  messegerSwiftUI
//
//  Created by Стас Жингель on 24.08.2021.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AppStateModel : ObservableObject {
    @AppStorage("currentUsername") var currentUsername: String = ""
    @AppStorage("currentEmail") var currentEmail: String = ""
    @Published var showingSignIn: Bool = true
    @Published var conversations: [String] = []
    @Published var messages: [Message] = []
    
    let database = Firestore.firestore()
    let auth = Auth.auth()
    var otherUsername = ""
    
    init() {
        self.showingSignIn = Auth.auth().currentUser == nil
    }
}

//search
extension AppStateModel {
    func searchUsers(queryText: String, completion: @escaping ([String]) -> Void) {
        database.collection("users").getDocuments(completion: { snapshot, error in
            guard let usernames = snapshot?.documents.compactMap({$0.documentID}),
                  error == nil else {
                completion([ ])
                return}
            let filtered = usernames.filter({
                $0.lowercased().hasPrefix(queryText.lowercased())
            })
            completion(usernames)
        })
    }
}

//conversation
extension AppStateModel {
    func getConversation() {
        
    }
}
//get chat and set messages
extension AppStateModel {
    func observeChat() {
        
    }
    func sendMessege(text: String) {
        
    }
    func createConversationIfNeeded() {
        
    }
}

//sign in sign uo
extension AppStateModel {
    func signIn(username: String, password: String) {
        database.collection("users").document(username).getDocument {[weak self] snapshot, error in
            guard let email = snapshot?.data()?["email"] as? String, error == nil else {return}
            
            self?.auth.signIn(withEmail: email, password: password, completion: { result, error in
                guard error == nil, result != nil else {return}
                DispatchQueue.main.async {
                    self?.currentEmail = email
                    self?.currentUsername = username
                    self?.showingSignIn = false
                }
            })
        }
    }
    func signUp(email: String, username: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self]
            result, error in
            guard result != nil, error == nil else {return}
            
            let data = [
                "email" : email,
                "username" : username
            ]
            self?.database
                .collection("users")
                .document(username)
                .setData(data) {
                    error in guard error == nil else {
                        return
                    }
                DispatchQueue.main.async {
                    self?.currentUsername = username
                    self?.currentEmail = email
                    self?.showingSignIn = false
                }
                }
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
            self.showingSignIn = true
        }
        catch {
            print(error)
        }
    }
}
