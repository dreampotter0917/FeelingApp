//
//  ViewController.swift
//  FeelingApp
//
//  Created by あらいゆめ on 2023/03/05.
//

import UIKit
import FSCalendar
import RealmSwift



class ViewController: UIViewController,FSCalendarDataSource,FSCalendarDelegate,FSCalendarDelegateAppearance,UIAdaptivePresentationControllerDelegate {
    let realm = try!Realm()
    
    @IBOutlet  weak var calendar: FSCalendar!
    
    var label:UILabel!
    let df = DateFormatter()
    var dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    var dateArray:[String] = []
    
    var fillDefaultColors:[String:UIColor] = [:]
    
    let color1 :UIColor = UIColor(red: 224/255, green: 151/255, blue: 173/255, alpha: 1.0)
    let color2 :UIColor = UIColor(red: 212/255, green: 186/255, blue: 216/255, alpha: 1.0)
    let color3 :UIColor = UIColor(red: 200/255, green: 212/255, blue: 180/255, alpha: 1.0)
    let color4 :UIColor = UIColor(red: 155/255, green: 201/255, blue: 241/255, alpha: 1.0)
    let color5 :UIColor = UIColor(red: 111/255, green: 152/255, blue: 169/255, alpha: 1.0)
    let color6 :UIColor = UIColor(red: 0/255, green: 54/255, blue: 130/255, alpha: 1.0)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 100, width: 400, height: 600))
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
        calendar.appearance.weekdayTextColor = UIColor.black
        calendar.appearance.headerTitleColor = UIColor.black
        calendar.locale = Locale(identifier: "en")
        
        label = UILabel(frame: CGRect(x: 50, y: 400, width: 320, height: 300))
        //        TOPには表示したくない↓
        //        view.addSubview(label)
        
        //
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("もどってきた")
        setBGColor()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ResisterViewController = segue.destination as! RegisterViewController
        ResisterViewController.item = sender as? FeelingItem
    }
    
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let key = self.dateFormatter1.string(from: date)
        if let color = self.fillDefaultColors[key] {
            return color
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        return .clear
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleSelectionColorFor date: Date) -> UIColor? {
        return UIColor.black
    }
    
    //    カレンダーの日付がタップされた時の処理
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        //        その日付を取得
        let df = DateFormatter()
        df.calendar = Calendar(identifier: .gregorian)
        df.locale = Locale(identifier: "ja_JP")
        df.dateStyle = .medium
        df.timeStyle = .none
        let dateStr = df.string(from: date)
        
        label.text = dateStr
        print(dateStr)
        
        //    タップで遷移させたい
        let storyboard: UIStoryboard = self.storyboard!
        let registerVC = storyboard.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        registerVC.dateValue = dateStr
        registerVC.selectedDate = date
//        registerVC.presentationController?.delegate = self
        registerVC.item = realm.object(ofType: FeelingItem.self, forPrimaryKey: dateStr)
        
        self.navigationController?.pushViewController(registerVC, animated: true)
//        self.present(registerVC, animated: true, completion: nil)
        
//        performSegue(withIdentifier: "toRegister", sender: FeelingItem.self)
    }
    
    func setBGColor(){
        let realm = try!Realm()
        let result = realm.objects(FeelingItem.self).filter("arunasi == true")
        
       
        if result.count == 0{}
        else{
            for i in 0...result.count-1{
//                print(i)
//                print(fillDefaultColors)
                let feeling:Int8 = result[i]["feeling"] as! Int8
                var feelingColor:UIColor!
               
                
                if feeling & 0b100000 == 0b100000 {
                    feelingColor = color1.withAlphaComponent(1.0)
                }
                
                if feeling & 0b010000 == 0b010000 {
                    feelingColor = color2.withAlphaComponent(1.0)
                }
                
                if feeling & 0b001000 == 0b001000 {
                    feelingColor = color3.withAlphaComponent(1.0)
                }
                if feeling & 0b000100 == 0b000100 {
                    feelingColor = color4.withAlphaComponent(1.0)
                }
                if feeling & 0b000010 == 0b000010 {
                    feelingColor = color5.withAlphaComponent(1.0)
                }
                if feeling & 0b000001 == 0b000001 {
                    feelingColor = color6.withAlphaComponent(1.0)
                }
                
                fillDefaultColors[result[i]["date"] as! String] = feelingColor
            }
        }
    }
    
}






