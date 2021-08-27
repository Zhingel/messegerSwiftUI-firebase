//
//  ContentView.swift
//  messegerSwiftUI
//
//  Created by Стас Жингель on 24.08.2021.
//

import SwiftUI

struct ConversationListView: View {
    let usernames = ["Will", "Tom", "Stas"]
    @EnvironmentObject var model: AppStateModel
    @State var otherUsername: String = ""
    @State var showChat = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach(usernames, id: \.self) {
                    name in
                    NavigationLink(
                        destination: ChatView(otherUsername: name),
                        label: {
                            HStack {
                                Circle()
                                    .frame(width: 65, height: 65)
                                    .foregroundColor(Color.pink)
                                Text(name)
                                    .bold()
                                    .foregroundColor(Color(.label))
                                    .font(.system(size: 32))
                                Spacer()
                            }
                            .padding()
                        })
                }
                if !otherUsername.isEmpty {
                    NavigationLink("", destination: ChatView(otherUsername: otherUsername), isActive: $showChat)
                }
            }
            .navigationTitle("Conversations")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sign Out") {
                        self.signOut()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                   NavigationLink(
                    destination: SearchView {
                        name in
                        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                            self.otherUsername = name
                            self.showChat = true
                        }
                    },
                    label: {
                        Image(systemName: "magnifyingglass")
                    })
                }
            }
            .fullScreenCover(isPresented: $model.showingSignIn, content: {
                SigninView()
            })
        }
    }
    func signOut() {
        model.signOut()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListView()
            .preferredColorScheme(.dark)
    }
}
