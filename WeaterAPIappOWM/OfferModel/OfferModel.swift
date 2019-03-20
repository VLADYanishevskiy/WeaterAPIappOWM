//
//  OfferModel.swift
//  WeaterAPIappOWM
//
//  Created by Владислав on 3/20/19.
//  Copyright © 2019 Владислав. All rights reserved.
//

import Foundation

class OfferModel:Codable{
    var cod:String?;
    var message:Float?;
    var cnt:Float;
    var list:[ListOfferModel]?;
}
