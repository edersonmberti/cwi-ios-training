//
//  API.swift
//  Coffee
//
//  Created by Ederson Machado on 13/10/20.
//

import Foundation

class Api {
    let baseUrl: String = "http://localhost:3000"
    
    func request<T: Decodable>(endpoint: Endpoint, success: @escaping SuccessResult<T>, fails: @escaping FailsResult) {
        let entireUrl = "\(baseUrl)/\(endpoint.url)"
        
        print(entireUrl)
        
        guard let url = URL(string: entireUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                // TODO : - Validate error
                return
            }
            
            guard let data = data else {
                // TODO : - Validade invalid data
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let convertedData = try decoder.decode(T.self, from: data)
                
                success(convertedData)
            } catch {
                // TODO : - Handle error
                print(error)
            }
            
        }.resume()
    }
}

typealias SuccessResult<T: Decodable> = (T) -> Void
typealias FailsResult = (String) -> Void
