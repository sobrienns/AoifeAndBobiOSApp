//
//  ABCharacter.swift
//  AoifeAndBob
//
//  Created by Stephen O'Brien on 14/02/2023.
//

import Foundation

struct ABCharacter: Codable {
      let id: Int
      let name: String
      let status: ABCharacterStatus
      let species: String
      let type: String
      let gender: ABCharacterGender
      let origin: ABOrigin
      let location: ABSingleLocation
      let image: String
      let episode: [String]
      let url: [String]
      let created: String   
}


