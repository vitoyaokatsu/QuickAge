//
//  MainVCActions.swift
//  QuickDate2
//
//  Created by Katsuhiko Yao on 2020/11/24.
//


import Foundation
import UIKit

extension ViewController {
  
    
    
    // label tapped and switch --------------------------
    @objc func tappedLabel(_ gesture: UITapGestureRecognizer){
        
        let label = gesture.view as! UILabel
        
        switch label {
            case yearLabel:
                self.searchButton.setTitle("年/検索", for: .normal)
                self.searchButton.titleLabel?.font = UIFont.systemFont(ofSize: doubleLetterBtnFontSize)
                yearButtonTapped()
            case monthLabel:
                self.searchButton.setTitle("月/検索", for: .normal)
                self.searchButton.titleLabel?.font = UIFont.systemFont(ofSize: doubleLetterBtnFontSize)
                monthButtonTapped()
            case dayLabel:
                self.searchButton.setTitle("日/検索", for: .normal)
                self.searchButton.titleLabel?.font = UIFont.systemFont(ofSize: doubleLetterBtnFontSize)
                dayButtonTapped()
            case nengoLabel:
                self.searchButton.setTitle("年/検索", for: .normal)
                self.searchButton.titleLabel?.font = UIFont.systemFont(ofSize: doubleLetterBtnFontSize)
                nengoButtonTapped()
            default:
                break
        }
    }
    
    
        
    //&&& YMD 1) YMDButton switch
    @objc func pushYMDButton(_ sender:UIButton){
        setNengoButtonTapped = false
        calculateAge()
        switch (sender) {
        case setYearButton:
            yearButtonTapped()
            self.searchButton.setTitle("年/検索", for: .normal)
            self.searchButton.titleLabel?.font = UIFont.systemFont(ofSize: doubleLetterBtnFontSize)
        case setMonthButton:
            monthButtonTapped()
            self.searchButton.setTitle("月/検索", for: .normal)
            self.searchButton.titleLabel?.font = UIFont.systemFont(ofSize: doubleLetterBtnFontSize)
        case setDayButton:
            dayButtonTapped()
            self.searchButton.setTitle("日/検索", for: .normal)
            self.searchButton.titleLabel?.font = UIFont.systemFont(ofSize: doubleLetterBtnFontSize)
            
        case todayButton:
            todayButton.setBackgroundImage(createImageFromUIColor(color: UIColor.onePlaceButtonColor), for: .highlighted)
            moveToToday()
            setYearButtonTapped = false
            setMonthButtonTapped = false
            setDayButtonTapped = false
            setNengoButtonTapped = false
            setYearButton.backgroundColor = .ymdButtonColor
            setMonthButton.backgroundColor = .ymdButtonColor
            setDayButton.backgroundColor = .ymdButtonColor
        default:
            setYearButtonTapped = false
            setMonthButtonTapped = false
            setDayButtonTapped = false
            setNengoButtonTapped = false
        }
    }
    
    
    
    //YMD 1-1) YbuttonTapped
    func yearButtonTapped(){
        setYearButtonTapped = true
        setMonthButtonTapped = false
        setDayButtonTapped = false
        setNengoButtonTapped = false
        yearLabel.textColor = .gray
        setYearButton.backgroundColor = .onePlaceButtonColor
        setMonthButton.backgroundColor = .ymdButtonColor
        setDayButton.backgroundColor = .ymdButtonColor
        searchYear = String(yearNumber)
        searchMonth = String(monthNumber)
        monthLabel.text = searchMonth
        dayLabel.text = String(dayNumber)
        calculateAge()
        yearLabel.textColor = .gray
    }
    
    func monthButtonTapped(){
        setYearButtonTapped = false
        setMonthButtonTapped = true
        setDayButtonTapped = false
        setNengoButtonTapped = false
        monthLabel.textColor = .gray
        setYearButton.backgroundColor = .ymdButtonColor
        setMonthButton.backgroundColor = .onePlaceButtonColor
        setDayButton.backgroundColor = .ymdButtonColor
        searchYear = String(yearNumber)
        yearLabel.text = searchYear
        dayLabel.text = String(dayNumber)
        calculateAge()
        monthLabel.textColor = .gray
    }
    
