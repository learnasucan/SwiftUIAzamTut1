//
//  InfiniteScrollView.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 29/11/23.
//20

import SwiftUI

struct InfiniteScrollView: View {
    @StateObject private var articleListVM = ArticleListVM()

    var body: some View {
        
        List {
            ForEach(articleListVM.articles) { article in
                    Text(article.title)
                    .onAppear{
                        if article.title == articleListVM.articles.last?.title {
                            //Check if last irem in list
                            articleListVM.populateData(page: 1)
                        }
                    }
                }
        }.onAppear(perform: {
            articleListVM.populateData(page: 1)
        }).overlay {
            VStack{
                if articleListVM.loading {
                    ProgressView()
                        .padding()
                }else if let meta = articleListVM.meta {
                    Text("Page \(meta.currentPage) of \(meta.totalPages)")
                        .foregroundColor(.secondary)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    InfiniteScrollView()
}
