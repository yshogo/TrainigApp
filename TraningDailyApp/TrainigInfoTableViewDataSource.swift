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
        
        
        let trainigData = trainigDataList[IndexPath.row]
        
        let mesageText = (trainigData.date) + "\n" + "種目:" + (trainigData.trainigMenu) + "\n" + "最大重量:" + (trainigData.weight) + "kg" + "\n" + "回数:" + (trainigData.num) + "回"
        
        let alert = UIAlertController(title: "登録データ", message: mesageText, preferredStyle: .alert)
        
        //ここは標準のalertDialogを表示させることにする
        let deleteAction = UIAlertAction(title: "削除", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            //データを削除します
            
            let dao = TraingDataDao()
            dao.delete(trainigData: trainigData)
            self.delegate?.initData()
            self.delegate?.trainingTableView.reloadData()
        })
        
        let editAction = UIAlertAction(title: "編集", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            //編集画面へ
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let next = storyboard.instantiateViewController(withIdentifier: "postViewController") as? PostViewController
            
            next?.transitionTrainigData = trainigData
            next?.title = "編集する"
            
            self.delegate?.navigationController?.pushViewController(next!, animated:true)
        })
        
        //okボタンのクリックイベント
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action:UIAlertAction) -> Void in
            
        })

        alert.addAction(deleteAction)
        alert.addAction(editAction)
        alert.addAction(okAction)
        
        delegate?.present(alert,animated: true, completion: nil)
    }
}