    func dayButtonTapped(){
        setYearButtonTapped = false
        setMonthButtonTapped = false
        setDayButtonTapped = true
        setNengoButtonTapped = false
        dayLabel.textColor = .gray
        setYearButton.backgroundColor = .ymdButtonColor
        setMonthButton.backgroundColor = .ymdButtonColor
        setDayButton.backgroundColor = .onePlaceButtonColor
        searchYear = String(yearNumber)
        yearLabel.text = searchYear
        searchMonth = String(monthNumber)
        monthLabel.text = searchMonth
        calculateAge()
        dayLabel.textColor = .gray
    }
    
    
    
    func nengoButtonTapped(){
        self.searchButton.setTitle("年/検索", for: .normal)
        self.searchButton.titleLabel?.font = UIFont.systemFont(ofSize: doubleLetterBtnFontSize)
        calculateAge()
        taishoButton.backgroundColor = .onePlaceButtonColor
        syowaButton.backgroundColor = .onePlaceButtonColor
        heiseiButton.backgroundColor = .onePlaceButtonColor
        reiwaButton.backgroundColor = .onePlaceButtonColor
        setYearButton.backgroundColor = .ymdButtonColor
        setMonthButton.backgroundColor = .ymdButtonColor
        setDayButton.backgroundColor = .ymdButtonColor
        setYearButtonTapped = false
        setMonthButtonTapped = false
        setDayButtonTapped = false
        setNengoButtonTapped = true
        willTapFirstButtonForNengo = true
        setYearButtonTapped = true
        nengoLabel.textColor = .gray
    }
    
    
    
    
    
    //&&& YMD 2-1) Y tapped
    @objc func pushOnesButton(_ sender: UIButton){
        if setNengoButtonTapped{
            setYearForNengo(number: sender.tag)
        }else if setYearButtonTapped{
            willTapForYearCount += 1
            if willTapForYearCount == 5 {
                willTapForYearCount = 0
                yearLabel.text = "----"
                yearLabel.textColor = .gray
            }
            setTappedDateForYear(number: sender.tag)
            print("sender.tag:\(sender.tag)")
            print("willTapForYearCount:\(willTapForYearCount)")
        }else if setMonthButtonTapped{
            setTappedDateForMonth(number: sender.tag)
        }else if setDayButtonTapped{
            setTappedDay(number: sender.tag)
        }
    }
    
    
    
    //&&& YMD 2-2) Set Year
    func setTappedDateForYear(number: Int){

            switch willTapForYearCount {
            case 1:
                yearLabel.textColor = .gray
                yearThousoandNumber = 0
                yearhundredNumber = 0
                yearTenthNumber = 0
                yearOnesNumber = number
                print("number43:\(number)")
                yearNumber = yearThousoandNumber * 1000 + yearhundredNumber * 100 + yearTenthNumber * 10 + yearOnesNumber
                if( yearNumber == 0 ){
                    searchYear = "0"
                }else {
                searchYear = String(yearNumber)
                print("tapcount=1: \(searchYear)")
                }
            case 2:
                yearThousoandNumber = 0
                yearhundredNumber = 0
                yearTenthNumber = yearOnesNumber
                yearOnesNumber = number
                yearNumber = yearThousoandNumber * 1000 + yearhundredNumber * 100 + yearTenthNumber * 10 + yearOnesNumber
                if yearNumber < 10{
                    searchYear = "0" + String(yearNumber)
                }else {
                searchYear = String(yearNumber)
                print("tapcount=2: \(searchYear)")
                }
            case 3:
                yearThousoandNumber = 0
                yearhundredNumber = yearTenthNumber
                yearTenthNumber = yearOnesNumber
                yearOnesNumber = number
                yearNumber = yearThousoandNumber * 1000 + yearhundredNumber * 100 + yearTenthNumber * 10 + yearOnesNumber
                if yearNumber < 10 {
                    searchYear = "00" + String(yearNumber)
                }else if yearNumber < 100 {
                    searchYear = "0" + String(yearNumber)
                }else {
                searchYear = String(yearNumber)
                print("tapcount=3: \(searchYear)")
                }
            case 4:
                yearThousoandNumber = yearhundredNumber
                yearhundredNumber = yearTenthNumber
                yearTenthNumber = yearOnesNumber
                yearOnesNumber = number
                yearNumber = yearThousoandNumber * 1000 + yearhundredNumber * 100 + yearTenthNumber * 10 + yearOnesNumber
                if yearNumber < 10 {
                    searchYear = "000" + String(yearNumber)
                }else if yearNumber < 100 {
                    searchYear = "00" + String(yearNumber)
                }else if yearNumber < 1000{
                    searchYear = "0" + String(yearNumber)
                }else {
                searchYear = String(yearNumber)
                print("tapcount=4: \(searchYear)")
                }
            default:
                yearNumber = Int(getDateYearText(isThisYear: true))!
                willTapForYearCount = 0
            }
        yearLabel.text = searchYear

    }

    
    
