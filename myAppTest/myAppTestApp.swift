//
//  myAppTestApp.swift
//  myAppTest
//
//  Created by Ana Carolina on 20/11/24.
//

import SwiftUI

@main
struct myAppTestApp: App {
    @Environment(\.scenePhase) var scenePhase

        var body: some Scene {
            WindowGroup {
                MoviesListView()
            }
            .onChange(of: scenePhase, { oldValue, newValue in
                switch newValue {
                    case .active:
                        print("App is Active")
//                        KeysViewModel.main.getKeys()
                    case .inactive:
                        print("App is inactive")
                    case .background:
                        print("App is in Background")
                    @unknown default:
                        print("Something unexpected")
                }
            })
        }
}
