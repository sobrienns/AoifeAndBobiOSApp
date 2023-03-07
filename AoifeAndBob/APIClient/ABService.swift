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
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
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
        guard let urlRequest = self.request(from: request) else {
            compleation(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) {data, _, error in
            guard let data = data, error == nil else {
                compleation(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            //Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                compleation(.success(result))
            }
            catch {
                compleation(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - Private
    
    private func request(from rmRequest: ABRequest)->URLRequest?{
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}
