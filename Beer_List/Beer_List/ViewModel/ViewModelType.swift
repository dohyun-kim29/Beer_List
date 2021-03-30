//
//  ViewModelType.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/30.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}
