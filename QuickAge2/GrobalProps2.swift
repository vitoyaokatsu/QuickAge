//
//  GrobalProps2.swift
//  QuickAge2
//
//  Created by Katsuhiko Yao on 2020/12/13.
//

import Foundation
import UIKit
import EventKit

// for set date at MainVCActions
var yearOnesNumber2: Int = 0
var yearTenthNumber2: Int = 0
var yearhundredNumber2: Int = 0
var yearThousoandNumber2: Int = 0
var yearNumber2: Int = 0


var monthOnesNumber2: Int = 0
var monthTenthNumber2: Int = 0
var monthNumber2: Int = 0


var tensNumber2: Int = -1
var onesNumber2: Int = -1
var firstTapOnesNumber2: Int = -1
var secondTapOnesNumber2: Int = -1
var dayNumber2: Int = -1

var setYearLabel2Tapped = false
var setmonthLabel2Tapped = false
var setdayLabel2Tapped = false

var searchDay2: String = "dayString"
var searchYear2: String = "yearString"
var searchMonth2: String = "monthString"
var baseDay: String = "baseDayString"
var baseDate: Date = Date()

var age: Int = 0


extension Calendar {
   func isJapaneseCalendar() -> Bool {
        return self.identifier == Calendar.Identifier.japanese
    }
}

func getNengo(searchDate: Date)->(String){
    let nengo = DateFormatter()
    nengo.locale = Locale.current
    nengo.calendar = Calendar(identifier: .japanese)
    nengo.dateFormat = "Gy" 

    var nengoStr = nengo.string(from: searchDate)
    print("nengoStr \(nengoStr)")
    return nengoStr
}



func getBaseDayStringFromBaseDay(searchDate: Date)->(String){
    var baseDayStr = baseDay
    let baseYear = getYearText(serchDate: searchDate)
    let baseMonth = getMonthText(serchDate: searchDate)
    let baseDay = getDayText(serchDate: searchDate)
    baseDayStr = baseYear + "." + baseMonth + "." + baseDay
    print("baseDayStr \(baseDayStr)")
    return baseDayStr
}

func createImageFromUIColor(color: UIColor) -> UIImage {
  // 1x1のbitmapを作成
  let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
  UIGraphicsBeginImageContext(rect.size)
  let context = UIGraphicsGetCurrentContext()
  // bitmapを塗りつぶし
    context!.setFillColor(color.cgColor)
    context!.fill(rect)
  // UIImageに変換
  let image = UIGraphicsGetImageFromCurrentImageContext()
  UIGraphicsEndImageContext()
    return image!
}
