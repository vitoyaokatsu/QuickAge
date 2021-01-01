//
//  CalDate.swift
//  QuickAge2
//
//  Created by Katsuhiko Yao on 2020/12/13.
//

import UIKit
import Foundation


extension ViewController {
    
    
    func resetTime(date: Date) -> Date {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)

        components.hour = 0
        components.minute = 0
        components.second = 0

        return calendar.date(from: components)!
    }

    func calcDateRemainder(firstDate: Date, secondDate: Date? = nil) -> Int{

        var retInterval:Double!
        let firstDateReset = resetTime(date: firstDate)

        if secondDate == nil {
            let nowDate: Date = Date()
            let nowDateReset = resetTime(date: nowDate)
            retInterval = firstDateReset.timeIntervalSince(nowDateReset)
        } else {
            let secondDateReset: Date = resetTime(date: secondDate!)
            retInterval = firstDate.timeIntervalSince(secondDateReset)
        }

        let ret = retInterval/86400
        
        print(Int(floor(ret)))
        age = Int(floor(ret))

        return Int(floor(ret))  // n日
    }
    

    
    func getAge(firstDate: Date, secondDate: Date? = nil) -> String {
        
        let calendar = Calendar.current
        
        //*****
//        let dateFrom = firstDate
//        let dateTo = secondDate!//変更baseDate
        //*****
        
        let dateFrom = calendar.dateComponents([.year, .month, .day], from: firstDate)
        let dateTo = calendar.dateComponents([.year, .month, .day], from: secondDate ?? firstDate)
        var comps: DateComponents
        
        comps = calendar.dateComponents([.year, .month, .day], from: dateFrom, to: dateTo)
        print(comps.year!, comps.month!, comps.day!)
        
//        print("dayBefore\(comps.day!)")
//        if (comps.day! < 0) {
//            comps.day! = comps.day! - 1
//        }

//        print("dayAfter\(comps.day!)")
        
        let ageStr = String(comps.year!) + "歳" + String(comps.month!) + "月" + String(comps.day!) + "日"
        
        return ageStr
    }
    
    
    
    func getAgeForDay(firstDate: Date, secondDate: Date? = nil) -> String {
        
        let calendar = Calendar.current
        //*****
//        let dateFrom = firstDate
//        let dateTo = secondDate!//変更
        //*****
        
        let dateFrom = calendar.dateComponents([.year, .month, .day], from: firstDate)
        let dateTo = calendar.dateComponents([.year, .month, .day], from: secondDate ?? firstDate)
        var comps: DateComponents
        
        comps = calendar.dateComponents([.day], from: dateFrom, to: dateTo)
        
        let ageStrForDay = String(comps.day!)
        let lifeDays: Int = Int(ageStrForDay) ?? 0
        
        let f = NumberFormatter()
            f.numberStyle = .decimal
            f.groupingSeparator = "," // 区切り文字を指定
            f.groupingSize = 3 // 何桁ごとに区切り文字を入れるか指定
            
        let result = f.string(from: NSNumber(integerLiteral: lifeDays)) ?? "\(lifeDays)"
        let lifeDaysString:String = result + "日"
        print(lifeDaysString)
        return lifeDaysString
    }
    
}