    //&&& YMD 3-1) M tapped
    @objc func pushOnesbuttonForMonth(_ sender:UIButton){
        setTappedDateForMonth(number: sender.tag)
    }
    
    //&&& YMD 3-2) Set Month
    func setTappedDateForMonth(number: Int){
        
        if(willTapFirstButtonForMonth){
            // first time
            monthOnesNumber = number
            monthTenthNumber = 0
            monthNumber = number
        }else {
            // second time
            monthTenthNumber = monthOnesNumber
            monthOnesNumber = number
            monthNumber = monthTenthNumber * 10 + monthOnesNumber
        }
        if willTapFirstButtonForMonth == false {
            if monthNumber < 1 {
                    monthNumber = 1
            }else if monthNumber > 12 {
                    monthNumber = 12
            }
        }
        
        searchMonth = String(monthNumber)
        
        monthLabel.text = String(monthNumber)
        monthLabel.textColor = .gray
        // switch boolean
        willTapFirstButtonForMonth.toggle()
        
        print("willtapFirstButtonMonth: \(willTapFirstButtonForMonth)")
    }
    
    
    
    //&&& YMD 4-1) D tapped
    @objc func pushOnesbuttonForDay(_ sender:UIButton){
        setTappedDay(number: sender.tag)
    }

    //&&& YMD 4-2) Set Day
    func setTappedDay(number: Int){
        if(willTapFirstButton){
            // first time
            onesNumber = number
            tensNumber = 0
            dayNumber = number
        }else {
            // second time
            tensNumber = onesNumber
            onesNumber = number
            dayNumber = tensNumber * 10 + onesNumber
        }
        //デイナンバー　が未入力　なら　デイナンバーは　今日の日
        if willTapFirstButton == false {
            modifyDayNumber()
        }
        
        dayLabel.text = String(dayNumber)
        dayLabel.textColor = .gray
        // switch boolean
        willTapFirstButton.toggle()
    }
    
    //デイナンバー　が未入力　なら　デイナンバーは　今日の日
    func modifyDayNumber(){
        let endOfMonthDay = getEndOfMonthInCurrentDate(year: yearLabel.text!, month: monthLabel.text!)
        if (dayNumber == -1){
            dayNumber = Int(getDayText(serchDate: Date()))!
            dayLabel.text = String(dayNumber)
        }else if (dayNumber == 0){
            dayNumber = 1
            dayLabel.text = String(dayNumber)
            // デイナンバーが　その月の最終日を超えていたら最終日にする
        }else if (dayNumber > endOfMonthDay){
            dayNumber = endOfMonthDay
            dayLabel.text = String(dayNumber)// 最終日を表示
        }else{
            
        }
    }
    
    
    
    //&&& YMD 5) Move on Today
    func moveToToday() {
        
        searchDate = Date()
        
        monthLabel.text = getDateMonthText(isThisMonth: true)
        dayLabel.text = getDateDayText(isToday: true)
        yearLabel.text = getDateYearText(isThisYear: true)
        whatDayLabel.text = getDateEText(isToday: true)
        yearLabel.textColor = .white
        monthLabel.textColor = .white
        dayLabel.textColor = .white
        searchYear = getDateYearText(isThisYear: true)
        yearNumber = Int(searchYear)!
        searchMonth = getDateMonthText(isThisMonth: true)
        monthNumber = Int(searchMonth)!
        dayNumber = Int(getDateDayText(isToday: true))!
        calculateAge()
        self.searchButton.setTitle("検索", for: .normal)
        self.searchButton.titleLabel?.font = UIFont.systemFont(ofSize: singleLetterJpnBtnFontSize)
        
        
        print("search date @ today button tapped: ", searchDate)
        
    }
    
    
    
