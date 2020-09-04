//
//  API.swift
//  NoCloset
//
//  Created by Hélio Silva on 02/09/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import UIKit
    
    
extension TelaSeusLooks {
    // Chamando ela, A API
        
        func buscarCerebros() {

            let stringURL: String = "https://neurovault.org/api/images/?format=json"
            let url = URL(string:stringURL)!
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
                do {
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(Cerebro.self, from: data!)
                    
                   // DispatchQueue.main.async {
                    
                  //  self.cerebros = jsonData.results
                     //   encherCerebros(url: jsonData.results[1].thumbnail)
                   // NotificationCenter.default.post(name: NSNotification.Name("received data"), object: nil, userInfo: ["data": cerebros])
                
                  //  }
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
                
                
            }
            task.resume()
        }
    
}
