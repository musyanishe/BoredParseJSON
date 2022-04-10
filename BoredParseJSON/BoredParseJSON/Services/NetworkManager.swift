//
//  NetworkManager.swift
//  BoredParseJSON
//
//  Created by Евгения Шевцова on 10.04.2022.
//

import Foundation

class NetworkManager{
    
    enum Result<Success, Error: Swift.Error>{
        case success(Success)
        case fail(Error)
    }
    
    static let shared = NetworkManager()
    let url = "https://www.boredapi.com/api/activity"
    func fetchActivity(from url: String, completion: @escaping (Result<Bored, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.fail(error!))
                return
            }
            do {
                guard let bored = try? JSONDecoder().decode(Bored.self, from: data) else {
                    completion(.fail(error!))
                    return
                }
                completion(.success(bored))
            }
        }.resume()
    }
    
    init() {}
}

