//
//  SearchResultCell.swift
//  StoreSearchProxy
//
//  Created by Marvin Do on 7/12/18.
//  Copyright © 2018 Marvin Do. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    //MARK:- Outlets/Fields
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 0.5)
        selectedBackgroundView = selectedView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
