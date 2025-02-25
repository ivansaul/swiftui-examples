//
//  Errors.swift
//  AuthMovieDB
//
//  Created by @ivansaul on 10/12/24.
//
//  https://github.com/ivansaul
//

import Foundation

enum AuthError: Error, LocalizedError {
    case denied
    case canceled

    var errorDescription: String {
        switch self {
        case .denied:
            return "Your access has been denied. Please try again."
        case .canceled:
            return "The authentication process was canceled. Please try again."
        }
    }
}

enum NetworkingError: Error, LocalizedError {
    case badURL
    case badResponse
    case decodingFailed
    case encodingFailed
    case missingBody
    case requestFailed(_ statusCode: Int)
    case unknownError
}

extension NetworkingError {
    var errorDescription: String {
        switch self {
        case .badURL:
            return "The URL provided is not valid."
        case .badResponse:
            return "We received an unexpected response from the server."
        case .decodingFailed:
            return "We couldn't process the data from the server."
        case .encodingFailed:
            return "There was an issue preparing the data to send."
        case .missingBody:
            return "The request is missing necessary information to proceed."
        case .requestFailed(let statusCode):
            return "There was an issue with the request. Please try again later. [\(statusCode)]"
        case .unknownError:
            return "Something went wrong. Please try again."
        }
    }
}
