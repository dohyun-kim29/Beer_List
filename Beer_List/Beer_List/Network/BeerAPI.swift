//
//  BeerAPI.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/29.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

enum BeerAPI {
    case List
    case Search(_ id: String)
    case Random
}

extension BeerAPI {
    var mainURL: String {
        return "https://api.punkapi.com/v2/beers"
    }
    
    var id: String {
        return UserDefaults.standard.string(forKey: "id") ?? "1"
    }
    
    var path: String {
        switch self {
        case .List:
            return ""
        case .Search:
            return "/\(id)"
        case .Random:
            return "/random"
            }
    }
}
