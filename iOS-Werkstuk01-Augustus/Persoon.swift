//
//  File.swift
//  iOS-Werkstuk01-Augustus
//
//  Created by Mohamed Helalouch on 12/08/2019.
//  Copyright © 2019 Imane Helalouch. All rights reserved.
//

import UIKit

class Persoon {
    var firstName:String
    var lastName:String
    var image:String
    var streetName:String
    var streetNumber:String
    var postcode:String
    var city:String
    var phoneNumber:String
    
    var coordinaat1:Double
    var coordinaat2:Double
    
    init() {
        firstName = ""
        lastName = ""
        image = ""
        streetName = ""
        streetNumber = ""
        postcode = ""
        city = ""
        phoneNumber = ""
        coordinaat1 = 0
        coordinaat2 = 0
    }
    
    init(firstName: String, lastName:String, image:String, streetName:String, streetNumber:String, postcode:String, city:String,  phoneNumber:String, coordinaat1:Double, coordinaat2:Double){
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.streetName = streetName
        self.streetNumber = streetNumber
        self.postcode = postcode
        self.city = city
        self.phoneNumber = phoneNumber
        self.coordinaat1 = coordinaat1
        self.coordinaat2 = coordinaat2
    }
}
