//
//  RandomViewController.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/25.
//

import UIKit
import RxSwift
import RxCocoa
import RxAlamofire
import Alamofire
import Kingfisher

class RandomViewController: UIViewController {
    
//    let viewModel = RandomViewModel()
    let randomData: Observable<[BeerListModel]> = BeerAPIClient.shared.networking(from: .Random)
    
    @IBOutlet weak var randomImageView: UIImageView!
    @IBOutlet weak var beerNumberTextField: UILabel!
    @IBOutlet weak var beerInfoTextView: UITextView!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var beerNameTextField: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        uiExtention()
        dataBind()
        uiBind()
        
    }

}

extension RandomViewController {
    
    func uiExtention() {
        self.randomButton.layer.cornerRadius = 10
    }
    
    func dataBind() {
        randomData
            .bind { data in
                self.randomImageView.kf.setImage(with: URL(string: data[0].image_url ?? ""))
                self.beerInfoTextView.text = data[0].description ?? "설명이 없습니다"
                self.beerNumberTextField.text = String(data[0].id ?? 0)
                self.beerNameTextField.text = data[0].name ?? "이름이 없습니다"
            }.disposed(by: disposeBag)
    }
    
    func uiBind() {
        randomButton.rx.tap
            .bind {
                self.dataBind()
            }.disposed(by: disposeBag)
    }
    
}
