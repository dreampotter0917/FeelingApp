//
//  ResisterViewController.swift
//  FeelingApp
//
//  Created by あらいゆめ on 2023/03/05.
//

import UIKit
import FSCalendar
import RealmSwift

class ResigterViewController: UIViewController {
    
    var item: FeelingItem? = nil
    var selectedDate : Date?
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    let realm = try!Realm()
    
    
    

//    日付を表示
    @IBOutlet var dateLabel:UILabel!
    var dateValue :String?
    
//    ここから入力画面
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
    
    var feeling: Int8 = 0
    var dekigoto: Int8 = 0
    
    var zyugyou: Int8 = 0
    var baito: Int8 = 0
    var sakuru: Int8 = 0
    var sigoto: Int8 = 0
    var asobi: Int8 = 0
    var sonota: Int8 = 0
    
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
    let color4 :UIColor = UIColor(red: 155/255, green: 201/255, blue: 241/255, alpha: 1.0)
    let color5 :UIColor = UIColor(red: 111/255, green: 152/255, blue: 169/255, alpha: 1.0)
    let color6 :UIColor = UIColor(red: 0/255, green: 54/255, blue: 130/255, alpha: 1.0)
    
    
//    詳細を表示
    @IBOutlet var detailTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = dateValue
//
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let item {
            
            feeling = item.feeling
            setFeelingButtonColor()
            
            dekigoto = item.dekigoto
            if dekigoto & 0b100000 == 0b100000 {
                zyugyoubutton.backgroundColor = isSelectedColor
                isZyugyouSelected = true
            }
            if dekigoto & 0b010000 == 0b010000 {
                baitobutton.backgroundColor = isSelectedColor
                isBaitoSelected = true
            }
            if dekigoto & 0b001000 == 0b001000 {
                sakurubutton.backgroundColor = isSelectedColor
                isSakuruSelected = true
            }
            if dekigoto & 0b000100 == 0b000100 {
                sigotobutton.backgroundColor = isSelectedColor
                isSigotoSelected = true
            }
            if dekigoto & 0b000010 == 0b000010 {
                asobibutton.backgroundColor = isSelectedColor
                isAsobiSelected = true
            }
            if dekigoto & 0b000001 == 0b000001 {
                sonotabutton.backgroundColor = isSelectedColor
                isSonotaSelected = true
            }
            
            detailTextField.text = item.detail
            
            saveButton.title = "保存"
        } else {
            saveButton.title = "保存"
        }
    }
    
