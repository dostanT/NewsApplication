//
//  NewsDataService.swift
//  NewsApplication
//
//  Created by Dostan Turlybek on 31.05.2025.
//

import Foundation
import SwiftUI

final class NetworkService {
    static let shared = NetworkService()
    private static let cache = NSCache<NSURL, UIImage>()
    private init() {}

    func fetchData<T: Decodable>(from urlString: String, as type: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let decodedData = try decoder.decode(T.self, from: data)

        return decodedData
    }
    
    func fetchImage(urlString: String) async throws -> UIImage{
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch {
            throw error
        }
    }
}
