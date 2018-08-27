//
//  TransasctionTableViewCell.swift
//  exercise
//
//  Created by SPASOV DIMITROV Vladimir on 27/8/18.
//  Copyright © 2018 SPASOV DIMITROV Vladimir. All rights reserved.
//

import UIKit

class TransasctionTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var transactionLabel: UILabel!
    @IBOutlet weak var ammountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(data: Datum!) {
        guard data != nil else {
            print("Unable to setup cell with nil")
            return
        }
        
        let dateString = Formater.getFormattedDate(string: data.date)
        dateLabel.text = dateString
        
        transactionLabel.text = data.description
        
        ammountLabel.text = Formater.getAmountString(amount: data.amount)
        
    }
}

