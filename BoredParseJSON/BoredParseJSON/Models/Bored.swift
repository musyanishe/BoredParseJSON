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
}
