//
//  NewsCardView.swift
//  NewsApplication
//
//  Created by Dostan Turlybek on 01.06.2025.
//
import SwiftUI

struct NewsCardView: View {
    
    @StateObject private var loader: ImageLoader = ImageLoader()
    @State private var image: UIImage? = nil
    @State private var task: Task<Void, Never>? = nil
    let article: Article?
    
    init(article: Article?) {
        print("apear")
        self.article = article
    }
    
    var body: some View {
        if let article = article{
            ZStack{
                VStack(alignment: .leading){
                    if let img = loader.image {
                        Image(uiImage: img)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .onTapGesture{
                                if let url = article.url {
                                    UIApplication.shared.open(URL(string: url)!)
                                }
                            }
                        
                    } else if loader.failed {
                        Button("Retry") {
                            loader.retry()
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                    } else {
                        if article.urlToImage != nil {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text(article.title ?? "")
                            .font(.title2)
                            .bold()
                        
                        
                        Text(article.description ?? "")
                            .font(.caption)
                        
                        if let author = article.author{
                            HStack{
                                Spacer()
                                Text(author)
                                    .font(.caption)
                                    .bold()
                            }
                        }
                    }
                    .onTapGesture{
                        if let url = article.url {
                            UIApplication.shared.open(URL(string: url)!)
                        }
                    }
                }
                .shadow(radius: 5)
                }
            .onAppear {
                if let urlToImage = article.urlToImage {
                    loader.load(from: urlToImage)
                } else {
                    print("\(article.title ?? "") hasnt url to image")
                    print("\(article.urlToImage ?? "Really noting")")
                }
            }
        }
    }
}


