//
//  APIService.swift
//  Wallet
//
//  Created by mac238 on 12/05/2024.
//

import Combine
import Foundation

enum FetchError: Error {
    case invalidUrl
    case unKnown
}

class APIService {
    static let shared = APIService()
    
    init(){}
    func fetchDataWithCombine<T: Codable>(for: T.Type, url: String) -> AnyPublisher<BaseModel<T>, Error> {
        return Future { promise in
            self.fetchData(for: T.self, url: url) { result in
                switch result {
                case .success(let model):
                    promise(.success(model))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func fetchData<T: Codable>(for: T.Type, url: String, completion: @escaping (Result<BaseModel<T>, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(FetchError.invalidUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let err = error {
                completion(.failure(err))
            } else if let d = data {
                do {
                    let model = try JSONDecoder().decode(BaseModel<T>.self, from: d)
                    completion(.success(model))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(FetchError.unKnown))
            }
        }
        task.resume()
    }
}
