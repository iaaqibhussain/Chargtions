//
//  DataParser.swift
//  Chargtions
//
//  Created by aaqib.hussain on 15.05.22.
//

import Foundation

protocol DataParser {
    func parse<T: Decodable>(data: Data) throws -> T
}

final class DataParserImpl: DataParser {
    private var jsonDecoder: JSONDecoder

    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
    }

    func parse<T: Decodable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
