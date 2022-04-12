//
//  NetworkManager.swift
//  BoredParseJSON
//
//  Created by Евгения Шевцова on 10.04.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager{
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchActivity(from url: String?, completion: @escaping (Result<Bored, NetworkError>) ->Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                guard let bored = try? JSONDecoder().decode(Bored.self, from: data) else {
                    completion(.failure(.decodingError))
                    return
                }
                completion(.success(bored))
            }
        }.resume()
    }
    
}

