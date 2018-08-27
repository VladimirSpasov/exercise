//
//  UIViewControler + Formats.swift
//  exercise
//
//  Created by SPASOV DIMITROV Vladimir on 27/8/18.
//  Copyright © 2018 SPASOV DIMITROV Vladimir. All rights reserved.
//

import UIKit

class Formater {
    static func getFormattedDate(string: String ) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd"
        
        let date: Date? = dateFormatterGet.date(from: string)
        print("Date",dateFormatterPrint.string(from: date!))
        return dateFormatterPrint.string(from: date!);
    }
    
    static func getAmountString(amount: Amount) -> String{
        return "\(amount.value) \(amount.currencyISO)"
    }
}
