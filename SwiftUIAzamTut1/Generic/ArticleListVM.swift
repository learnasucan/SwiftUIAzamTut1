//
//  ArticleListVM.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 30/11/23.
//

import Foundation

class ArticleListVM: ObservableObject {
    
    @Published var articleList: ArticleList?
    @Published var articles: [Article] = [Article]()
    @Published var meta: Meta?
    @Published var currentPage: Int = 0
    @Published var loading: Bool = false
    
    func populateData(page: Int) {
        //Loading data then return
        guard !loading else { return }
        loading = true
        
        let urlString = "https://climate-news-feed.p.rapidapi.com/page/\(currentPage)"
        let parameters = [
            "limit": "10"
        ]
        
        let apiManager = APIManager()
        apiManager.makeAPICall(urlString: urlString, method: .get, parameters: parameters) {( result: Result<ArticleList,Error>) in
            switch result {
            case .success(let articleList):
                print(articleList)
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.meta = articleList.meta
                    if self.currentPage < (self.meta?.totalPages ?? 0) {
                        self.articles.append(contentsOf: articleList.articles)
                        self.currentPage += 1
                    }
                    self.loading = false
                }
               

            case .failure(let error):
                print(error)
            }
        }
                
    }
    
}
