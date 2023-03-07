//
//  ABRequest.swift
//  AoifeAndBob
//
//  Created by Stephen O'Brien on 14/02/2023.
//

import Foundation

/// Object that respresents the request a single API call
final class ABRequest {
    // Base url
    // Endpoint
    // Path Components
    // Query parameters
    // https://rickandmortyapi.com/api/character
    
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: ABEndpoint
    
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    /// The constructed URL in string format
    private var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            //name=value&name=value
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
            
        }
        print("URL: "+string)
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    // MARK: - Public
    public init(endpoint: ABEndpoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = [])
    {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}

extension ABRequest {
    static let listCharacterRequest = ABRequest(endpoint: .character)
}
