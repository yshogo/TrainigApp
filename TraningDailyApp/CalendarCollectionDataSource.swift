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
        
        let cell = collectionView.cellForItem(at: indexPath) as! CalendarCellViewController
        
        //セルをクリックさせない
        if indexPath.row < 7 && ((cell.dateNumLabel.text)?.characters.count)! >= 2{
            return
        }else if indexPath.row >= 30 && ((cell.dateNumLabel.text)?.characters.count)! <= 1{
            return
        }
        
        let targetViewController = delegate?.storyboard!.instantiateViewController( withIdentifier:  "postViewController") as? PostViewController
        targetViewController?.transitionDate = getDate(collectionView: collectionView, indexPath: indexPath)
        
        delegate?.present( targetViewController!, animated: true, completion: nil)
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
        
        if cell.powereLabel.text != "" {
            cell.powereLabel.text = ""
        }
        
        let dao = TraingDataDao()
        for var row in dao.getTrainigData(){
            
            if row.date == getDate(collectionView: collectionView, indexPath: indexPath){
                cell.powereLabel.text = "💪"
            }
        }
        
        //別の月が同じ月だと判定されてしまう不具合修正
        if indexPath.row < 7 && ((cell.dateNumLabel.text)?.characters.count)! >= 2{
            cell.powereLabel.text = ""
            cell.dateNumLabel.text = ""
            cell.isUserInteractionEnabled = false
        }else if indexPath.row >= 30 && ((cell.dateNumLabel.text)?.characters.count)! <= 1{
            
            cell.powereLabel.text = ""
            cell.dateNumLabel.text = ""
            cell.isUserInteractionEnabled = false
        }
        
        return cell
    }

    //セルの場所を渡すと日付を返す
    private func getDate(collectionView: UICollectionView,indexPath:IndexPath) -> String{
        
        var cellText = dateManager.conversionDateFormat(index: indexPath.row)
        
        if (cellText.characters.count) < 2{
            cellText = "0" + cellText
        }
        
        return selectMonth(format: "YYYY/MM") + "/" + cellText
        
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
    public func selectMonth(format:String) -> String{
        return dateManager.calendarHeader(format: format)
    }
}