    func buttonEnable(){
        if taishoButtonTapped == false {
            ones1Button.isEnabled = true
            ones2Button.isEnabled = true
            ones3Button.isEnabled = true
            ones4Button.isEnabled = true
            ones5Button.isEnabled = true
            ones6Button.isEnabled = true
            ones7Button.isEnabled = true
            ones8Button.isEnabled = true
            ones9Button.isEnabled = true
            ones0Button.isEnabled = true
            setYearButton.isEnabled = true
            setMonthButton.isEnabled = true
            setDayButton.isEnabled = true
            todayButton.isEnabled = true
            clearButton.isEnabled = true
            searchButton.isEnabled = true
        }else {
            ones1Button.isEnabled = false
            ones2Button.isEnabled = false
            ones3Button.isEnabled = false
            ones4Button.isEnabled = false
            ones5Button.isEnabled = false
            ones6Button.isEnabled = false
            ones7Button.isEnabled = false
            ones8Button.isEnabled = false
            ones9Button.isEnabled = false
            ones0Button.isEnabled = false
            setYearButton.isEnabled = false
            setMonthButton.isEnabled = false
            setDayButton.isEnabled = false
            todayButton.isEnabled = false
            clearButton.isEnabled = false
            searchButton.isEnabled = false
        }
    }
    
    
    
    


    // not in use ------------------------
    func displayLeftDays(seDayTitle:String, leftDays:String){
        let alertForLeftDays: UIAlertController = UIAlertController(title: seDayTitle, message: leftDays, preferredStyle:  UIAlertController.Style.alert)
            alertForLeftDays.addAction(UIAlertAction(title: "OK",
                                               style: .default,
                                               handler: nil))
        present(alertForLeftDays, animated: true)
    }
    // not in use ------------------------
    
    
    
    //&&& Close set
    func toggleAndColorChange(){
        taishoButtonTapped = false
        taishoButton.backgroundColor = .seButtonColor
        syowaButton.backgroundColor = .seButtonColor
        heiseiButton.backgroundColor = .seButtonColor
    }
    
    
    
    // *** not in Use **** Setting Button
    @objc func pushSettingButton(_ sender: UIButton) {
    
    }
    
    
    
    func setDayNumber(){
        if dayNumber == -1 {
            dayLabel.text = getDayText(serchDate: searchDate)
            print("before\(dayNumber)")
            print("before\(searchDate)")
        }
        print("after\(dayNumber)")
        print("after\(searchDay)")
    }
    
    func setMonthNumber(){
        if monthNumber == 0 {
            monthNumber = 1
            searchMonth = String(monthNumber)
            monthLabel.text = searchMonth
        }
    }
    
    
    
    
    // calclation for Age
    func calculateAge(){
        
        taishoButton.backgroundColor = .seButtonColor
        syowaButton.backgroundColor = .seButtonColor
        heiseiButton.backgroundColor = .seButtonColor
        reiwaButton.backgroundColor = .seButtonColor
        
        setDayNumber()
        setMonthNumber()
        setNengoNumber()
        
        if searchYear == "0" {
            yearLabel.text = "1"
            yearLabel.textColor = .white
        }else {
        yearLabel.text = searchYear
        yearLabel.textColor = .white
        }
        
        monthLabel.text = searchMonth
        monthLabel.textColor = .white
        
        modifyDayNumber()
        
        searchDay = searchYear + "/" + searchMonth + "/" + String(dayNumber)
        searchDate = dateFromString(string: searchDay, format: "yyyy/MM/dd")
        
        // ******* For virsionUp *******
        
        //baseDay = "1967/03/09"
        //baseDate = dateFromString(string: baseDay, format: "yyyy/MM/dd")
        
        print("検索用文字列searchDate: \(searchDate)")
        print("検索用文字列baseDate: \(baseDate)")
        
        // ******* For virsionUp *******
        
        //baseDayLabel.text = getBaseDayStringFromBaseDay(searchDate: baseDate)
        
        whatDayLabel.text = getEText(searchDate: searchDate)
        
        dayLabel.textColor = .white
        nengoLabel.text = getNengo(searchDate: searchDate)
        
        //getAge(firstDate: searchDate)
        nengoLabel.textColor = .white
//        if (searchDate > baseDate){
//            searchDate
//        }
        ageLabel.text = getAge(firstDate: searchDate, secondDate: baseDate)
        ageLabelForDay.text = getAgeForDay (firstDate: searchDate, secondDate: baseDate)
        
        
        
        // ******* For virsionUp *******
        
        //        if DeviceType.iPhone8 {
        //            ageLabel.frame = CGRect(x:viewWidth * 0.0400, y:viewHeight * 0.1038, width:viewWidth * 0.92, height:50)//0.531
        //        }else if DeviceType.iPhone8Plus {
        //            ageLabel.frame = CGRect(x:viewWidth * 0.0400, y:viewHeight * 0.0938, width:viewWidth * 0.92, height:50)
        //        }else{
        //            ageLabel.frame = CGRect(x:viewWidth * 0.0400, y:viewHeight * 0.1138, width:viewWidth * 0.92, height:50)
        //        }
        //        ageLabel.adjustsFontSizeToFitWidth = true
        
        
        
        //reset date tap count
        willTapFirstButton = true
        willTapFirstButtonForMonth = true
        willTapFirstButtonForNengo = true
        willTapForYearCount = 0
    }
    
    

