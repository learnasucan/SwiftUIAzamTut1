//
//  APIManager.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 30/11/23.
//

import Foundation

class APIManager {
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    func makeAPICall<T: Decodable>( urlString: String,
                                    method: HTTPMethod,
                                    parameters: [String: String]? = nil,
                                    completion: @escaping(Result<T,Error>) -> Void){
        
        // Construct URL
        guard var urlComponents = URLComponents(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0,userInfo: nil)))
            return
        }
        
        // Add parameters to URL
        urlComponents.queryItems = parameters?.map{URLQueryItem(name: $0, value: $1)}
        
        guard let url  = urlComponents.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0,userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        //ADD headers
        let headers = [
            "X-RapidAPI-Key": "6d71ccd759msh138af734c895584p18bfaajsn50881cdba0a1",
            "X-RapidAPI-Host": "climate-news-feed.p.rapidapi.com"
        ]
        
        headers.forEach({ key,value in
            request.setValue(value, forHTTPHeaderField: key)
        })
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                completion(.failure(NSError(domain: "No data received", code: 0,userInfo: nil)))
                return
            }
            
            do {
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodeData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
