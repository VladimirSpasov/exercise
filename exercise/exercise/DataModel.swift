//
//  DataModel.swift
//  exercise
//
//  Created by SPASOV DIMITROV Vladimir on 27/8/18.
//  Copyright © 2018 SPASOV DIMITROV Vladimir. All rights reserved.
//

struct ApiResponse: Codable {
    let data: [Datum]
}

struct Datum: Codable {
    let id, date, description: String
    let categoryID: Int
    let currency: String
    let amount: Amount
    let product: Product
    
    enum CodingKeys: String, CodingKey {
        case id, date, description
        case categoryID = "category_id"
        case currency, amount, product
    }
}

struct Amount: Codable {
    let value: Double
    let currencyISO: String
    
    enum CodingKeys: String, CodingKey {
        case value
        case currencyISO = "currency_iso"
    }
}

struct Product: Codable {
    let id: Int
    let title: String
    let icon: String
}

