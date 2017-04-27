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
        
        if trainigDataList != nil && count > 0{
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
        
        if dateManager.calendarHeader(format: "yyyy/MM/dd") == dateManager.calendarHeader(format: "yyyy/MM") + "/" + ddDate{
            
            cell.backgroundColor = UIColor.green
        }
        
        
        let dao = TraingDataDao()
        for var row in dao.getTrainigData(){
            
            if row.date == getDate(indexPath: indexPath){
                cell.powereLabel.text = "💪"
            }
        }
        
        //別の月が同じ月だと判定されてしまう不具合修正
        if indexPath.row < 7 && ((cell.dateNumLabel.text)?.characters.count)! >= 2{
            notCell(cell: cell)
        }else if indexPath.row >= 30 && ((cell.dateNumLabel.text)?.characters.count)! <= 1{
            notCell(cell:cell)
        }
        
        return cell
    }
    
    //なにも表示しないセルを初期化させる
    private func notCell(cell:CalendarCellViewController){
        cell.powereLabel.text = ""
        cell.dateNumLabel.text = ""
        cell.isUserInteractionEnabled = false
        cell.backgroundColor = UIColor.white
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
