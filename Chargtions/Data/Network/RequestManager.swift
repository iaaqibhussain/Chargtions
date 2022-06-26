//
//  RequestManager.swift
//  Chargtions
//
//  Created by aaqib.hussain on 15.05.22.
//

import Foundation

protocol RequestManager {
    func execute<T: Decodable>(
        request: Request,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) throws
}

final class RequestManagerImpl: NSObject, RequestManager {
    private let urlSession: URLSession
    private let parser: DataParser

    init(
        urlSession: URLSession = URLSession.shared,
        parser: DataParser = DataParserImpl()
    ) {
        self.urlSession = urlSession
        self.parser = parser
    }

    func execute<T: Decodable>(
        request: Request,
        completion: @escaping (_ response: Result<T, NetworkError>) -> ()
    ) throws {
        urlSession.dataTask(with: try request.createRequest()) { (data, response, error) in
            if let data = data {
                do {
                    let model: T = try self.parser.parse(data: data)
                    completion(.success(model))
                } catch {
                    completion(.failure(.error(error)))
                }
            } else if let err = error {
                completion(.failure(.error(err)))
            }
        }.resume()
    }
}
