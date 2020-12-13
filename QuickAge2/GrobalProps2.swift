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
