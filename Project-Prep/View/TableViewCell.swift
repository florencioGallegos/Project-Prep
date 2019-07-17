//
//  TableViewCell.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/7/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customInit(imageString: String, textOne: String, textTwo: String, textThree: String, textFour: String) {
        
        if let imageURL = URL(string: imageString) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.bookImage.image = image
                        }
                    }
                }
            }
        titleLabel.text = textOne
        authorLabel.text = textTwo
        publisherLabel.text = textThree
        publishDateLabel.text = textFour
    }
}
