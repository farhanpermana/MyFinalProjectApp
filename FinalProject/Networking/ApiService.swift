//
//  ApiService.swift
//  FinalProject
//
//  Created by Farhan Permana on 16/04/23.
//

import Foundation

protocol ApiServiceProtocol {
    
    func callAPI<T:Codable>(url urlString: String, model:T.Type, completion: @escaping (Result<T,Error>) -> Void)
}

class ApiService: ApiServiceProtocol {
    
    func callAPI<T>(url urlString: String, model: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                    print("succes call")
                } catch {
                    completion(.failure(error))
                    print("failed call", error)
                }
            }
        }.resume()
        
    }
    
    
}
