//
//  NewsApplicationApp.swift
//  NewsApplication
//
//  Created by Dostan Turlybek on 31.05.2025.
//

import SwiftUI

@main
struct NewsApplicationApp: App {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
            }
            .environmentObject(viewModel)
        }
    }
}
