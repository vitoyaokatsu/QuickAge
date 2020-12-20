//
//  MainVCActions2.swift
//  QuickAge2
//
//  Created by Katsuhiko Yao on 2020/12/13.
//

import Foundation
import UIKit

extension ViewController {

    // SD 1) case Switch
    @objc func pushNengoButton(_ sender:UIButton){
        nengoButtonTapped()
        
        switch (sender.tag) {
        case 11:// taishoButton
            nengoTappedNo = 11
            taishoButton.backgroundColor = .onePlaceButtonColor
            syowaButton.backgroundColor = .seButtonColor
            heiseiButton.backgroundColor = .seButtonColor
            reiwaButton.backgroundColor = .seButtonColor
            taishoButtonTapped = true
            syowaButtonTapped = false
            heiseiButtonTapped = false
            reiwaButtonTapped = false
            nengoLabel.text = "大正"
            nengoStrForTap = "大正"
            print("setSE1ButtonTapped in case:\(taishoButtonTapped)")
            
        case 12:
            nengoTappedNo = 12
            taishoButton.backgroundColor = .seButtonColor
            syowaButton.backgroundColor = .onePlaceButtonColor
            heiseiButton.backgroundColor = .seButtonColor
            reiwaButton.backgroundColor = .seButtonColor
            taishoButtonTapped = false
            syowaButtonTapped = true
            heiseiButtonTapped = false
            reiwaButtonTapped = false
            nengoLabel.text = "昭和"
            nengoStrForTap = "昭和"

        case 13:
            nengoTappedNo = 13
            taishoButton.backgroundColor = .seButtonColor
            syowaButton.backgroundColor = .seButtonColor
            heiseiButton.backgroundColor = .onePlaceButtonColor
            reiwaButton.backgroundColor = .seButtonColor
            taishoButtonTapped = false
            syowaButtonTapped = false
            heiseiButtonTapped = true
            reiwaButtonTapped = false
            nengoLabel.text = "平成"
            nengoStrForTap = "平成"
            
        case 14:
            nengoTappedNo = 14
            taishoButton.backgroundColor = .seButtonColor
            syowaButton.backgroundColor = .seButtonColor
            heiseiButton.backgroundColor = .seButtonColor
            reiwaButton.backgroundColor = .onePlaceButtonColor
            taishoButtonTapped = false
            syowaButtonTapped = false
            heiseiButtonTapped = false
            reiwaButtonTapped = true
            nengoLabel.text = "令和"
            nengoStrForTap = "令和"
        default:
            print(sender.tag)
        }
    
    }
    
    
    
    //&&& YMD 3-2) Set Nengo Year
    func setYearForNengo(number: Int){
        
        if(willTapFirstButtonForNengo){
            // first time
            nengoOnesNumber = number
            nengoTenthNumber = 0
            nengoNumber = number
            print("86 \(willTapFirstButton)")
            print("86 \(nengoNumber)")
        }else {
            // second time
            nengoTenthNumber = nengoOnesNumber
            nengoOnesNumber = number
            nengoNumber = nengoTenthNumber * 10 + nengoOnesNumber
            print("93 \(willTapFirstButton)")
            print("93 \(nengoNumber)")
        }
        setNengoNumber()
    }
    
    func setNengoNumber(){
        if willTapFirstButtonForNengo == false {
            switch nengoTappedNo {
            case 11:
                if nengoNumber < 1 {
                    nengoNumber = 1
                }else if nengoNumber > 16 {
                    nengoNumber = 15
                }
                nengoToGregorianum = nengoNumber + 1911
                searchYear = String(nengoToGregorianum)
                yearNumber = nengoToGregorianum
                
            case 12:
                if nengoNumber < 1 {
                    nengoNumber = 1
                }else if nengoNumber > 64 {
                    nengoNumber = 64
                }
                nengoToGregorianum = nengoNumber + 1925
                searchYear = String(nengoToGregorianum)
                yearNumber = nengoToGregorianum
                
            case 13:
                if nengoNumber < 1 {
                    nengoNumber = 1
                }else if nengoNumber > 31 {
                    nengoNumber = 31
                }
                nengoToGregorianum = nengoNumber + 1988
                searchYear = String(nengoToGregorianum)
                yearNumber = nengoToGregorianum
                
            case 14:
                if nengoNumber < 1 {
                    nengoNumber = 1
                }
                nengoToGregorianum = nengoNumber + 2018
                searchYear = String(nengoToGregorianum)
                yearNumber = nengoToGregorianum
                
            default:
                break
            }
        }
        nengoLabel.text = nengoStrForTap + String(nengoNumber)
        nengoLabel.textColor = .gray
        // switch boolean
        willTapFirstButtonForNengo.toggle()
   
    }
    
}
