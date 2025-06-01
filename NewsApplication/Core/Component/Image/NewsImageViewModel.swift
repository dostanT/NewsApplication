//
//  NewsImageViewModel.swift
//  NewsApplication
//
//  Created by Dostan Turlybek on 01.06.2025.
//

import Foundation
import SwiftUI
import Combine

class NewsImageViewModel: ObservableObject {
    
    
    private let article: Article
    private let dataService: NewsImageDataService
    
    init(article: Article) {
        self.article = article
        self.dataService = .ini()
    }
}
