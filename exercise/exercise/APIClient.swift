//
//  APIClient.swift
//  exercise
//
//  Created by SPASOV DIMITROV Vladimir on 27/8/18.
//  Copyright © 2018 SPASOV DIMITROV Vladimir. All rights reserved.
//

import Alamofire
import CodableAlamofire

class APIClient {
    
    static let shared = APIClient()
    private init(){}
    
    let baseUrl = "https://www.mocky.io/v2/5b33bdb43200008f0ad1e256"
    
    func getData(completion: @escaping ([Datum]?)->Void) {
        
        let url = baseUrl
        let decoder = JSONDecoder()
        
        Alamofire.request(url).responseDecodableObject(keyPath: nil, decoder: decoder) { (response: DataResponse<ApiResponse>) in
            
            guard response.result.isSuccess else {
                print("There was a problem fetching data")
                completion(nil)
                return
            }
            
            guard let value = response.result.value?.data else {
                    print("Malformed data received api service")
                    completion(nil)
                    return
            }
            
            
            completion(response.result.value?.data)
        }
    }
    
}
