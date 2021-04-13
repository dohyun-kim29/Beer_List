//
//  BeerAPIClient.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/29.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

class BeerAPIClient {
    static let shared = BeerAPIClient()
    func networking<T: Codable>(from api: BeerAPI) -> Observable<T> {
        Observable.create { (obs) -> Disposable in
            if NetworkReachabilityManager()!.isReachable {
                requestJSON(.get, api.mainURL + api.path)
                    .subscribe( onNext: { res, json in
                        debugPrint(res)
                        
                        switch res.statusCode {
                        case 200:
                            do {
                                let jsonData = (try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)) ?? Data()
                                let listData: T = try JSONDecoder().decode(T.self, from: jsonData)
                                return obs.onNext(listData)
                            } catch(let err) {
                                return obs.onError(err)
                            }
                        default:
                            print("error")
                        }
                    }
                    ).disposed(by: disposeBag)
            } else {
                obs.onError(ErrCode.internalServerError)
                return  Disposables.create()
            }
            return Disposables.create {
                
            }
        }
    }
}
