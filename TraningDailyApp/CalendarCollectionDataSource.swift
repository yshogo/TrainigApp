//
//  CalendarCollectionDataSource.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/19.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class CalendarCollectionDataSource: NSObject,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //datesource
    var delegate: DailyViewController?
    var dataSource: DailyViewController?
    
    //Manager
    var dateManager = DateManager()
    
    //選択されたViewの位置を返す
    private var date:String?

    private var indexPath:IndexPath?
    private var trainigDataList:Array<TrainigData> = Array<TrainigData>()
    
    //クリックされたときのイベントメソッド
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath) as! CalendarCellViewController

        date = cell.dateNumLabel.text
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let selectedDate = formatter.date(from: getDate(indexPath: indexPath))
        
        let now = NSDate()
        let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        
        if case calendar.compare(selectedDate!, to: now as Date, toUnitGranularity: .day) = ComparisonResult.orderedDescending{
            
            let okAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {
                (action:UIAlertAction) -> Void in
                
            })
            
            delegate?.alert(title: "エラー", messageText: "未来は選択できません", okActition: okAction)
            return
        }
        
        trainigDataList = Array<TrainigData>()
        
        
        if(self.indexPath != nil){
            let beforeCell = collectionView.cellForItem(at: self.indexPath!) as! CalendarCellViewController
            beforeCell.backgroundColor = UIColor.white
        }
        
        cell.backgroundColor = UIColor.green
        
        
        self.indexPath = indexPath
        
        let dao = TraingDataDao()
        
        var count = 0
        for var row in dao.getTrainigData(){
            
            if row.date == getDate(indexPath: indexPath){
                setTrainigData(trainigData: row)
                count += 1
            }
        }
        
        if count > 0{
            delegate?.relodTrainigMenu(trainigDataList: getTrainigData())
        }else{
            delegate?.relodTrainigMenu()
        }
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
        
        var ddDate = cell.dateNumLabel.text!
        if ddDate.characters.count == 1{
            ddDate = "0" + ddDate
        }
        
        let now = NSDate() // 現在日時の取得
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let dateFormated = dateFormatter.string(from: now as Date)
        
        //今日の日付は背景を変更する
        if dateFormated == dateManager.calendarHeader(format: "yyyy/MM") + "/" + ddDate{
            
            date = cell.dateNumLabel.text
            self.indexPath = indexPath
            cell.backgroundColor = UIColor.green
        }else{
            cell.backgroundColor = UIColor.white
        }
        
        
        let dao = TraingDataDao()
        for var row in dao.getTrainigData(){
            
            if row.date == getDate(indexPath: indexPath){
                cell.powereLabel.text = "💪"
            }
        }
        
        let dateLabel = dateManager.conversionDateFormat(index: indexPath.row)
        if indexPath.row < 7 && Int(dateLabel)! > 20{
            cell.dateNumLabel.text = ""
            cell.powereLabel.text = ""
            cell.isUserInteractionEnabled = false
        }else if indexPath.row > 25 && Int(dateLabel)! < 10{
            cell.dateNumLabel.text = ""
            cell.powereLabel.text = ""
            cell.isUserInteractionEnabled = false
        }
        
        return cell
    }
    
    //セルの場所を渡すと日付を返す
    public func getDate(indexPath:IndexPath) -> String{
        
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
    
    //選択された日付を返す
    public func selectedDate() -> String{
        return date!
    }
    
    //設定されたトレーニングデータを取得する
    public func getTrainigData() -> Array<TrainigData>{

        return trainigDataList
    }
    
    //トレーニングデータを設定する
    public func setTrainigData(trainigData: TrainigData){
        self.trainigDataList.append(trainigData)
    }
}
