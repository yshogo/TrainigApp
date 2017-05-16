//
//  TrainigMenuTableViewDelegate.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/25.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class TrainigMenuTableViewDelegate: NSObject,UITableViewDataSource,UITableViewDelegate{
    
    var delegate:TrainigPostViewController!
    var dataSource:TrainigPostViewController!
    var trainingArray:[String]! = TrainingMenuData().breastArray()
    
    private var trainingMenu:String?
    
    ///必要なTableViewのメソッド
    ///セルの行数追加
    func tableView(_ tableView:UITableView,numberOfRowsInSection section: Int) -> Int {
        return trainingArray.count
    }
    
    ///必要なTableViewメソッド
    ///セルのテキスト追加
    func tableView(_ tableView:UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = trainingArray[indexPath.row]
        
        ///セルを返す
        return cell
    }
    
    ///セルをタップしたときのクリックイベント
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath IndexPath:NSIndexPath) {
        trainingMenu = trainingArray[IndexPath.row]
    }
    
    //選択されたデータを返す
    public func getSelectMenu() -> String{
        
        if self.trainingMenu == nil {
            return "1"
        }
        return self.trainingMenu!
    }

}
