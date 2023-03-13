//
//  ViewController.swift
//  FeelingApp
//
//  Created by あらいゆめ on 2023/03/05.
//

import UIKit
import FSCalendar
import RealmSwift



class ViewController: UIViewController,FSCalendarDataSource,FSCalendarDelegate,FSCalendarDelegateAppearance{
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
    
    var fillDefaultColors:[String:Int8] = [:]
    
    
    
    
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
        super.viewWillAppear(animated)
        
        let realm = try!Realm()
        let result = realm.objects(FeelingItem.self).filter("arunasi == true")
        
       
        if result.count == 0{}
        else{
            for i in 0...result.count-1{
    //            print(i)
    //            print(fillDefaultColors)
                fillDefaultColors[result[i]["date"] as! String] = result[i]["feeling"] as! Int8
            }
            
        }
       
        print(fillDefaultColors)
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ResisterViewController = segue.destination as! ResigterViewController
        ResisterViewController.item = sender as? FeelingItem
    }
    
    
    //    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
    //        let key = self.dateFormatter1.string(from: date)
    //        if let color = self.fillDefaultColors[key] {
    //            return color
    //        }
    //        return nil
    //    }
    
    
    //    カレンダーの日付がタップされた時の処理
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        //        その日付を取得
        let tmpDate = Calendar(identifier: .gregorian)
        let year  = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        
        
        print(date)
        label.text = "\(year)年\(month)月\(day)日"
        
        //    タップで遷移させたい
        let storyboard: UIStoryboard = self.storyboard!
        let register = storyboard.instantiateViewController(withIdentifier: "register")as!ResigterViewController
        register.dateValue = self.label.text
        register.selectedDate = date
        register.item = realm.object(ofType: FeelingItem.self, forPrimaryKey: label.text)
        
        //      消える
        self.present(register, animated: true, completion: nil)
        
        performSegue(withIdentifier: "toResister", sender: FeelingItem.self)
    }
    
}






