//
//  SearchViewModel.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/30.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire

class SearchViewModel: ViewModelType {
    
    struct Input {
        let idTextDriver: Driver<String>
        let searchButtonDriver: Driver<Void>
    }
    
    struct Output {
        let searchResult: Observable<[BeerListModel]>
    }
    
    func transform(_ input: Input) -> Output {
        let searchResponse = input.searchButtonDriver.asObservable()
            .withLatestFrom(input.idTextDriver.asObservable())
            .map { id -> BeerAPI in
                return BeerAPI.Search(id)
            }.flatMap { request -> Observable<[BeerListModel]> in
                BeerAPIClient.shared.networking(from: request)
            }.observe(on: MainScheduler.instance)
        return Output(searchResult: searchResponse)
            
    }
    
}
