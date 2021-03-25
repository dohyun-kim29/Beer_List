//
//  RandomViewController.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/25.
//

import UIKit

class RandomViewController: UIViewController {
    
    @IBOutlet weak var beerInfoTextView: UITextView!
    @IBOutlet weak var randomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UiExtention()
        
    }
    
    
    
}

extension RandomViewController {
    
    func UiExtention() {
        randomButton.layer.cornerRadius = 10
    }
}
