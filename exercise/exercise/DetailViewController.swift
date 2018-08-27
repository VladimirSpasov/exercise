//
//  DetailViewController.swift
//  exercise
//
//  Created by SPASOV DIMITROV Vladimir on 27/8/18.
//  Copyright © 2018 SPASOV DIMITROV Vladimir. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {

    @IBOutlet weak var transactionLabel: UILabel!
    
    @IBOutlet weak var ammountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productIconImageView: UIImageView!
    
    var data: Datum?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let unwrapedData = data {
            configureView(data: unwrapedData)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView(data: Datum) {
        transactionLabel.text = data.description
        ammountLabel.text = Formater.getAmountString(amount: data.amount)
        dateLabel.text = Formater.getFormattedDate(string: data.date)
        
        productLabel.text = data.product.title
        
        if let url = URL(string: data.product.icon) {
            productIconImageView.af_setImage(withURL: url)
        } else {
            print("Invalid url")
        }
        
        
    }
    

}
