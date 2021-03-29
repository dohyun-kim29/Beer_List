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
    
    @IBOutlet weak var randomImageView: UIImageView!
    @IBOutlet weak var beerNumberTextView: UILabel!
    @IBOutlet weak var beerInfoTextView: UITextView!
    @IBOutlet weak var randomButton: UIButton!
    
    let disposeBag = DisposeBag()
    var viewModel = RandomViewModel()
    var randomData = BeerListModel.init(id: 0, name: "", description: "", image_url: "")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.randomRequest()
        UiExtention()
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIBind()
    }
    
}

extension RandomViewController {
    
    func UiExtention() {
        self.randomButton.layer.cornerRadius = 10
    }
    
    func UIBind() {
        Observable.of(randomData)
            .bind { data in
            print(data)
                self.randomImageView.kf.setImage(with: URL(string: data.image_url))
                self.beerNumberTextView.text = String(data.id)
                self.beerInfoTextView.text = String(data.description)
        }.disposed(by: disposeBag)
        
        //        self.randomImageView.kf.setImage(with: URL(string: self.viewModel.randomBeerInfo.image_url!))
        //        self.beerNumberTextView.text = String(self.viewModel.randomBeerInfo.id!)
        //        self.beerInfoTextView.text = self.viewModel.randomBeerInfo.description!
    }
    
    
    
    
}
