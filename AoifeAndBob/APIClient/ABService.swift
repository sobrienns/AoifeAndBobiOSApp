//
//  ABService.swift
//  AoifeAndBob
//
//  Created by Stephen O'Brien on 14/02/2023.
//

import Foundation

/// Primary service to get Rick and Morty data
final class ABService {
    /// Shared singleton instance
    static let shared = ABService()
    
    /// Privatized constructor
    private init(){
        
    }
    
    /// Send Rick and Morty API call
    ///  - Paramaters
    ///         - request: Request Instance
    ///         - Type: Type of object we expect
    ///         - compleation: Callback with data or error
    public func execute<T: Codable>(_ request: ABRequest,
                                    expecting type: T.Type,
                                    compleation: @escaping (Result<T, Error>) -> Void)
    {
        
    }
}
