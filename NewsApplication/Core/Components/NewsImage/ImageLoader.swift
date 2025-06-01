//
//  ImageLoader.swift
//  NewsApplication
//
//  Created by Dostan Turlybek on 01.06.2025.
//
import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    @Published var failed = false

    static let cache = NSCache<NSURL, UIImage>()
    private var url: URL?

    func load(from urlString: String) {
        guard let url = URL(string: urlString) else { failed = true; return }
        self.url = url

        if let cached = ImageLoader.cache.object(forKey: url as NSURL) {
            self.image = cached
            return
        }

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let img = UIImage(data: data) {
                    await MainActor.run {
                        ImageLoader.cache.setObject(img, forKey: url as NSURL)
                        if self.url == url {
                            self.image = img
                            self.failed = false
                        }
                    }
                } else {
                    await MainActor.run { self.failed = true }
                }
            } catch {
                await MainActor.run { self.failed = true }
            }
        }
    }

    func retry() {
        if let url = url {
            load(from: url.absoluteString)
        }
    }
}
