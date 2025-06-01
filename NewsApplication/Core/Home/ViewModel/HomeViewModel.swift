//
//  HomeViewModel.swift
//  NewsApplication
//
//  Created by Dostan Turlybek on 31.05.2025.
//

import Foundation
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published var data: NewsModel? = nil
    
    private let dataService =  NetworkService.shared
    
    func getNews() async {
        do {
            self.data = try await NetworkService.shared.fetchData(from: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=107a6a88841d45969667c330fddcba30", as: NewsModel?.self)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getImage(urlString: String) async -> UIImage?{
        print("start dwonload")
        do {
            return try await NetworkService.shared.fetchImage(urlString: urlString)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
