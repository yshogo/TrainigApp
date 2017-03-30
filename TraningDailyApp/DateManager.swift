//
//  DateManager.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/19.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class DateManager {
    
    //選択された日
    var selectDay = Date()
    //月初め
    var startDay = Date()
    //月終わり
    var endDay = Date()
    //現在のカレンダーを取得
    var calendar = Calendar.current

    //月カレンダーのはじめの月を設定する
    private func beginOfMonth() -> Date{
        
        var comporments = calendar.dateComponents([.year,.month,.day], from: selectDay)
        comporments.day = 1
        let firstOfMonth = Calendar.current.date(from: comporments)
        //曜日を調べて、その要素数だけ戻ったものがカレンダーの左上(日曜日=1 土曜日=7　なので1足した状態で戻る)
        let dayOfWeek = calendar.component(.weekday, from: firstOfMonth!)
        
        return calendar.date(byAdding: .day, value: 1-dayOfWeek, to: firstOfMonth!)!
    }
    
    //月カレンダーの終わりの月を設定する
    private func endOfMonth() -> Date{
        
        //次の月初めを取得
        let nextmonth = calendar.nextDate(after: selectDay, matching: DateComponents(day:1), matchingPolicy: Calendar.MatchingPolicy.nextTime)
        
        //曜日を調べて、その要素数だけ進んだものが右下(次の月の初めで計算している事に注意)
        let dayOfWeek = calendar.component(.weekday,from: nextmonth!)
        
        return calendar.date(byAdding: .day, value: 7-dayOfWeek, to: nextmonth!)!
    }
    
    //カレンダーの始点から指定した日数で加算し日付を返す
    public func conversionDateFormat(index: Int) -> String{
        
        let currentday = calendar.date(byAdding: .day,value:index,to: startDay)
        return calendar.component(.day, from: currentday!).description
    }
    
    //表示するセルの数を返す
    public func daysAcquisition() -> Int{
        
        startDay = beginOfMonth()
        endDay = endOfMonth()
        
        //始点から終点の日数
        return calendar.dateComponents([.day], from:startDay ,to:endDay).day! + 1
    }
    
    //SelectDayを1か月進ませる
    public func nextMonthCalendar(){
        selectDay = calendar.date(byAdding: .month, value: 1, to: selectDay)!
    }
    
    //SelectDayを1日戻す
    public func preDayCalendar(){
        selectDay = calendar.date(byAdding: .month, value: -1, to: selectDay)!
    }
    
    //選択されている月を返す
    //引数は必ずdateのformatを指定すること!!!!!!!
    public func calendarHeader(format:String)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: selectDay)
    }
}
