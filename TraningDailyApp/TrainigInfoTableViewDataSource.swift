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
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath IndexPath:NSIndexPath) {
        
        //ここは標準のalertDialogを表示させることにする
        let deleteAction = UIAlertAction(title: "編集する", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            
        })
    }
}
