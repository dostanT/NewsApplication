//
//  NewsModel.swift
//  NewsApplication
//
//  Created by Dostan Turlybek on 31.05.2025.
//
import Foundation

// url https://newsapi.org/v2/everything?q=bitcoin&apiKey=107a6a88841d45969667c330fddcba30

// MARK: - Welcome
struct NewsModel: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Decodable, Identifiable{
    var id = UUID().uuidString
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
    
    private enum CodingKeys: String, CodingKey {
       case source, author, title, description, url, urlToImage, publishedAt, content
   }
}

// MARK: - Source
struct Source: Decodable {
    let id: String?
    let name: String?
}
