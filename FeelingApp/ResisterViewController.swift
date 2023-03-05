//
//  ResisterViewController.swift
//  FeelingApp
//
//  Created by あらいゆめ on 2023/03/05.
//

import UIKit
import FSCalendar
import RealmSwift

class ResisterViewController: UIViewController {
    
    let realm = try!Realm()
//    日付を表示
    @IBOutlet var dateLabel:UILabel!
    
//    気持ちを表示
    @IBOutlet weak var feeling1button:UIButton!
    @IBOutlet weak var feeling2button:UIButton!
    @IBOutlet weak var feeling3button:UIButton!
    @IBOutlet weak var feeling4button:UIButton!
    @IBOutlet weak var feeling5button:UIButton!
    @IBOutlet weak var feeling6button:UIButton!
    
//    出来事を表示
    @IBOutlet weak var zyugyoubutton:UIButton!
    @IBOutlet weak var baitobutton:UIButton!
    @IBOutlet weak var sakurubutton:UIButton!
    @IBOutlet weak var sigotobutton:UIButton!
    @IBOutlet weak var asobibutton:UIButton!
    @IBOutlet weak var sonotabutton:UIButton!
    
    var zyugyou: UInt8 = 0
    var baito: UInt8 = 0
    var sakuru: UInt8 = 0
    var sigoto: UInt8 = 0
    var asobi: UInt8 = 0
    var sonota: UInt8 = 0
    
    var isZyugyouSelected :Bool = false
    var isBaitoSelected :Bool = false
    var isSakuruSelected :Bool = false
    var isSigotoSelected :Bool = false
    var isAsobiSelected :Bool = false
    var isSonotaSelected :Bool = false
    
    var isFeeling1ButtonSelected :Bool = false
    var isFeeling2ButtonSelected :Bool = false
    var isFeeling3ButtonSelected :Bool = false
    var isFeeling4ButtonSelected :Bool = false
    var isFeeling5ButtonSelected :Bool = false
    var isFeeling6ButtonSelected :Bool = false
    
    let isSelectedColor :UIColor = UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0)
    let isNotSelectedColor :UIColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
    let color1 :UIColor = UIColor(red: 224/255, green: 151/255, blue: 173/255, alpha: 1.0)
    let color2 :UIColor = UIColor(red: 212/255, green: 186/255, blue: 216/255, alpha: 1.0)
    let color3 :UIColor = UIColor(red: 200/255, green: 212/255, blue: 180/255, alpha: 1.0)
    let color4 :UIColor = UIColor(red: 208/255, green: 228/255, blue: 234/255, alpha: 1.0)
    let color5 :UIColor = UIColor(red: 111/255, green: 152/255, blue: 169/255, alpha: 1.0)
    let color6 :UIColor = UIColor(red: 0/255, green: 54/255, blue: 130/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        気分ボタンの色
        feeling1button.backgroundColor = color1.withAlphaComponent(0.4)
        feeling2button.backgroundColor = color2.withAlphaComponent(0.4)
        feeling3button.backgroundColor = color3.withAlphaComponent(0.4)
        feeling4button.backgroundColor = color4.withAlphaComponent(0.4)
        feeling5button.backgroundColor = color5.withAlphaComponent(0.2)
        feeling6button.backgroundColor = color6.withAlphaComponent(0.2)
        
//      元々の出来事ボタンの色
//        zyugyoubutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
//        baitobutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
//        sakurubutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
//        sigotobutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
//        asobibutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
//        sonotabutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        
        
    }
    
