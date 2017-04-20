//
//  TrainigInfoTableViewDataSource.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/19.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class TrainigInfoTableViewDataSource: NSObject,UITableViewDataSource,UITableViewDelegate {
    
    public var delegate:DailyViewController?
    public var dataSource:DailyViewController?
    
    public var trainigDataList:Array<TrainigData> = Array<TrainigData>()
    
    ///必要なTableViewのメソッド
    ///セルの行数追加
    func tableView(_ tableView:UITableView,numberOfRowsInSection section: Int) -> Int {
        
        if trainigDataList == nil {return 0}
        
        return trainigDataList.count
    }
    
    ///必要なTableViewメソッド
    ///セルのテキスト追加
    func tableView(_ tableView:UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        if trainigDataList != nil {
            cell.textLabel?.text = trainigDataList[indexPath.row].trainigMenu
        }
       
        ///セルを返す
        return cell
    }
    
    ///セルをタップしたときのクリックイベント
    func tableView(_ tableView: UITableView, didSelectRowAt IndexPath:IndexPath) {
        
        //ここは標準のalertDialogを表示させることにする
        let deleteAction = UIAlertAction(title: "削除", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            //データを削除します
        })
        
        let editAction = UIAlertAction(title: "編集", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            //編集画面へ
        })
        
        //okボタンのクリックイベント
        let okAction = UIAlertAction(title: "ok", style: .default, handler: {
            (action:UIAlertAction) -> Void in
            
        })
        
        let trainigData = trainigDataList[IndexPath.row]
        
        let mesageText = (trainigData.date) + "\n" + "種目:" + (trainigData.trainigMenu) + "\n" + "最大重量:" + (trainigData.weight) + "kg" + "\n" + "回数:" + (trainigData.num) + "回"
        
        let alert = UIAlertController(title: "登録データ", message: mesageText, preferredStyle: .alert)
        
        
        alert.addAction(deleteAction)
        alert.addAction(editAction)
        alert.addAction(okAction)
        
        delegate?.present(alert,animated: true, completion: nil)
    }
}
