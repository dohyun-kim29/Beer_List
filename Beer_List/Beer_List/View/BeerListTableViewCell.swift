//
//  BeerListTableViewCell.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/30.
//

import UIKit

class BeerListTableViewCell: UITableViewCell {

    @IBOutlet weak var beerListImageView: UIImageView!
    @IBOutlet weak var beerListNumberTextField: UILabel!
    @IBOutlet weak var beerListNameTextField: UILabel!
    @IBOutlet weak var beerListDescriptionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
