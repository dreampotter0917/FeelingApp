//
//  Feeling.File.swift
//  FeelingApp
//
//  Created by あらいゆめ on 2023/03/06.
//

import Foundation
import RealmSwift

class FeelingItem:Object {
    @Persisted var date:String = ""
    @Persisted var feeling: Int8 = 0
    @Persisted var dekigoto: Int8 = 0
    @Persisted var detail: String = ""
    @Persisted var arunasi: Bool = false
    
//    convenience init(date: String, feeling: Int8, dekigoto: Int8, detail: String) {
//        self.init()
//        self.date = date
//        self.feeling = feeling
//        self.dekigoto = dekigoto
//        self.detail = detail
//    }
    
//    プライマリーキーを設定
    override static func primaryKey() -> String? {
        return "date"
    }
    
}
