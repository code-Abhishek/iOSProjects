//
//  placesCell.swift
//  customTableView-test
//
//  Created by AV on 08/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class PlacesCell: UITableViewCell {

    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImg.layer.cornerRadius = 5.0
        mainImg.clipsToBounds = true
    }

    func configureCell(img: UIImage, txt: String) {
        mainImg.image = img
        mainLbl.text = txt

    }
}
