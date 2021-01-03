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
    
    enum AdKey: String {
        case counter = "ad_counter"
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


class AdCounter {
    
    static let shared = AdCounter()
    
    var counter = 0
    
    var maxCount = 5
    
    init() {
        self.readCounter()
    }
    
    func countUp() -> Bool{
        
        counter += 1
        
        if (counter >= maxCount){
            resetCounter()
            return true
        }else {
            setCounter()
            return false
        }
    }
    
    private func resetCounter(){
        self.counter = 0
        self.setCounter()
    }
    
    private func setCounter(){
        UserDefaultSetting.saveData(key: UserDefaultSetting.AdKey.counter.rawValue, object: self.counter)
    }
    
    private func readCounter(){
        self.counter = UserDefaultSetting.getData(key: UserDefaultSetting.AdKey.counter.rawValue) as? Int ?? 0
    }
}
