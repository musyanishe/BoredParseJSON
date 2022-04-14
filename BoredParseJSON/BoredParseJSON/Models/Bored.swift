//
//  Bored.swift
//  BoredParseJSON
//
//  Created by Евгения Шевцова on 10.04.2022.
//

import Foundation

struct Bored: Decodable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let accessibility: Double
    
    init(value: [String: Any]) {
        activity = value["activity"] as? String ?? ""
        type = value["type"] as? String ?? ""
        participants = value["participants"] as? Int ?? 0
        price = value["price"] as? Double ?? 0
        accessibility = value["accessibility"] as? Double ?? 0
    }
    
    static func getBored(from value: Any) -> Bored? {
        guard let value = value as? Bored else { return nil }
        return value
    }
    
}
