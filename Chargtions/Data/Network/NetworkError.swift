//
//  Created by aaqib.hussain on 15.05.22.
//

import Foundation

public enum NetworkError: LocalizedError {
    case invalidServerResponse
    case invalidURL
    case invalidToken
    case error(Error)
    public var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return "The server returned an invalid response."
        case .invalidURL:
            return "URL string is malformed."
        case .invalidToken:
            return "Token is invalid"
        case let .error(error):
            return error.localizedDescription

        }
    }
}
