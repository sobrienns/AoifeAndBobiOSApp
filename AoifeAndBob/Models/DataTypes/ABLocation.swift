//
//  ABLocation.swift
//  AoifeAndBob
//
//  Created by Stephen O'Brien on 14/02/2023.
//

import Foundation

struct ABLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
  }
