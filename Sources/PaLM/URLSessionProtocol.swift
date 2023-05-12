//
//  URLSessionProtocol.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

internal protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
