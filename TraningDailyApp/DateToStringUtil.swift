//
//  DateToStringUtil.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/22.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class DateToStringUtil : NSObject{
    
    //Date型をString型に変換する
    public static func dateToString(date:NSDate) -> String{
        
        let date_formatter: DateFormatter = DateFormatter()
        
        date_formatter.locale     = NSLocale(localeIdentifier: "ja") as Locale!
        date_formatter.dateFormat = "yyyy/MM/dd"
        
        return date_formatter.string(from: date as Date)
    }
}
