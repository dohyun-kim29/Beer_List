//
//  ErrorCode.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/30.
//

import Foundation

enum ErrCode: Error {
    case OK
    case created
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case proxyAuthenticationRequired
    case requestTimeout
    case conflict
    case tooManyRequest
    case internalServerError
    case serviceUnavaliable
}