    // *** not in use ***
    private func searchEventForSE(){
        searchDate = dateFromString(string: searchDay, format: "yyyy/MM/dd")

        let EText = getEText(searchDate: searchDate)
        
        print(searchDate)
        
        print(EText)
        whatDayLabel.text = EText
        yearLabel.text = getYearText(serchDate: searchDate)
        monthLabel.text = getMonthText(serchDate: searchDate)
        dayLabel.text = getDayText(serchDate: searchDate)
        searchYear = getYearText(serchDate: searchDate)
        searchMonth = getMonthText(serchDate: searchDate)
        dayNumber = Int(getDayText(serchDate: searchDate))!
    }
    
    
    
    //&&& Swipe_right
    private func rightSwipeAction(){
        print("searchDate before: ", searchDate)
        searchDate = Calendar.current.date(byAdding: .day, value: 1, to: searchDate)!
        print("searchDate after: ", searchDate)
        
        dayNumber = Int(getDayText(serchDate: searchDate)) ?? 0
        searchMonth = getMonthText(serchDate: searchDate)
        searchYear = getYearText(serchDate: searchDate)
        searchDay = searchYear + "/" + searchMonth + "/" + String(dayNumber)
        
        let EText = getEText(searchDate: searchDate)
        let yearText = getYearText(serchDate: searchDate)
        let monthText = getMonthText(serchDate: searchDate)
        let dayText = getDayText(serchDate: searchDate)
        
        whatDayLabel.text = EText
        yearLabel.text = yearText
        monthLabel.text = monthText
        dayLabel.text = dayText
        print("searchDay in rightSwipe:\(searchDay)")

        
    }
    
    //&&& Swipe_left
    private func leftSwipeAction(){
        print("searchDate before: ", searchDate)
        searchDate = Calendar.current.date(byAdding: .day, value: -1, to: searchDate)!
        print("searchDate after: ", searchDate)
        
        dayNumber = Int(getDayText(serchDate: searchDate)) ?? 0
        searchMonth = getMonthText(serchDate: searchDate)
        searchYear = getYearText(serchDate: searchDate)
        searchDay = searchYear + "/" + searchMonth + "/" + String(dayNumber)
        
        let EText = getEText(searchDate: searchDate)
        let yearText = getYearText(serchDate: searchDate)
        let monthText = getMonthText(serchDate: searchDate)
        let dayText = getDayText(serchDate: searchDate)
        
        whatDayLabel.text = EText
        yearLabel.text = yearText
        monthLabel.text = monthText
        dayLabel.text = dayText
        print("searchDay in leftSwipe:\(searchDay)")

        
    }
    
    
    
