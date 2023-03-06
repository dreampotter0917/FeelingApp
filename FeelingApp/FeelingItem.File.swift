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
    
//    プライマリーキーを設定
    open var primaryKey: String {
            return "date"
       }
    
}
