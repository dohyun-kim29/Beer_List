//
//  ListViewController.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/25.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire

class ListViewController: UIViewController {
    
    let listData: Observable<[BeerListModel]> = BeerAPIClient.shared.networking(from: .List)
    
    @IBOutlet weak var beerListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        uiBind()
        
        
    }
    func uiBind() {
        listData
            .bind(to: beerListTableView.rx.items(cellIdentifier: "BeerListTableViewCell" , cellType: BeerListTableViewCell.self)) { idx, data, cell in
                cell.beerListImageView.kf.setImage(with: URL(string: data.image_url ?? ""))
                cell.beerListNameTextField.text = data.name ?? "이름이 없습니다"
                cell.beerListNumberTextField.text = String(data.id ?? 0)
                cell.beerListDescriptionTextView.text = data.description
                cell.selectionStyle = .none
            }.disposed(by: disposeBag)
            
    }
    
}

