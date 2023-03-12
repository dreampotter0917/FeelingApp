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
    
    
    var datesWithStatus: Set<Bool> = []
    var checkWithStatus: Set<Bool> = [true]
    
    
    //    丸ポチをつけたーい！
    //    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
    //        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
    //        let realm = try! Realm()
    //        let result = realm.objects(FeelingItem.self).filter("arunasi == true")
    //        // cellのデザインを変更
    //        let formatter = DateFormatter()
    //        formatter.dateFormat = "yyyy/MM/dd"
    //        let da = formatter.string(from: date)
    //        for day in result{
    //        if da == day.date{
    //        cell.backgroundColor = UIColor.red
    //        }
    //        }
    //        return cell
    //        }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let realm = try!Realm()
        let result = realm.objects(FeelingItem.self).filter("arunasi == true")
        print(result[0]["date"])
        print(result)
        
        
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ResisterViewController = segue.destination as! ResigterViewController
        ResisterViewController.item = sender as? FeelingItem
    }
    
    
    
    // UIImageのリサイズ
    
    
    
    //    日付の下にまるぽち
    
   
    private func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> UIImage?{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let calendarDay = formatter.string(from: date)
        
        let tanosi = UIImage(named: "tanosi")
        let Resize:CGSize = CGSize.init(width: 18, height: 30) // サイズ指定
        let tanosiResize = tanosi?.resize(size: Resize)
        
        let realm = try! Realm()
        // 参照（全データを取得）
        let feeling = realm.objects(FeelingItem.self).filter("dateString == '\(calendarDay)'")
        
        if feeling.count > 0 {
            for i in 0..<feeling.count {
                if i == 0 {
                    datesWithStatus = [feeling[i].arunasi]
                } else {
                    datesWithStatus.insert(feeling[i].arunasi)
                }
            }
        } else {
            datesWithStatus = []
        }
        if datesWithStatus == checkWithStatus {
                   return tanosiResize
               }
               return nil
           }
    


    
    
    
    //    カレンダーの日付がタップされた時の処理
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        //        その日付を取得
        let tmpDate = Calendar(identifier: .gregorian)
        let year  = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        label.text = "\(year)年\(month)月\(day)日"
        
        //    タップで遷移させたい
        let storyboard: UIStoryboard = self.storyboard!
        let register = storyboard.instantiateViewController(withIdentifier: "register")as!ResigterViewController
        register.dateValue = self.label.text
        register.item = realm.object(ofType: FeelingItem.self, forPrimaryKey: label.text)
        
        //      消える
        self.present(register, animated: true, completion: nil)
        
        performSegue(withIdentifier: "toResister", sender: FeelingItem.self)
    }
    
}






