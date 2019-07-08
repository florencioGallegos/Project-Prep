//
//  CollectionViewCell.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/7/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func customInit(textOne: String, textTwo: String, textThree: String, textFour: String) {
        
        titleLabel.text = textOne
        authorLabel.text = textTwo
        publisherLabel.text = textThree
        publishDateLabel.text = textFour
    }
}
