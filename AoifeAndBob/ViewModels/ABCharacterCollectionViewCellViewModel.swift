//
//  ABCharacterCollectionViewCellViewModel.swift
//  AoifeAndBob
//
//  Created by Stephen O'Brien on 24/02/2023.
//

import Foundation

struct ABCharacterCollectionViewCellViewModel {
    public let characterName: String
    private let characterStatus: ABCharacterStatus
    private let characterImageUrl: URL?
    
    // MARK - Init
    init(
        characterName: String,
        characterStatus: ABCharacterStatus,
        characterImageUrl: URL?
    ){
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return characterStatus.rawValue
    }
    
    public func fetchImage(compleation: @escaping (Result<Data,Error>)->Void){
        // TODO: Abstract to Image Manager
        guard let url = characterImageUrl else {
            compleation(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error==nil else {
                compleation(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            
            compleation(.success(data))
        }
        task.resume()
    }
}
