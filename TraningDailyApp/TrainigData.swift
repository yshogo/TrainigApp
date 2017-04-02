//
//  TrainigData.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/04/02.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import Foundation


class TrainigData{
    
    var date:String
    var trainigMenu:String
    var weight:String!
    var num:String!
    
    //コンストラクタ
    init(date:String,trainigMenu:String,weight:String,num:String) {
        self.date = date
        self.trainigMenu = trainigMenu
        self.weight = weight
        self.num = num
    }
    
}
