//
//  NewsImageDataService.swift
//  NewsApplication
//
//  Created by Dostan Turlybek on 01.06.2025.
//
import Foundation
import SwiftUI
import Combine

class NewsImageDataService {
    @Published var image: UIImage? = nil
    private var imageSubscriptions: AnyCancellable?
    private let article: Article
    private let fileManager = LocalFileManager.instance
    private let folderName = "news_images"
    private let imageName: String
}
