//
//  Party.swift
//  partyApp
//
//  Created by Yi on 16/12/4.
//  Copyright © 2016年 Yi. All rights reserved.
//

import Foundation
class Party: NSObject, NSCoding{
    let info: String
    let address: String
    
    let infoKey = "info"
    let addressKey = "address"
    
    init(info: String, address:String) {
        self.info = info
        self.address = address
    }
    
    required init?(coder aDecoder: NSCoder) {
        info = aDecoder.decodeObject(forKey: infoKey) as! String
        address = aDecoder.decodeObject(forKey: addressKey) as! String
    }
    
    func encode(with aCoder:NSCoder){
        aCoder.encode(info, forKey: infoKey)
        aCoder.encode(address, forKey: addressKey)
    }
}
