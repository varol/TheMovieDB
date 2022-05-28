//
//  APIError.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

extension APIClientError {
    fileprivate enum Constants {
        static let errorTitle: String = "Sorry!"
        static let defaultNetworkErrorCode: Int = 500
        enum ErrorMessages {
            enum ClientErrorMessages {
                static let decodingErrorClientMessage: String = "Houston, we have a problem!"
                static let networkErrorClientMessage: String = "Houston, we have a problem"
                static let timeoutErrorClientMessage: String = "Houston, we have a problem"
            }

            enum DebugErrorMessages {
                static let decodingErrorDebugMessage: String = "Decoding Error"
                static let networkErrorDebugMessage: String = "Houston, we have a problem"
                static let timeoutErrorDebugMessage: String = "Houston, we have a problem"
            }
        }
    }
}


import Foundation

public protocol APIError: Decodable {
    var message: String { get }
    var debugMessage: String { get }
    var code: Int { get }
    var result: Bool { get }
}

struct ClientError: APIError {
    var message: String
    var debugMessage: String
    var code: Int
    var result: Bool
}

public enum APIClientError: Error {
    case handledError(error: APIError)
    case networkError
    case decoding(error: DecodingError?)
    case timeout
    case message(String)

    public var message: String {
        switch self {
        case .handledError(let error):
            return error.message
        case .decoding:
            return Constants.ErrorMessages.ClientErrorMessages.decodingErrorClientMessage
        case .networkError:
            return Constants.ErrorMessages.ClientErrorMessages.networkErrorClientMessage
        case .timeout:
            return Constants.ErrorMessages.ClientErrorMessages.timeoutErrorClientMessage
        case .message(let message):
            return message
        }
    }

    public var title: String {
        switch self {
        case .handledError, .decoding, .networkError, .timeout, .message:
            return Constants.errorTitle
        }
    }

    public var debugMessage: String {
        switch self {
        case .handledError(let error):
            return error.message
        case .decoding(let decodingError):
            guard let decodingError = decodingError else { return Constants.ErrorMessages.DebugErrorMessages.decodingErrorDebugMessage }
            return "\(decodingError)"
        case .networkError:
            return Constants.ErrorMessages.DebugErrorMessages.networkErrorDebugMessage
        case .timeout:
            return Constants.ErrorMessages.DebugErrorMessages.timeoutErrorDebugMessage
        case .message(let message):
            return message
        }
    }

    public var code: Int {
        switch self {
        case .handledError(let error):
            return error.code
        default:
            return Constants.defaultNetworkErrorCode
        }
    }
}

