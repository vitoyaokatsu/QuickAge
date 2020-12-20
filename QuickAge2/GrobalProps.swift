//
//  GrobalProps.swift
//  QuickDate2
//
//  Created by Katsuhiko Yao on 2020/11/24.
//


import Foundation
import UIKit
import EventKit

// for set date at MainVCActions
var yearOnesNumber: Int = 0
var yearTenthNumber: Int = 0
var yearhundredNumber: Int = 0
var yearThousoandNumber: Int = 0
var yearNumber: Int = 0

var monthOnesNumber: Int = 0
var monthTenthNumber: Int = 0
var monthNumber: Int = 0


var setYearButtonTapped: Bool = false
var setMonthButtonTapped: Bool = false
var setDayButtonTapped: Bool = false

var serchMonthInt: Int = Int(searchMonth) ?? 0

// --------------------

var taishoButtonTapped: Bool = false
var syowaButtonTapped: Bool = false
var heiseiButtonTapped: Bool = false
var reiwaButtonTapped: Bool = false
var willTapFirstButtonForNengo: Bool = false
var setNengoButtonTapped: Bool = false
var nengoStrForTap = "nengoStrForTap"
var nengoTappedNo = 0
var nengoToGregorianum = 0

var nengoOnesNumber = 0
var nengoTenthNumber = 0
var nengoNumber = 0


var tapCount: Int = 0

var tapcountForYear : Int = 0

var tensNumber: Int = -1

var onesNumber: Int = -1

var firstTapOnesNumber: Int = -1

var secondTapOnesNumber: Int = -1

var dayNumber: Int = -1


func dateFromString(string: String, format: String) -> Date {
    
    let formatter: DateFormatter = DateFormatter()
    
    formatter.timeZone = TimeZone.current
    
    formatter.calendar = Calendar(identifier: .gregorian)
    
    formatter.dateFormat = format
    
    return formatter.date(from: string)!
    
}

var searchDay: String = "dayString"

var searchYear: String = "yearString"

var searchMonth: String = "monthString"

// userDefault user
let notSetStr = "not set"
var seDay1: String = "not set"//1967/03/09
var seDay2: String = "not set"//"1993/02/12"
var seDay3: String = "not set"

var seDay1ForAlert: String = "SpecialEvent_1"
var seDay2ForAlert: String = "SpecialEvent_2"
var seDay3ForAlert: String = "SpecialEvent_3"
//var seDayForAlert: String = "SE For Alert"
var deleteSEDayForAlert: String = "deleteSEDay"
var setSEOKForAlert: Bool = false
//var saveSEDayNo: Int = 0

var SEday1Description: String = "AboutSEday1"
var SEday2Description: String = "AboutSEday2"
var SEday3Description: String = "AboutSEday3"


//searchDay = "2020/10/20"
// 選択された日付をDate型に更新する
var searchDate: Date = Date()

var SEDate1: Date = Date()

var SEDate2: Date = Date()

var SEDate3: Date = Date()


//for SEDays Message
var leftDays: Int = 0

var leftDaysString: String = "Just Today"


//MARK get day of the week
func getDateEText(isToday: Bool)->String {
    
    let dayFormatter = DateFormatter()
    
//        dayFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "E", options: 0, locale: Locale(identifier: "en_JP"))
//        dayFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "E", options: 0, locale: Locale(identifier: "ja_JP"))
    
    dayFormatter.timeZone = TimeZone.current
    
    dayFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "E", options: 0, locale: Locale.current)
//    dayFormatter.locale = Locale.init(identifier: "jp_JP")
    dayFormatter.locale = Locale.init(identifier: "en_JP")
    
    let todayE = Calendar.current.date(byAdding: .month, value: 0, to: searchDate)!
    
    let EText = dayFormatter.string(from: todayE)
    print("EText: \(EText)")
    return EText
    
    
}

 
func getEndOfMonthInCurrentDate(year: String, month: String) -> Int{
    
    // 2020-07
    var dateComponent = DateComponents()
    
    dateComponent.year = Int(year)
    
    dateComponent.month = Int(month)
    
    dateComponent.day = 1
    
    let calendar = Calendar.current
    //多分月の次の月にして1日前にして最終日を求めている
    guard let date = calendar.date(from: dateComponent), let modifiedDate = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: date) else {
        
        return 31
    }
    
    let endOfMonthComp = calendar.dateComponents([.day], from: modifiedDate)
    
    print("endOfMonthComp: \(endOfMonthComp)")
    
    return endOfMonthComp.day!
    
    
}




//MARK get dayText
func getDateDayText(isToday: Bool)->String {
    let dayFormatter = DateFormatter()
    
    dayFormatter.timeZone = TimeZone.current
    
    dayFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "d", options: 0, locale: Locale(identifier: "en_JP"))
    let today = Calendar.current.date(byAdding: .month, value: 0, to: searchDate)!
    let dayText = dayFormatter.string(from: today)
    return dayText
}