//    キャンセルボタン
    @IBAction func cancel(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    
//    保存ボタン
    @IBAction func save(_ sender: Any){
        let dekigoto: UInt8 = zyugyou | baito | sakuru | sigoto | asobi | sonota
        print(dekigoto)
        self.dismiss(animated: true, completion: nil)
    }
    
//    気分ボタンを押したら透明度が変わる
    @IBAction func feeling1buttonTapped(sender: AnyObject) {
        if isFeeling1ButtonSelected {
            feeling1button.backgroundColor = color1.withAlphaComponent(0.4)
            isFeeling1ButtonSelected = false
        }
        else {
            feeling1button.backgroundColor = color1.withAlphaComponent(1.0)
            isFeeling1ButtonSelected = true
        }
    }
    
    @IBAction func feeling2buttonTapped(sender: AnyObject) {
        if isFeeling2ButtonSelected {
            feeling2button.backgroundColor = color2.withAlphaComponent(0.4)
            isFeeling2ButtonSelected = false
        }
        else {
            feeling2button.backgroundColor = color2.withAlphaComponent(1.0)
            isFeeling2ButtonSelected = true
        }
    }
    
    @IBAction func feeling3buttonTapped(sender: AnyObject) {
        if isFeeling3ButtonSelected {
            feeling3button.backgroundColor = color3.withAlphaComponent(0.4)
            isFeeling3ButtonSelected = false
        }
        else {
            feeling3button.backgroundColor = color3.withAlphaComponent(1.0)
            isFeeling3ButtonSelected = true
        }
    }
    
    @IBAction func feeling4buttonTapped(sender: AnyObject) {
        if isFeeling4ButtonSelected {
            feeling4button.backgroundColor = color4.withAlphaComponent(0.4)
            isFeeling4ButtonSelected = false
        }
        else {
            feeling4button.backgroundColor = color4.withAlphaComponent(1.0)
            isFeeling4ButtonSelected = true
        }
    }
    
    @IBAction func feeling5buttonTapped(sender: AnyObject) {
        if isFeeling5ButtonSelected {
            feeling5button.backgroundColor = color5.withAlphaComponent(0.2)
            isFeeling5ButtonSelected = false
        }
        else {
            feeling5button.backgroundColor = color5.withAlphaComponent(1.0)
            isFeeling5ButtonSelected = true
        }
    }
    
    @IBAction func feeling6buttonTapped(sender: AnyObject) {
        if isFeeling6ButtonSelected {
            feeling6button.backgroundColor = color6.withAlphaComponent(0.2)
            isFeeling6ButtonSelected = false
        }
        else {
            feeling6button.backgroundColor = color6.withAlphaComponent(1.0)
            isFeeling6ButtonSelected = true
        }
    }
    
//    出来事ボタンを押したら色が変わる
    @IBAction func zyugyoubuttonTapped(sender: AnyObject) {
        if isZyugyouSelected {
            zyugyoubutton.backgroundColor = isNotSelectedColor
            isZyugyouSelected = false
            zyugyou = 0
        } else {
            zyugyoubutton.backgroundColor = isSelectedColor
            isZyugyouSelected = true
            zyugyou = 0b100000 //32
        }
    }
    
    @IBAction func baitobuttonTapped(sender: AnyObject) {
        if isBaitoSelected {
            baitobutton.backgroundColor = isNotSelectedColor
            isBaitoSelected = false
            baito = 0
        }
        else {
            baitobutton.backgroundColor = isSelectedColor
            isBaitoSelected = true
            baito = 0b010000 //16
        }
    }

    
    @IBAction func sakurubuttonTapped(sender: AnyObject) {
        if isSakuruSelected {
            sakurubutton.backgroundColor =  isNotSelectedColor
            isSakuruSelected = false
            sakuru = 0
        } else {
            sakurubutton.backgroundColor = isSelectedColor
            isSakuruSelected = true
            sakuru = 0b001000 //8
        }
    }

    
    @IBAction func sigotobuttonTapped(sender: AnyObject) {
        if isSigotoSelected {
            sigotobutton.backgroundColor =  isNotSelectedColor
            isSigotoSelected = false
            sigoto = 0
        } else {
            sigotobutton.backgroundColor = isSelectedColor
            isSigotoSelected = true
            sigoto = 0b000100 //4
        }
    }

    
    @IBAction func asobibuttonTapped(sender: AnyObject) {
        if isAsobiSelected {
            asobibutton.backgroundColor =  isNotSelectedColor
            isAsobiSelected = false
            asobi = 0
        }
        else {
            asobibutton.backgroundColor = isSelectedColor
            isAsobiSelected = true
            asobi = 0b000010 //2
        }
    }

    
    @IBAction func sonotabuttonTapped(sender: AnyObject) {
        if isSonotaSelected {
            sonotabutton.backgroundColor = isNotSelectedColor
            isSonotaSelected = false
            sonota = 0
        }
        else {
            sonotabutton.backgroundColor = isSelectedColor
            isSonotaSelected = true
            sonota = 0b000001 //1
        }
    }

}
