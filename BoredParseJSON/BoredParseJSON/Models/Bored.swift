//
//  Bored.swift
//  BoredParseJSON
//
//  Created by Евгения Шевцова on 10.04.2022.
//

import Foundation

struct Bored: Decodable {
    let activity: String?
    let type: String?
    let participants: Int?
    let price: Double?
    let accessibility: Double?
    
    init(boredData: [String: Any]) {
    activity = boredData["activity"] as? String
    type = boredData["type"] as? String
    participants = boredData["participants"] as? Int
    price = boredData["price"] as? Double
    accessibility = boredData["accessibility"] as? Double
    }
    
}
