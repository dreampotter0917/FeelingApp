//
//  ViewController.swift
//  FeelingApp
//
//  Created by あらいゆめ on 2023/03/05.
//

import UIKit
import FSCalendar
import RealmSwift



class ViewController: UIViewController,FSCalendarDataSource,FSCalendarDelegate{
    
   
    @IBOutlet  weak var calendar: FSCalendar!
    
    var label:UILabel!
    let df = DateFormatter()
    
//    let eventArray = ["2023-03-04","2023-03-21","2023-03-18"]
    
    
    
    
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
    
    
    
//    日付の下にまるぽち
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        df.dateFormat = "yyyy-MM-dd"
//        if eventArray.first(where: { $0 == df.string(from: date) }) != nil {
//                return 1
//        }
//        return 0
//    }
    
    
//    カレンダーの日付がタップされた時の処理
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
//        その日付を取得
        let tmpDate = Calendar(identifier: .gregorian)
        _ = tmpDate.component(.year, from: date)
            let month = tmpDate.component(.month, from: date)
            let day = tmpDate.component(.day, from: date)
        label.text = "\(month)月\(day)日"
        
//    タップで遷移させたい
        let storyboard: UIStoryboard = self.storyboard!
        let register = storyboard.instantiateViewController(withIdentifier: "register")as!ResigterViewController
        register.dateValue = self.label.text
        
//      消える
        self.present(register, animated: true, completion: nil)
        
    }
    
}






