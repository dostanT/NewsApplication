//
//  HomeView.swift
//  NewsApplication
//
//  Created by Dostan Turlybek on 31.05.2025.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ZStack{
            VStack{
                List {
                    ForEach(vm.data?.articles ?? []) {article in
                        NewsCardView(article: article)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("News")
        }
        .task {
            await vm.getNews()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
