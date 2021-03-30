//
//  SearchViewController.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/25.
//

import UIKit
import RxCocoa
import RxSwift
import RxAlamofire
import Alamofire

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    private let viewModel = SearchViewModel()
    
    @IBOutlet weak var beerSearchBar: UISearchBar!
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNumberTextField: UILabel!
    @IBOutlet weak var beerNameTextField: UILabel!
    @IBOutlet weak var beerDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindAction()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
}

extension SearchViewController {
    func uiBind() {
        let input = SearchViewModel.Input(idTextDriver: beerSearchBar.rx.text.orEmpty.asDriver(), searchButtonDriver: beerSearchBar.rx.searchButtonClicked.asDriver())
        let output = viewModel.transform(input)
        output.searchResult
            .subscribe(onNext: { data in
                self.beerImageView.kf.setImage(with: URL(string: data[0].image_url ?? ""))
                self.beerNameTextField.text = data[0].name ?? "이름이 없습니다"
                self.beerNumberTextField.text = String(data[0].id!)
                self.beerDescriptionTextView.text = String(data[0].description ?? "설명이 없습니다")
            }).disposed(by: disposeBag)
    }
    
    func bindAction() {
        beerSearchBar.rx.searchButtonClicked
            .bind {
                UserDefaults.standard.setValue(self.beerSearchBar.text, forKey: "id")
                self.uiBind()
            }.disposed(by: disposeBag)
    }
}

