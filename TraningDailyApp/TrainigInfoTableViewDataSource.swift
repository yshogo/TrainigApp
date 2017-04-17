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
    
    //TODO ここはリストにして画面に複数表示できるようにすること
    public var trainigData:TrainigData?
    
    ///必要なTableViewのメソッド
    ///セルの行数追加
    func tableView(_ tableView:UITableView,numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    ///必要なTableViewメソッド
    ///セルのテキスト追加
    func tableView(_ tableView:UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        if trainigData != nil {
            cell.textLabel?.text = trainigData?.trainigMenu
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
        
        let okAction = UIAlertAction(title: "ok", style: .default, handler: {
            (action:UIAlertAction) -> Void in
            
        })
        
        let mesageText = (trainigData?.date)! + "\n" + "種目:" + (trainigData?.trainigMenu)! + "\n" + "最大重量:" + (trainigData?.weight)! + "kg" + "\n" + "回数:" + (trainigData?.num)! + "回"
        
        let alert = UIAlertController(title: "登録データ", message: mesageText, preferredStyle: .alert)
        
        
        alert.addAction(deleteAction)
        alert.addAction(editAction)
        alert.addAction(okAction)
        
        delegate?.present(alert,animated: true, completion: nil)
    }
}
