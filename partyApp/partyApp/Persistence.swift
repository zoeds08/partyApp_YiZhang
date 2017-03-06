//
//  Persistence.swift
//  partyApp
//
//  Created by Yi on 16/12/4.
//  Copyright © 2016年 Yi. All rights reserved.
//

import Foundation
import UIKit

class Persistence {
    
    let partiesKey = "parties"
    
    func addParty(party:Party){
        let userDefaults = UserDefaults.standard
        var parties = fetchParties()
        
        parties.append(party)
        
        let data = NSKeyedArchiver.archivedData(withRootObject: parties)
        userDefaults.set(data, forKey: partiesKey)
        userDefaults.synchronize()
    }
    
    func fetchParties() -> [Party]{
        let userDefaults = UserDefaults.standard
        let parties = userDefaults.object(forKey: partiesKey) as? Data
        
        if  let parties = parties {
            return NSKeyedUnarchiver.unarchiveObject(with: parties) as! [Party]
        }
        else{
            return [Party]()
        }        
    }
    
    func removeParty(row:Int){
        let userDefaults = UserDefaults.standard
        var parties = fetchParties()
        
        parties.remove(at: row)
        
        let data = NSKeyedArchiver.archivedData(withRootObject: parties)
        userDefaults.set(data, forKey: partiesKey)
        userDefaults.synchronize()
    }
}
		
