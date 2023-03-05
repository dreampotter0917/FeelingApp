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
    
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        気分ボタンの色
        feeling1button.backgroundColor = UIColor(red: 224/255, green: 151/255, blue: 173/255, alpha: 0.4)
        feeling2button.backgroundColor = UIColor(red: 212/255, green: 186/255, blue: 216/255, alpha: 0.4)
        feeling3button.backgroundColor = UIColor(red: 200/255, green: 212/255, blue: 180/255, alpha: 0.4)
        feeling4button.backgroundColor = UIColor(red: 208/255, green: 228/255, blue: 234/255, alpha: 0.4)
        feeling5button.backgroundColor = UIColor(red: 111/255, green: 152/255, blue: 169/255, alpha: 0.2)
        feeling6button.backgroundColor = UIColor(red: 0/255, green: 54/255, blue: 130/255, alpha: 0.2)
        
//      元々の出来事ボタンの色
        zyugyoubutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        baitobutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        sakurubutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        sigotobutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        asobibutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        sonotabutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        
        
    }
    
//    キャンセルボタン
    @IBAction func cancel(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    
//    保存ボタン
    @IBAction func save(_ sender: Any){
        print("保存しました")
        self.dismiss(animated: true, completion: nil)
    }
    
//    気分ボタンを押したら透明度が変わる
    @IBAction func feeling1buttonTapped(sender: AnyObject) {
        if feeling1button.backgroundColor == UIColor(red: 224/255, green: 151/255, blue: 173/255, alpha: 0.4) {
            feeling1button.backgroundColor =  UIColor(red: 224/255, green: 151/255, blue: 173/255, alpha: 1.0)
        }
        else if feeling1button.backgroundColor ==  UIColor(red: 224/255, green: 151/255, blue: 173/255, alpha: 1.0) {
            feeling1button.backgroundColor = UIColor(red: 224/255, green: 151/255, blue: 173/255, alpha: 0.4)
        }
    }
    
    @IBAction func feeling2buttonTapped(sender: AnyObject) {
        if feeling2button.backgroundColor == UIColor(red: 212/255, green: 186/255, blue: 216/255, alpha: 0.4){
            feeling2button.backgroundColor =  UIColor(red: 212/255, green: 186/255, blue: 216/255, alpha: 1.0)
        }
        else if feeling2button.backgroundColor == UIColor(red: 212/255, green: 186/255, blue: 216/255, alpha: 1.0) {
            feeling2button.backgroundColor = UIColor(red: 212/255, green: 186/255, blue: 216/255, alpha: 0.4)
        }
    }
    
    @IBAction func feeling3buttonTapped(sender: AnyObject) {
        if feeling3button.backgroundColor == UIColor(red: 200/255, green: 212/255, blue: 180/255, alpha: 0.4){
            feeling3button.backgroundColor =  UIColor(red: 200/255, green: 212/255, blue: 180/255, alpha: 1.0)
        }
        else if feeling3button.backgroundColor ==  UIColor(red: 200/255, green: 212/255, blue: 180/255, alpha: 1.0) {
            feeling3button.backgroundColor = UIColor(red: 200/255, green: 212/255, blue: 180/255, alpha: 0.4)
        }
    }
    
    @IBAction func feeling4buttonTapped(sender: AnyObject) {
        if feeling4button.backgroundColor ==  UIColor(red: 208/255, green: 228/255, blue: 234/255, alpha: 0.4) {
            feeling4button.backgroundColor =   UIColor(red: 208/255, green: 228/255, blue: 234/255, alpha: 1.0)
        }
        else if feeling4button.backgroundColor ==  UIColor(red: 208/255, green: 228/255, blue: 234/255, alpha: 1.0) {
            feeling4button.backgroundColor =  UIColor(red: 208/255, green: 228/255, blue: 234/255, alpha: 0.4)
        }
    }
    
    @IBAction func feeling5buttonTapped(sender: AnyObject) {
        if feeling5button.backgroundColor == UIColor(red: 111/255, green: 152/255, blue: 169/255, alpha: 0.2) {
            feeling5button.backgroundColor =  UIColor(red: 111/255, green: 152/255, blue: 169/255, alpha: 1.0)
        }
        else if feeling5button.backgroundColor ==  UIColor(red: 111/255, green: 152/255, blue: 169/255, alpha: 1.0) {
            feeling5button.backgroundColor = UIColor(red: 111/255, green: 152/255, blue: 169/255, alpha: 0.2)
        }
    }
    
    @IBAction func feeling6buttonTapped(sender: AnyObject) {
        if feeling6button.backgroundColor == UIColor(red: 0/255, green: 54/255, blue: 130/255, alpha: 0.2){
            feeling6button.backgroundColor = UIColor(red: 0/255, green: 54/255, blue: 130/255, alpha: 1.0)
        }
        else if feeling6button.backgroundColor == UIColor(red: 0/255, green: 54/255, blue: 130/255, alpha: 1.0) {
            feeling6button.backgroundColor = UIColor(red: 0/255, green: 54/255, blue: 130/255, alpha: 0.2)
        }
    }
    
//    出来事ボタンを押したら色が変わる
    @IBAction func zyugyoubuttonTapped(sender: AnyObject) {
        if zyugyoubutton.backgroundColor == UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0) {
            zyugyoubutton.backgroundColor =  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0)
        }
        else if zyugyoubutton.backgroundColor ==  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0) {
            zyugyoubutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        }
    }
    
    @IBAction func baitobuttonTapped(sender: AnyObject) {
        if baitobutton.backgroundColor == UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0) {
            baitobutton.backgroundColor =  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0)
        }
        else if baitobutton.backgroundColor ==  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0) {
            baitobutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        }
    }

    
    @IBAction func sakurubuttonTapped(sender: AnyObject) {
        if sakurubutton.backgroundColor == UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0) {
            sakurubutton.backgroundColor =  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0)
        }
        else if sakurubutton.backgroundColor ==  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0) {
            sakurubutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        }
    }

    
    @IBAction func sigotobuttonTapped(sender: AnyObject) {
        if sigotobutton.backgroundColor == UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0) {
            sigotobutton.backgroundColor =  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0)
        }
        else if sigotobutton.backgroundColor ==  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0) {
            sigotobutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        }
    }

    
    @IBAction func asobibuttonTapped(sender: AnyObject) {
        if asobibutton.backgroundColor == UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0) {
            asobibutton.backgroundColor =  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0)
        }
        else if asobibutton.backgroundColor ==  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0) {
            asobibutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        }
    }

    
    @IBAction func sonotabuttonTapped(sender: AnyObject) {
        if sonotabutton.backgroundColor == UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0) {
            sonotabutton.backgroundColor =  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0)
        }
        else if sonotabutton.backgroundColor ==  UIColor(red:170/255, green: 175/255, blue: 177/255, alpha: 1.0) {
            sonotabutton.backgroundColor = UIColor(red:218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        }
    }

    
    
    
    
    
    
    
}
