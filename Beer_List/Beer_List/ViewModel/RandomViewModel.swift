//
//  RandomViewModel.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/29.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire

class RandomViewModel {
    
    let disposeBag = DisposeBag()
    
    func randomRequest() {
        requestJSON(.get, "\(mainUrl)/random")
            .subscribe(
                onNext: { res, json in
                    
                    switch res.statusCode {
                    case 200:
                            print(json)
                        do {
                            
                            let jsonData = (try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)) ?? Data()
                            let listData = try decoder.decode(Array<BeerListModel>.self, from: jsonData)
                            print(listData)
                            
                            
                        } catch {
                            print(error)
                        }
                    default :
                        print("err")
                    }
                }
            ).disposed(by: disposeBag)
    }
    
}
