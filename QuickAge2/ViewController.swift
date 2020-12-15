//
//  ViewController.swift
//  QuickAge2
//
//  Created by Katsuhiko Yao on 2020/11/30.
//

import Foundation
import UIKit

class ViewController: UIViewController{
    
    //&&& set
    var viewWidth: CGFloat = 0
    var viewHeight: CGFloat = 0
        
    let dateFontSize: CGFloat = 48
    let whatDayFontSize: CGFloat = 24
    let nengoFontSize:CGFloat = 16
    let ageFontSize:CGFloat = 36
    let ageForDaysFontSize: CGFloat = 16
    let baseDayFontSize: CGFloat = 20
    
    let calendar = Calendar.current
    
    
    
    
    // IF components layout---------------------------
    
    lazy var baseDayLabel: UILabel = {
        let label = UILabel()
        
        if DeviceType.iPhone8 {
            label.frame = CGRect(x:viewWidth * 0.0400, y:viewHeight * 0.2038, width:120, height:50)//0.531
        }else if DeviceType.iPhone8Plus {
            label.frame = CGRect(x:viewWidth * 0.0400, y:viewHeight * 0.1938, width:120, height:50)
        }else{
            label.frame = CGRect(x:viewWidth * 0.0400, y:viewHeight * 0.2138, width:120, height:50)
        }
        
        label.font = UIFont.systemFont(ofSize: whatDayFontSize)
        label.textAlignment = NSTextAlignment.left
        label.textColor = .white
        label.text = "今日は " + getNengo(searchDate: baseDate) + "年 " + getBaseDayStringFromBaseDay(searchDate: baseDate) + " " + getEText(searchDate: baseDate) + "曜日"
        label.sizeToFit()
        return label
    }()
    
    
    
    
    lazy var yearLabel: UILabel = {
        let label = UILabel()
        
        
        
        label.font = UIFont.systemFont(ofSize: dateFontSize)
        label.textAlignment = NSTextAlignment.left
        label.textColor = .white
        label.text = getDateYearText(isThisYear: true)
        label.sizeToFit()
        label.backgroundColor = .clear
        //20201209
        let yearLabelTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedLabel(_:)))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(yearLabelTapGesture)
        return label
    }()
    

    lazy var dot1: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:viewWidth * 0.320, y:viewHeight * 0.1138, width:10, height:50)
        label.font = UIFont.systemFont(ofSize: dateFontSize)
        label.textAlignment = .left
        label.textColor = .white
        label.text = "."
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:viewWidth * 0.325, y:viewHeight * 0.1138, width:75, height:50)
        label.font = UIFont.systemFont(ofSize: dateFontSize)
        label.textAlignment = NSTextAlignment.right
        label.textColor = UIColor.white
        label.text = getDateMonthText(isThisMonth: true)
        label.backgroundColor = .clear
        label.tag = 92
        let monthLabelTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedLabel(_:)))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(monthLabelTapGesture)
        return label
    }()

    lazy var dot2: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:viewWidth * 0.50, y:viewHeight * 0.1138, width:10, height:50)
        label.font = UIFont.systemFont(ofSize: dateFontSize)
        label.textAlignment = .left
        label.textColor = .white
        label.text = "."
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:viewWidth * 0.53, y:viewHeight * 0.1138, width:60, height:50)
        label.font = UIFont.systemFont(ofSize: dateFontSize)
        label.textAlignment = NSTextAlignment.right
        label.textColor = UIColor.white
        label.text = getDateDayText(isToday: true)
        label.backgroundColor = .clear
        label.tag = 93
        let dayLabelTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedLabel(_:)))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(dayLabelTapGesture)
        return label
    }()
    
    lazy var whatDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: whatDayFontSize)
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.white
        label.text = getDateEText(isToday: true)
        label.sizeToFit()
        return label
    }()
    
    
    lazy var nengoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ageFontSize)
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.white
        label.text = getNengo(searchDate: searchDate)
        label.sizeToFit()
        label.backgroundColor = .clear
        return label
    }()
    
    //Base Label
    lazy var baseLabel: UILabel = {
        let label = UILabel()
        
        if DeviceType.iPhone8 {
            label.frame = CGRect(x:viewWidth * 0.0400, y:viewHeight * 0.1038, width:120, height:50)//0.531
        }else if DeviceType.iPhone8Plus {
            label.frame = CGRect(x:viewWidth * 0.0400, y:viewHeight * 0.0938, width:120, height:50)
        }else{
            label.frame = CGRect(x:viewWidth * 0.0400, y:viewHeight * 0.1138, width:120, height:50)
        }
        
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: dateFontSize)
        label.textAlignment = NSTextAlignment.left
        label.textColor = .clear
        label.text = "9999"
        label.sizeToFit()
        label.backgroundColor = .clear
        
        return label
    }()
    
    
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: dateFontSize)
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.white
        label.text = ""
        label.sizeToFit()
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var ageLabelForDay: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ageForDaysFontSize)
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.white
        label.text = ""
        label.sizeToFit()
        label.backgroundColor = .clear
        return label
    }()
    

    

    //Button
    lazy var se1Button: UIButton = {
        let button = UIButton()
        setSEButtonLayout(button: button, left: 1, top: 1, tag: 11, text: "大正")
        return button
    }()
    
    lazy var se2Button: UIButton = {
        let button = UIButton()
        setSEButtonLayout(button: button, left: 2, top: 1, tag: 12, text: "昭和")
        return button
    }()

    lazy var se3Button: UIButton = {
        let button = UIButton()
        setSEButtonLayout(button: button, left: 3, top: 1, tag: 13, text: "平成")
        return button
    }()

    lazy var setSEButton: UIButton = {
        let button = UIButton()
        setSEButtonLayout(button: button, left: 4, top: 1, tag: 14, text: "令和")
        return button
    }()
    
    
    lazy var setYearButton: UIButton = {
        let button = UIButton()
        setYMDButtonLayout(button: button, left: 1, top: 2, tag: 21, text: "Y")
        button.titleLabel?.font = UIFont.systemFont(ofSize: singleLetterBtnFontSize)
        return button
    }()

    lazy var setMonthButton: UIButton = {
        let button = UIButton()
        setYMDButtonLayout(button: button, left: 1, top: 3, tag: 22, text: "M")
        button.titleLabel?.font = UIFont.systemFont(ofSize: singleLetterBtnFontSize)
        return button
    }()

    lazy var setDayButton: UIButton = {
        let button = UIButton()
        setYMDButtonLayout(button: button, left: 1, top: 4, tag: 23, text: "D")
        button.titleLabel?.font = UIFont.systemFont(ofSize: singleLetterBtnFontSize)
        return button
    }()

    lazy var todayButton: UIButton = {
        let button = UIButton()
        setYMDButtonLayout(button: button, left: 1, top: 5, tag: 24, text: "Today")
        return button
    }()
    
    lazy var searchButton: UIButton = {
        let searchButton = UIButton()
        searchButton.frame = getButtonRect(left: 4, top: 5)
        
        // 2020 08 05 @Yugo Kawarada
        searchButton.backgroundColor = UIColor.searchBtnColor
        searchButton.titleLabel!.numberOfLines = 1
        searchButton.titleLabel?.textAlignment = NSTextAlignment.center
        searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        searchButton.setTitle("Check", for: UIControl.State.normal)
        searchButton.setTitle("", for: UIControl.State.highlighted)
        searchButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        searchButton.layer.masksToBounds = true
        searchButton.layer.cornerRadius = getButtonRect(left: 4, top: 5).size.width / 2
        searchButton.addTarget(self, action: #selector(pushSearchButton(_:)), for: .touchUpInside)
        searchButton.showsTouchWhenHighlighted = true
        return searchButton
    }()
    
    lazy var clearButton: UIButton = {
        let clearButton = UIButton()
        clearButton.frame = getButtonRect(left: 2, top: 5)
        clearButton.backgroundColor = UIColor.searchBtnColor
        clearButton.titleLabel!.numberOfLines = 1
        clearButton.titleLabel?.textAlignment = NSTextAlignment.center
        clearButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        let text = NSLocalizedString("Clear", comment: "")
        print(text)
        clearButton.setTitle(text, for: UIControl.State.normal)
        clearButton.setTitle("", for: UIControl.State.highlighted)
        clearButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        clearButton.layer.masksToBounds = true
        clearButton.layer.cornerRadius = getButtonRect(left: 2, top: 5).size.width / 2
        clearButton.addTarget(self, action: #selector(pushClearButton(_:)), for: .touchUpInside)
        clearButton.showsTouchWhenHighlighted = true
        return clearButton
    }()
    
    
    
    lazy var ones1Button: UIButton = {
        let button = UIButton()
        setOnePlaceButtonLayout(button: button, left: 2, top: 2, tag: 1)
        return button
    }()

    lazy var ones2Button: UIButton = {
        let button = UIButton()
        setOnePlaceButtonLayout(button: button, left: 3, top: 2, tag: 2)
        return button
    }()

    lazy var ones3Button: UIButton = {
        let button = UIButton()
        setOnePlaceButtonLayout(button: button, left: 4, top: 2, tag: 3)
        return button
    }()

    lazy var ones4Button: UIButton = {
        let button = UIButton()
        setOnePlaceButtonLayout(button: button, left: 2, top: 3, tag: 4)
        return button
    }()

    lazy var ones5Button: UIButton = {
        let button = UIButton()
        setOnePlaceButtonLayout(button: button, left: 3, top: 3, tag: 5)
        return button
    }()

    lazy var ones6Button: UIButton = {
        let button = UIButton()
        setOnePlaceButtonLayout(button: button, left: 4, top: 3, tag: 6)
        return button
    }()

    lazy var ones7Button: UIButton = {
        let button = UIButton()
        setOnePlaceButtonLayout(button: button, left: 2, top: 4, tag: 7)
        return button
    }()
    
    lazy var ones8Button: UIButton = {
        let button = UIButton()
        setOnePlaceButtonLayout(button: button, left: 3, top: 4, tag: 8)
        return button
    }()

    lazy var ones9Button: UIButton = {
        let button = UIButton()
        setOnePlaceButtonLayout(button: button, left: 4, top: 4, tag: 9)
        return button
    }()

    lazy var ones0Button: UIButton = {
        let button = UIButton()
        setOnePlaceButtonLayout(button: button, left: 3, top: 5, tag: 0)
        return button
    }()

    lazy var swipeView: UIView = {
        let view = UIView()
        
        if DeviceType.iPhone8 {
            view.frame = CGRect.init(x: 0, y: viewHeight * 0.1038, width: viewWidth, height: 128)
        }else if DeviceType.iPhone8Plus{
            view.frame = CGRect.init(x: 0, y: viewHeight * 0.0938, width: viewWidth, height: 130)
        }else if DeviceType.iPhone11Pro{
            view.frame = CGRect.init(x: 0, y: viewHeight * 0.1138, width: viewWidth, height: 142)
        }else{
            view.frame = CGRect.init(x: 0, y: viewHeight * 0.1138, width: viewWidth, height: 150)
        }
        
        let rightSwipeAction = UISwipeGestureRecognizer(target: self, action: #selector(doRightAction(sender:)))
        let leftSwipeAction = UISwipeGestureRecognizer(target: self, action: #selector(doLeftAction(sender:)))
        
        rightSwipeAction.direction = .right
        leftSwipeAction.direction = .left
        
        view.addGestureRecognizer(rightSwipeAction)
        view.addGestureRecognizer(leftSwipeAction)
        
        return view
    }()
    
    // MARK: add font size for button
    let singleLetterBtnFontSize: CGFloat = 36
    let doubleLetterBtnFontSize: CGFloat = 20
    
    var willTapFirstButton: Bool = true
    var willTapForYearCount: Int = 0 //４桁のためInt
    var willTapFirstButtonForMonth: Bool = true
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dt = Date()
        searchDay = dt.convertDateToStr(with: "yyyy/MM/dd")
        searchDate = dt
        baseDate = dt
        getBaseDayStringFromBaseDay(searchDate: baseDate)
        // 初期画面の画面レイアウト設定
        initViewSetting()
        // default date is today
        
        dayNumber = Int(getDayText(serchDate: dt))!
        searchMonth = getDateMonthText(isThisMonth: true)
        searchYear = getDateYearText(isThisYear: true)
        yearNumber = Int(searchYear)!
        monthNumber = Int(searchMonth)!

        print("searchDate: \(searchDate)")
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    
    
    
        
    private func initViewSetting(){
        
        self.viewHeight = self.view.frame.height
        self.viewWidth = self.view.frame.width
        view.backgroundColor = UIColor.carnation
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        //--------
        
        displayDateLabelsInitLayoutSetting()
        controllersInitLayoutSetting()
    }
        
        
    func displayDateLabelsInitLayoutSetting(){
        
        view.addSubview(whatDayLabel)
       
        view.addSubview(swipeView)
        view.addSubview(baseLabel)
        view.addSubview(baseDayLabel)
        
        view.addSubview(yearLabel)
        view.addSubview(monthLabel)
        view.addSubview(dayLabel)
        view.addSubview(dot1)
        view.addSubview(dot2)
        view.addSubview(nengoLabel)
        view.addSubview(ageLabel)
        view.addSubview(ageLabelForDay)
        
        labelLayout1()
        
        let setBasicDayButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(setBasicDay))
        self.navigationItem.rightBarButtonItems = [setBasicDayButton]
    }
    
    
    func labelLayout1(){
        baseDayLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        dot1.translatesAutoresizingMaskIntoConstraints = false
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        dot2.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        whatDayLabel.translatesAutoresizingMaskIntoConstraints = false
        nengoLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabelForDay.translatesAutoresizingMaskIntoConstraints = false
        
        yearLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dot1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        monthLabel.heightAnchor.constraint(equalToConstant:50).isActive  = true
        dot2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dayLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        baseDayLabel.leadingAnchor.constraint(equalTo: baseLabel.leadingAnchor, constant: 0).isActive = true
        baseDayLabel.topAnchor.constraint(equalTo: baseLabel.topAnchor, constant: 0).isActive = true
        yearLabel.leadingAnchor.constraint(equalTo: baseLabel.leadingAnchor).isActive = true
        yearLabel.topAnchor.constraint(equalTo: baseDayLabel.bottomAnchor, constant: 0).isActive = true
        dot1.bottomAnchor.constraint(equalTo: yearLabel.bottomAnchor).isActive = true
        dot1.leadingAnchor.constraint(equalTo: yearLabel.trailingAnchor,constant: 0).isActive = true
        monthLabel.bottomAnchor.constraint(equalTo: dot1.bottomAnchor).isActive = true
        monthLabel.leadingAnchor.constraint(equalTo: dot1.trailingAnchor,constant: 5).isActive = true
        dot2.bottomAnchor.constraint(equalTo: monthLabel.bottomAnchor).isActive = true
        dot2.leadingAnchor.constraint(equalTo: monthLabel.trailingAnchor,constant: 0).isActive = true
        dayLabel.bottomAnchor.constraint(equalTo: dot2.bottomAnchor).isActive = true
        dayLabel.leadingAnchor.constraint(equalTo: dot2.trailingAnchor,constant: 5).isActive = true
        whatDayLabel.bottomAnchor.constraint(equalTo: dayLabel.bottomAnchor,constant: -2).isActive = true
        whatDayLabel.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor,constant: 8).isActive = true
        nengoLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor,constant: -8).isActive = true
        nengoLabel.leadingAnchor.constraint(equalTo: yearLabel.leadingAnchor,constant: 0).isActive = true
        ageLabel.leadingAnchor.constraint(equalTo: yearLabel.leadingAnchor,constant: 8).isActive = true
        ageLabel.topAnchor.constraint(equalTo: nengoLabel.bottomAnchor,constant: 12).isActive = true
        ageLabelForDay.leadingAnchor.constraint(equalTo: ageLabel.leadingAnchor,constant: 12).isActive = true
        ageLabelForDay.topAnchor.constraint(equalTo: ageLabel.bottomAnchor,constant: -8).isActive = true
    }
    

    
    
    @objc func setBasicDay(){

    }
    

    func controllersInitLayoutSetting(){
        view.addSubview(searchButton)
        view.addSubview(clearButton)

        view.addSubview(se1Button)
        view.addSubview(se2Button)
        view.addSubview(se3Button)
        view.addSubview(setSEButton)
        
        view.addSubview(ones1Button)
        view.addSubview(ones2Button)
        view.addSubview(ones3Button)
        view.addSubview(ones4Button)
        view.addSubview(ones5Button)
        view.addSubview(ones6Button)
        view.addSubview(ones7Button)
        view.addSubview(ones8Button)
        view.addSubview(ones9Button)
        view.addSubview(ones0Button)
        
        view.addSubview(setYearButton)
        view.addSubview(setMonthButton)
        view.addSubview(setDayButton)
        view.addSubview(todayButton)
    }

    
    
    
    
    // MARK: add functon for each button's sectons, tenplace, oneplace, month
    // each  button's tag should be unique
    func setYMDButtonLayout(button: UIButton, left: Int, top: Int, tag: Int, text:String){

        let btnRect = getButtonRect(left: left, top: top)
        button.frame = btnRect
        button.backgroundColor = UIColor.ymdButtonColor
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.setTitle(text, for: UIControl.State.normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 10 / UIFont.buttonFontSize
        button.layer.masksToBounds = true
        button.layer.cornerRadius = btnRect.size.width / 2
        button.tag = tag
        button.addTarget(self, action: #selector(pushYMDButton(_:)), for: .touchUpInside)
        button.showsTouchWhenHighlighted = true
    }
    
    

    //SEButton layout setting
    private func setSEButtonLayout(button: UIButton, left: Int, top: Int, tag: Int, text:String){
        let btnRect = getButtonRect(left: left, top: top)
        button.frame = btnRect
        button.backgroundColor = UIColor.seButtonColor
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: doubleLetterBtnFontSize)
        button.setTitle(text, for: UIControl.State.normal)
        button.setTitle("", for: UIControl.State.highlighted)
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = btnRect.size.width / 2
        button.tag = tag
        button.addTarget(self, action: #selector(setSEDay(_:)), for: .touchUpInside)
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        button.addGestureRecognizer(longGesture)
        button.showsTouchWhenHighlighted = true
    }

    
        
    private func setOnePlaceButtonLayout(button: UIButton, left: Int, top: Int, tag: Int){
        let btnRect = getButtonRect(left: left, top: top)
        button.frame = btnRect
        button.backgroundColor = UIColor.onePlaceButtonColor
        button.titleLabel!.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: singleLetterBtnFontSize)
        button.setTitle(String(tag), for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = btnRect.size.width / 2
        button.tag = tag
        button.addTarget(self, action: #selector(pushOnesButton(_:)), for: .touchUpInside)
        button.showsTouchWhenHighlighted = true
    }

    
    
    //　ボタンのサイズと位置
    func getButtonRect(left: Int,top: Int) -> CGRect{
        let viewWidth = view.frame.width
        let viewHeight = view.frame.height
        //ボタンのサイズ横の１９％
        var ButtonWidth = viewWidth * 0.19
        var ButtonHeight = ButtonWidth

        let size = CGSize(width: ButtonWidth, height: ButtonHeight)

        var originX: CGFloat = 0
        var originY: CGFloat = 0
        switch(left){
            case 1:
                
                
                originX = viewWidth * 0.075
                break
            case 2:
                
                 // ここも設定
                 originX = viewWidth * 0.295
                 break
            case 3:
                 // ここも設定
                originX = viewWidth * 0.515
                break
                
            case 4:
                 // ここも設定
                originX = viewWidth * 0.735
                break
            default:
                break
        }
        
        switch(top){
            
            case 1:
                if DeviceType.iPhoneXr || DeviceType.iPhoneXsMax || DeviceType.iPhone12 || DeviceType.iPhone12Pro || DeviceType.iPhone12ProMax {
                    originY = viewHeight * 0.421
                }
                else if DeviceType.iPhone8Plus || DeviceType.iPhone8 {
                    originY = viewHeight * 0.42//0.421
                }else if DeviceType.iPhoneSE {
                    originY = viewHeight * 0.42//0.421
                }else if DeviceType.iPhone11Pro || DeviceType.iPhone12mini {
                    originY = viewHeight * 0.42//0.5255
                }
                break
                
            case 2:
                if DeviceType.iPhoneXr || DeviceType.iPhoneXsMax || DeviceType.iPhone12 || DeviceType.iPhone12Pro || DeviceType.iPhone12ProMax {
                    originY = viewHeight * 0.539
                }
                else if DeviceType.iPhone8Plus || DeviceType.iPhone8 {
                    originY = viewHeight * 0.53//0.5255
                }else if DeviceType.iPhoneSE {
                    originY = viewHeight * 0.53//0.5255
                }else if DeviceType.iPhone11Pro || DeviceType.iPhone12mini {
                    originY = viewHeight * 0.53//0.5255
                }
                break
                
            case 3:
                if DeviceType.iPhoneXr || DeviceType.iPhoneXsMax || DeviceType.iPhone12 || DeviceType.iPhone12Pro || DeviceType.iPhone12ProMax {
                    originY = viewHeight * 0.639
                }
                else if DeviceType.iPhone8Plus || DeviceType.iPhone8 {
                    originY = viewHeight * 0.64//0.63
                }else if DeviceType.iPhoneSE {
                    originY = viewHeight * 0.64//0.63
                }else if DeviceType.iPhone11Pro || DeviceType.iPhone12mini {
                    originY = viewHeight * 0.64//0.5255
                }
                break
                
            case 4:
                if DeviceType.iPhoneXr || DeviceType.iPhoneXsMax || DeviceType.iPhone12 || DeviceType.iPhone12Pro || DeviceType.iPhone12ProMax {
                    originY = viewHeight * 0.739
                }
                else if DeviceType.iPhone8Plus || DeviceType.iPhone8 {
                    originY = viewHeight * 0.75//0.7345
                }else if DeviceType.iPhoneSE {
                    originY = viewHeight * 0.75//0.7345
                }else if DeviceType.iPhone11Pro || DeviceType.iPhone12mini {
                    originY = viewHeight * 0.75//0.5255
                }
                break
            
            case 5:
                if DeviceType.iPhoneXr || DeviceType.iPhoneXsMax || DeviceType.iPhone12 || DeviceType.iPhone12Pro || DeviceType.iPhone12ProMax {
                    originY = viewHeight * 0.839
                }
                else if DeviceType.iPhone8Plus || DeviceType.iPhone8 {
                    originY = viewHeight * 0.86//0.78
                }else if DeviceType.iPhoneSE {
                    originY = viewHeight * 0.86//0.78
                }else if DeviceType.iPhone11Pro || DeviceType.iPhone12mini {
                    originY = viewHeight * 0.86//0.5255
                }
                break
                
            default:
                break
        }
        
        let origin = CGPoint(x: originX, y: originY)
        
        return CGRect(origin: origin, size: size)
    }

       
}








