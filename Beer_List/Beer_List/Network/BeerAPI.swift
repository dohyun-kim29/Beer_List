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
    
    //SMS 참고하면서 네트워킹 코드를 짰는데 ud를 쓸 이유가 없는데 왜 다른 방법이 생각이 안나지...
    
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
