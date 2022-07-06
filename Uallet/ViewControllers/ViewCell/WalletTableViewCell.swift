//
//  WalletTableViewCell.swift
//  Uallet
//
//  Created by Estefania Sassone on 05/04/2022.
//

import UIKit

class WalletTableViewCell: UITableViewCell {
    
        //Labels
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    
    @IBOutlet weak var currencyIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
