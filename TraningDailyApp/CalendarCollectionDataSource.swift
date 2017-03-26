//
//  CalendarCollectionDataSource.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/19.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class CalendarCollectionDataSource: NSObject,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var delegate: DailyViewController?
    var dataSource: DailyViewController?
    
    var dateManager = DateManager()
    
    //クリックされたときのイベントメソッド
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //画面遷移させる
        delegate?.next(indentify: "postViewController")
    }
    
    //Cellの合計数
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dateManager.daysAcquisition()
    }
    
    
    //セルの設定
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //セルを取得
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! CalendarCellViewController
        cell.dateNumLabel.text = dateManager.conversionDateFormat(index: indexPath.row)
        
        return cell
    }
    
    //月を１日進める
    public func nextMonth(){
        dateManager.nextMonthCalendar()
    }
    
    //月を１日戻す
    public func beforeMonth(){
        dateManager.preDayCalendar()
    }
    
    //選択されている月を返す
    public func selectMonth() -> String{
        return dateManager.calendarHeader()
    }
}
