//
//  messegerSwiftUIApp.swift
//  messegerSwiftUI
//
//  Created by Стас Жингель on 24.08.2021.
//

import SwiftUI
import Firebase

@main
struct messegerSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            ConversationListView()
                .environmentObject(AppStateModel())
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("did launch")
        return true
    }
}
