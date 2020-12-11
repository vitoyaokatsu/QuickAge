//
//  Device.swift
//  QuickDate2
//
//  Created by Katsuhiko Yao on 2020/11/24.
//


import Foundation
import UIKit


// 2020 08 05 @Yugo Kawarada
enum UIUserInterfaceIdiom : Int {
    case Unspecified
    case phone
    case pad
}

struct ScreenSize {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenMaxLength = max(ScreenSize.screenWidth, ScreenSize.screenHeight)
    static let screenMinLength = min(ScreenSize.screenWidth, ScreenSize.screenHeight)
    //ask yugo the question
}

struct DeviceType {
    
    // 数値はデバイスの大きさである。
    // 参考URL:
    // https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions
    // Pointsを参考にして、設定したいデバイス名を定義する。
    
    static let iPhone4OrLess  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength < 568.0 //width 320
    static let iPhoneSE = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 568.0 //width 320
    static let iPhone8 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 667.0 //width 375
    static let iPhone8Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 736.0 //width 414
    static let iPhoneXr = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 896.0 //width 414
    static let iPhoneXs = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 812.0 //width 375
    static let iPhoneXsMax = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 896.0 //width 414
    static let iPad = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 1024.0
    static let iPhone11 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 812.0 //width 414
    static let iPhone11Pro = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 812.0 //width 414
    static let iPhone12 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 844.0 // 20111101 new size //width 390
    static let iPhone12mini = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 812.0 // same as 11 //width 375
    static let iPhone12Pro = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 844.0 // same as 12 //width 390
    static let iPhone12ProMax = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 926.0 // new size //width428
    
//    static let iPhone4OrLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenWidth < 320.0
    
//    ask yogo the question
    
}
