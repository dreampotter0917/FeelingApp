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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 100, width: 400, height: 600))
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
        calendar.appearance.weekdayTextColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0)
        calendar.appearance.headerTitleColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0)
        calendar.locale = Locale(identifier: "en")
//       
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        df.dateFormat = "yyyy-MM-dd"
//        label.text = df.string(from: date)
        
//        遷移させたい
        let storyboard: UIStoryboard = self.storyboard!
        let register = storyboard.instantiateViewController(withIdentifier: "register")
        self.present(register, animated: true, completion: nil)
        
    }
    
}
//
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//
//        self.performSegue(withIdentifier: "toRegister", sender: nil)
//    }





