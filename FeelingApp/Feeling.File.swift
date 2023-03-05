//
//  Feeling.File.swift
//  FeelingApp
//
//  Created by あらいゆめ on 2023/03/06.
//

import Foundation
import RealmSwift

class Feeingitem:Object {
    @Persisted var feeling: Int = 0
    @Persisted var dekigoto: Int8 = 0
    @Persisted var detail: String = ""
    
}
