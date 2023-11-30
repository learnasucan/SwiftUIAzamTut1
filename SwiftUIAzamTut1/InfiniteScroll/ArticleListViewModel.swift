//
//  ArticleListViewModel.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 29/11/23.
//

import Foundation

class ArticleListViewModel: ObservableObject {
    
    @Published var articleList: ArticleList?
    @Published var articles: [Article] = [Article]()
    @Published var meta: Meta?
    @Published var currentPage: Int = 0
    @Published var loading: Bool = false
    
    func populateData(page: Int) {
        //Loading data then return
        guard !loading else { return }
        loading = true
        
        guard let url = URL(string: "https://climate-news-feed.p.rapidapi.com/page/\(currentPage)") else {
            loading = false
            return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        //Set headers
        
        request.setValue("6d71ccd759msh138af734c895584p18bfaajsn50881cdba0a1", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("climate-news-feed.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        //Set parameter
        
        var component = URLComponents(url: url, resolvingAgainstBaseURL: true)
        component?.queryItems = [URLQueryItem(name: "limit", value: "10")]
        
        // Add parameters to the URL
        if let urlWithParams = component?.url {
            request.url = urlWithParams
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            if let data = data {
                do {
                    let jsondata = try JSONDecoder().decode(ArticleList.self, from: data)
                    print("Decoded JSON data: \(jsondata)")
                    DispatchQueue.main.async { [weak self] in
                        guard let self else { return }
                        self.articleList = jsondata
                        self.meta = jsondata.meta
                        if currentPage < (self.meta?.totalPages ?? 0) {
                            self.articles.append(contentsOf: jsondata.articles)
                            self.currentPage += 1
                        }
                        self.loading = false
                    }
                } catch(let error) {
                    print("Error decoding JSON: \(error)")
                    debugPrint(error.localizedDescription)
                }
            }
        }.resume()
        
    }
    
}

