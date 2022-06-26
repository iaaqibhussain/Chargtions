//
//  Created by aaqib.hussain on 15.05.22.
//

import Foundation

enum RequestType: String {
  case GET
  case POST
}

protocol Request {
    var baseURL: String { get }
    var path: String { get }
    var version: String { get }
    var requiresAPIKey: Bool { get }
    var queryParams: [String : String] { get }
    var requestType: RequestType { get }
    var params: [String : Any] { get }
}

extension Request {
    var baseURL: String {
        "api.openchargemap.io"
    }

    var apiKey: [String: String] {
        ["key" : "you-api-key-here"]
    }

    var version: String {
        "/v3"
    }

    var requiresAPIKey: Bool {
        true
    }

    var params: [String : Any] {
        [:]
    }
    
    func createRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseURL
        components.path = path
        var queryItems: [URLQueryItem] = []
        if requiresAPIKey {
            let apiKeyQueryItem = apiKey.map { URLQueryItem(name: $0, value: $1) }
            queryItems += apiKeyQueryItem
        }

        if !queryParams.isEmpty {
            queryItems += queryParams.map { URLQueryItem(name: $0, value: $1) }
        }
        components.queryItems = queryItems

        guard let url = components.url else { throw  NetworkError.invalidURL }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
//        print("URL:", urlRequest.url?.absoluteString)

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if !params.isEmpty {
          urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }

        return urlRequest
    }
}
