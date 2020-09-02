//
//  API.swift
//  NoCloset
//
//  Created by Hélio Silva on 02/09/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension TelaSeusLooks {
    
    
    
    func localizacao(){
        
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
        
    }
    
    
    // Método obrigatório do CLL
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            

            
            let userLocation:CLLocation = locations[0] as CLLocation

            print("user latitude = \(userLocation.coordinate.latitude)")
            print("user longitude = \(userLocation.coordinate.longitude)")
            
            buscarClima(with: userLocation.coordinate.latitude, lon: userLocation.coordinate.longitude)
            
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
                if (error != nil){
                    print("error in reverseGeocode")
                }
            }

        }
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Error \(error)")
        }
        
        
        
    // Chamando ela, A API
        
        func buscarClima(with lat:Double, lon:Double) {

            let stringURL: String = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=57034834d880a3fb5ca09209d71c118f&units=metric&lang=pt_br"
            let url = URL(string:stringURL)!
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
                do {
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(Temperatura.self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.labelTemp.text = "\(jsonData.main.temp)°C"
                        self.labelCidade.text = jsonData.name
                        if jsonData.weather.count > 0 {
                            self.labelStatus.text = jsonData.weather[0].weatherDescription.capitalized
                            self.labelDicas.text = "Use roupas adequadas!"
                        } else {
                          self.labelStatus.text = "Deu problema!!!!"
                        }
                        
        
                        
                        
                        
                    
                    }
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
