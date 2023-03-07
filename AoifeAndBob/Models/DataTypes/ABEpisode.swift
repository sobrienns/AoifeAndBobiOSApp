//
//  ABEpisode.swift
//  AoifeAndBob
//
//  Created by Stephen O'Brien on 14/02/2023.
//

import Foundation

struct ABEpisode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
