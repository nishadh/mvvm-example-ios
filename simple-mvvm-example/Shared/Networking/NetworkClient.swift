//
//  NetworkClient.swift
//  simple-mvvm-example
//
//  Created by Nishadh Shanker Shrestha on 14/04/18.
//  Copyright © 2018 Nishadh Shrestha. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

class NetworkClient {
    
    static func get<K: Codable>(url: URL, completion: @escaping (Result<K>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            if let error = responseError {
                completion(.failure(error))
            } else if let jsonData = responseData {
                let decoder = JSONDecoder()
                do {
                    let objects = try decoder.decode(K.self, from: jsonData)
                    let result: Result<K> = Result.success(objects)
                    completion(result)
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
}
