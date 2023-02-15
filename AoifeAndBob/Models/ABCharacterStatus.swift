//
//  ABCharterStatus.swift
//  AoifeAndBob
//
//  Created by Stephen O'Brien on 15/02/2023.
//

import Foundation

enum ABCharacterStatus: String, Codable {
    //Alive', 'Dead' or 'unknown'
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
