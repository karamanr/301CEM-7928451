//
//  OfferModel.swift
//  WA
//
//  Created by Ridvan Karaman on 04/12/2019.
//  Copyright © 2019 Ridvan Karaman. All rights reserved.
//

import Foundation
// MARK: set up variables to access the API
class OfferModel:Codable {
    
    var cod:String?
    var message:Float?
    var cnt:Float
    var list:[ListOfferModel]?
    var city:CityModel?
}
