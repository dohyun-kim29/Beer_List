//
//  ListViewModel.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/26.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

class ListViewModel {
    
    let disposeBag = DisposeBag()
    
    func ListRequest() {
        
        requestJSON(.get, mainUrl)
            .subscribe(
                onNext: { res, json in
                    
                    switch res.statusCode {
                    case 200:
//                        print(json)
                        do {
                            
                            let jsonData = (try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)) ?? Data()
                            let listData = try decoder.decode(BeerListModel.self, from: jsonData)
                            print(listData)
                            
                            
                        } catch {
                            print(error)
                        }
                    default :
                        print("err")
                    }
                }
            ).disposed(by: disposeBag)
        
//        AF.request(mainUrl, method: .get).responseData { response in
//
//            switch response.result {
//            case .success(let res):
//                if let nsDic = res as? NSDictionary {
//                    for (key, value) in nsDic {
//                        print("key: \(key), value: \(value)")
//                    }
//                }
//
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
    }
}