//    キャンセルボタン
    @IBAction func cancel(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    
//    保存したい
    
    
    func createFeeling(item: FeelingItem){
        
        try! realm.write {
            realm.add(item, update: .modified)
        }
        
    }
    
    @IBAction func save(_ sender: Any){
        let item = FeelingItem()
        item.feeling = feeling
        item.dekigoto = dekigoto
        item.detail = detailTextField.text ?? ""
        item.date = dateLabel.text ?? ""
        item.arunasi = true
        item.selectDate = selectedDate!
        createFeeling(item: item)
        self.dismiss(animated: true, completion: nil)
    }
    
    

    
//    気分ボタンを押したら透明度が変わる
    @IBAction func feeling1buttonTapped(sender: AnyObject) {
        feeling = 0b100000
        setFeelingButtonColor()
    }
    
    @IBAction func feeling2buttonTapped(sender: AnyObject) {
        feeling = 0b010000
        setFeelingButtonColor()
    }
    
    @IBAction func feeling3buttonTapped(sender: AnyObject) {
        feeling = 0b001000
        setFeelingButtonColor()
    }
    
    @IBAction func feeling4buttonTapped(sender: AnyObject) {
        feeling = 0b000100
        setFeelingButtonColor()
    }
    
    @IBAction func feeling5buttonTapped(sender: AnyObject) {
        feeling = 0b000010
        setFeelingButtonColor()
    }
    
    @IBAction func feeling6buttonTapped(sender: AnyObject) {
        feeling = 0b000001
        setFeelingButtonColor()
    }
    
    
    
func setFeelingButtonColor(){
    
    if feeling & 0b100000 == 0b100000 {
        feeling1button.backgroundColor = color1.withAlphaComponent(1.0)
    } else {
        feeling1button.backgroundColor = color1.withAlphaComponent(0.4)
    }
    
    if feeling & 0b010000 == 0b010000 {
        feeling2button.backgroundColor = color2.withAlphaComponent(1.0)
    } else {
        feeling2button.backgroundColor = color2.withAlphaComponent(0.4)
    }
    
    if feeling & 0b001000 == 0b001000 {
        feeling3button.backgroundColor = color3.withAlphaComponent(1.0)
    } else {
        feeling3button.backgroundColor = color3.withAlphaComponent(0.4)
    }
    
    if feeling & 0b000100 == 0b000100 {
        feeling4button.backgroundColor = color4.withAlphaComponent(1.0)
    } else {
        feeling4button.backgroundColor = color4.withAlphaComponent(0.4)
    }
    
    if feeling & 0b000010 == 0b000010 {
        feeling5button.backgroundColor = color5.withAlphaComponent(1.0)
    } else {
        feeling5button.backgroundColor = color5.withAlphaComponent(0.2)
    }
    
    if feeling & 0b000001 == 0b000001 {
        feeling6button.backgroundColor = color6.withAlphaComponent(1.0)
    } else {
        feeling6button.backgroundColor = color6.withAlphaComponent(0.2)
    }
}
    //    出来事ボタンを押したら色が変わる
        @IBAction func zyugyoubuttonTapped(sender: AnyObject) {
            if isZyugyouSelected {
                zyugyoubutton.backgroundColor = isNotSelectedColor
                isZyugyouSelected = false
                dekigoto &= ~0b100000
            } else {
                zyugyoubutton.backgroundColor = isSelectedColor
                isZyugyouSelected = true
                dekigoto |= 0b100000
            }
        }
        
        @IBAction func baitobuttonTapped(sender: AnyObject) {
            if isBaitoSelected {
                baitobutton.backgroundColor = isNotSelectedColor
                isBaitoSelected = false
                dekigoto &= ~0b010000
            }
            else {
                baitobutton.backgroundColor = isSelectedColor
                isBaitoSelected = true
                dekigoto |= 0b010000
            }
        }

        
        @IBAction func sakurubuttonTapped(sender: AnyObject) {
            if isSakuruSelected {
                sakurubutton.backgroundColor =  isNotSelectedColor
                isSakuruSelected = false
                dekigoto &= ~0b001000
            } else {
                sakurubutton.backgroundColor = isSelectedColor
                isSakuruSelected = true
                dekigoto |= 0b001000
            }
        }

        
        @IBAction func sigotobuttonTapped(sender: AnyObject) {
            if isSigotoSelected {
                sigotobutton.backgroundColor =  isNotSelectedColor
                isSigotoSelected = false
                dekigoto &= ~0b000100
            } else {
                sigotobutton.backgroundColor = isSelectedColor
                isSigotoSelected = true
                dekigoto |= 0b000100
            }
        }

        
        @IBAction func asobibuttonTapped(sender: AnyObject) {
            if isAsobiSelected {
                asobibutton.backgroundColor =  isNotSelectedColor
                isAsobiSelected = false
                dekigoto &= ~0b000010
            }
            else {
                asobibutton.backgroundColor = isSelectedColor
                isAsobiSelected = true
                dekigoto |= 0b000010
            }
        }

        
        @IBAction func sonotabuttonTapped(sender: AnyObject) {
            if isSonotaSelected {
                sonotabutton.backgroundColor = isNotSelectedColor
                isSonotaSelected = false
                dekigoto &= ~0b000001
            }
            else {
                sonotabutton.backgroundColor = isSelectedColor
                isSonotaSelected = true
                dekigoto |= 0b000001
            }
        }
    
    
    
}
