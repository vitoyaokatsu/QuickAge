//
//  Date.swift
//  QuickDate2
//
//  Created by Katsuhiko Yao on 2020/11/24.
//

import Foundation

extension Date {
    
    func toStringWithCurrentLocale() -> String {

        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        return formatter.string(from: self)
    }
    
    func removeTimes() -> Date {
        
        let dtComp = Calendar.current.dateComponents([.year,.month,.day], from: self)
        
        guard let date = Calendar.current.date(from: dtComp) else {
            fatalError("Failed to strip time from Date object")
        }
        return date
    }
    
    
    func convertDateToStr(with dateformat: String) -> String {
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = dateformat
        
        return formatter.string(from: self)

    }
    
    func editDate(year: Int = 0, month: Int = 0, day: Int = 0, hour: Int = 0, min: Int = 0, second: Int = 0) -> Date {
        
        let calendar = Calendar.current
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = min
        components.second = second
        

        let dt = calendar.date(byAdding: components, to: self)! //
        
        return dt
    }
    
}

