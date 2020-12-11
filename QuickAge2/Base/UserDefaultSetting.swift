//
//  UserDefaultSetting.swift
//  QuickDate2
//
//  Created by Katsuhiko Yao on 2020/11/24.
//


import Foundation

class UserDefaultSetting {
    
    enum Key: String {
        case backgroundColor = "backgroundColor"
        
        
    }
    
    enum SEKeys: String {
        case SE1 = "SE1"
        case SE2 = "SE2"
        case SE3 = "SE3"
    }
    
    
    private static let userDefault = UserDefaults.standard
    
    static func saveData(key: String, object: Any){
        UserDefaultSetting.userDefault.set(object, forKey: key)
    }
    
    static func getData(key:String) -> Any?{
        
        if let data =  UserDefaultSetting.userDefault.object(forKey: key) {
            return data
        }else {
            return nil
        }
    }
}