//MARK get month1.text and month2.text
func getDateMonthText(isThisMonth: Bool)-> String {
    
    let monthFormatter = DateFormatter()
    
    monthFormatter.timeZone = TimeZone.current
    
    monthFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "M", options: 0, locale: Locale(identifier: "en_JP"))
    
    let addingMonth = Calendar.current.date(byAdding: .month, value: tapCount, to: searchDate)!
    print("addingMonth at GP: \(addingMonth)")
    
    if(isThisMonth){
        
        let month1Text = monthFormatter.string(from: addingMonth)
        searchMonth = month1Text
        print("searchMonth-month1Text at GP-GDMT: \(searchMonth)")
        
        return month1Text
        
    }else{
        
        var month2 = Int(monthFormatter.string(from: addingMonth))! + 1
        
        if ( month2 == 13) {
             month2 = 1
        }else{

        }
        
        let month2Text = String(month2)
        print("searchMonth-month2Text at GP-GDMT: \(searchMonth)")

        return month2Text
    }
    
}

//MARK get yearText
func getDateYearText(isThisYear: Bool)-> String {
    
//        var tapcountForYear : Int = 0
    tapcountForYear = tapCount
    
    let yearFormatter = DateFormatter()
    
    yearFormatter.timeZone = TimeZone.current
    
    yearFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy", options: 0, locale: Locale(identifier: "en_JP"))
    
    let addingMonth = Calendar.current.date(byAdding: .month, value: tapcountForYear, to: searchDate)!
    
    if(isThisYear){
        let year1Text = yearFormatter.string(from: addingMonth)
        searchYear = yearFormatter.string(from: addingMonth)
        print("tapcountForYear: \(tapcountForYear) ")
        return year1Text
        
    }else{
        tapcountForYear = tapcountForYear + 1
        print("tapcountForYear: \(tapcountForYear) ")
        
        let addingYear = Calendar.current.date(byAdding: .month, value: tapcountForYear, to: searchDate)!
        var year2 = Int(yearFormatter.string(from: addingYear))!
        
        let year2Text = String(year2)

        return year2Text
    }
    
}

func getEText(searchDate: Date)->String{
    let dayFormatter = DateFormatter()
    
    dayFormatter.timeZone = TimeZone.current
    dayFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "E", options: 0, locale: Locale(identifier: "en_JP"))
//        DateFormatter.dateFormat(fromTemplate: "E", options: 0, locale: Locale(identifier: "jp_JP"))
    let EText = dayFormatter.string(from: searchDate)
    return EText
}

func getYearText(serchDate: Date)->String{
    let dayFormatter = DateFormatter()
    dayFormatter.timeZone = TimeZone.current
    dayFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy", options:0, locale: Locale(identifier: "en_JP"))
    let yearText = dayFormatter.string(from: serchDate)
    return yearText
}

func getMonthText(serchDate: Date)->String{
    let dayFormatter = DateFormatter()
    dayFormatter.timeZone = TimeZone.current
    dayFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "M", options:0, locale: Locale(identifier: "en_JP"))
    let monthText = dayFormatter.string(from: serchDate)
    return monthText
}

func getDayText(serchDate: Date)->String{
    let dayFormatter = DateFormatter()
    dayFormatter.timeZone = TimeZone.current
    dayFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "d", options:0, locale: Locale(identifier: "en_JP"))
    let yearText = dayFormatter.string(from: serchDate)
    return yearText
}

func getStartTimeText(serchDate: Date)->String{
    let dayFormatter = DateFormatter()
    dayFormatter.timeZone = TimeZone.current
    dayFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "Hm", options:0, locale: Locale(identifier: "en_JP"))
    let startTimeText = dayFormatter.string(from: serchDate)
    return startTimeText
}


func setThisMonthButtonText(serchDate: Date)->String{
    
    let thisMonthTxt = getYearText(serchDate: searchDate) + "\n" +  getMonthText(serchDate: searchDate)
//    thisMonthButton.titleLabel?.text = thisMonthTxt
    return thisMonthTxt
    
}

func setNextMonthButtonText(serchDate: Date)->String{
    
    searchDate = Calendar.current.date(byAdding: .month, value: 1, to: searchDate)!//okikaezunisumuka??
    
    let nextMonthTxt = getYearText(serchDate: searchDate) + "\n" + getMonthText(serchDate: searchDate)
//    nextMonthButton.titleLabel?.text = nextMonthTxt
    return nextMonthTxt
    
}



func setLabelForSerchDay(){
    let EText = getEText(searchDate: searchDate)
    let yearText = getYearText(serchDate: searchDate)
    let monthText = getMonthText(serchDate: searchDate)
    let dayText = getDayText(serchDate: searchDate)
}