    //&&& SearchButton tapped
    @objc func pushSearchButton(_ sender: UIButton) {
        
        calculateAge()
        
        if AdCounter.shared.countUp() {
            
            //show ads if it's ready
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
            } else {
                print("Ad wasn't ready")
            }
            
        }
        
    }

    
    
    //&&& ClearButton tapped
    @objc func pushClearButton(_ sender: UIButton){
        
        if setNengoButtonTapped {
            nengoLabel.text = "----"
            nengoLabel.textColor = .gray
            willTapFirstButtonForNengo = true
            
        }else if setYearButtonTapped {
            yearLabel.text = "----"
            yearLabel.textColor = .gray
            willTapForYearCount = 0
            searchYear = getDateYearText(isThisYear: true)
            //
        }else if setMonthButtonTapped {
            monthLabel.text = "--"
            monthLabel.textColor = .gray
            willTapFirstButtonForMonth = true
            searchMonth = getDateMonthText(isThisMonth: true)
            //
        }else if setDayButtonTapped {
            dayLabel.text = "--"
            dayLabel.textColor = .gray
            willTapFirstButton = true
            dayNumber = -1
        }
    }
    
    
    
    // *** not in Use ***  add Schedule
    @objc func addScheduleBarButtonTapped(_ sender: UIBarButtonItem){
        
    }
    
    
    
    // ??? not in Use ???  unwind
    @IBAction func unwind(_ segue: UIStoryboardSegue) {

    }
    
    
    
    // ??? not in Use ???
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
    
    
    
    // ??? not in Use ???
    @objc func doRightAction(sender:UISwipeGestureRecognizer){
        print("rightSwipe")
        leftSwipeAction()
        calculateAge()
    }
    
    
    
    // ??? not in Use ???
    @objc func doLeftAction(sender:UISwipeGestureRecognizer){
        print("leftSwipe")
        rightSwipeAction()
        calculateAge()
    }
    
    
    // ??? not Used in the future ???
    @objc func todayBarButtonTapped(_ sender: UIBarButtonItem){
    
        moveToToday()
        
    }
    
    
    
    // *** not in use ***  longTapForDeleteSEDays Action
    @objc func longTap(_ gesture: UIGestureRecognizer){
        
        print("Longtap")
        
        guard let button = gesture.view as? UIButton else {
            print("Sender is not a button")
            return
        }

        switch (gesture.state) {
            case .began:
                if (taishoButtonTapped == false){
                    print("longPress start")
                    print("tag ", button.tag)
                    switch (button.tag) {
                    case 11:
                        if !(seDay1 == "not set"){
                            deleteSEDayForAlert = seDay1
                            seAlertAndDelete(SeDayTitle: seDay1ForAlert, selectedSENo: 1)
                        }
                    case 12:
                        if !(seDay2 == "not set"){
                            deleteSEDayForAlert = seDay2
                            seAlertAndDelete(SeDayTitle: seDay2ForAlert, selectedSENo: 2)
                        }
                    case 13:
                        if !(seDay3 == "not set"){
                            deleteSEDayForAlert = seDay3
                            seAlertAndDelete(SeDayTitle: seDay3ForAlert, selectedSENo: 3)
                        }
                    case 14:
                        break
                    default:
                        break
                    }
                }
        case .ended:
            print("longPress end")
        default:
            break
        }
    }
    
    
    // *** not in use *** AlertForDelete SEDays
    func seAlertAndDelete(SeDayTitle: String, selectedSENo: Int) {
        let alert: UIAlertController = UIAlertController(title: SeDayTitle, message: "\(deleteSEDayForAlert)", preferredStyle:  UIAlertController.Style.alert)

        let defaultAction: UIAlertAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.default, handler:{

            (action: UIAlertAction!) -> Void in
            print("Deleted")
            setSEOKForAlert = true
            
            switch (selectedSENo){
            case 1:
               
                self.taishoButton.setTitle(UserDefaultSetting.SEKeys.SE1.rawValue, for: .normal)
                seDay1 = notSetStr
                UserDefaultSetting.saveData(key: UserDefaultSetting.SEKeys.SE1.rawValue, object: notSetStr)
               
            case 2:
                

                self.syowaButton.setTitle(UserDefaultSetting.SEKeys.SE2.rawValue, for: .normal)
                seDay1 = notSetStr
                UserDefaultSetting.saveData(key: UserDefaultSetting.SEKeys.SE2.rawValue, object: notSetStr)
                
            case 3:
                

                self.heiseiButton.setTitle(UserDefaultSetting.SEKeys.SE3.rawValue, for: .normal)
                seDay1 = notSetStr
                UserDefaultSetting.saveData(key: UserDefaultSetting.SEKeys.SE3.rawValue, object: notSetStr)
                
                
            default:
                print("misson complete")
            }
            
            
        })

        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            print("Canceled")
        })

        alert.addAction(cancelAction)
        alert.addAction(defaultAction)

        present(alert, animated: true, completion: nil)
    } 


}
