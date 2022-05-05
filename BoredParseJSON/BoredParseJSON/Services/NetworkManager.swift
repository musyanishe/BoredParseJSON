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
    case invalidStatusCode
}

class NetworkManager{
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchActivity(from url: String?, completion: @escaping (Result<Bored, NetworkError>) ->Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidStatusCode))
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
    
    func fetchAlamofireActivity(from url: String, completion: @escaping(Result<Bored, NetworkError>) -> Void) {
        AF.request("https://www.boredapi.com/api/activity")
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let boredData = value as? [String: Any] else { return }
                    let bored = Bored(value: boredData)
                    print(bored)
                    completion(.success(bored))
                case .failure(let error):
                    print(error)
                    completion(.failure(.decodingError))
                }
            }
    }
    
    func fetchActivityWitkAutoParsing(from url: String, completion: @escaping(Result<Bored, NetworkError>) -> Void) {
        AF.request("https://www.boredapi.com/api/activity")
            .validate()
            .responseDecodable(of: Bored.self) { dataResponse in
                switch dataResponse.result {
                case .success(let Bored):
                    let bored = Bored
                    completion(.success(bored))
                case .failure(let error):
                    print(error)
                    completion(.failure(.decodingError))
                }
                
            }
    }
    
}

