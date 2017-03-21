//
//  TrainigInfoTableViewDataSource.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/19.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class TrainigInfoTableViewDataSource: NSObject,UITableViewDataSource,UITableViewDelegate {
    
    var delegate:DailyViewController?
    var dataSource:DailyViewController?
    
    //仮でこの配列を表示させる TODO
    let texts = ["あ","い","う","え","お","か","き"]
    
    ///必要なTableViewのメソッド
    ///セルの行数追加
    func tableView(_ tableView:UITableView,numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    ///必要なTableViewメソッド
    ///セルのテキスト追加
    func tableView(_ tableView:UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = texts[indexPath.row]
        
        ///セルを返す
        return cell
    }
    
    ///セルをタップしたときのクリックイベント
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath IndexPath:NSIndexPath) {
        
        ///コンソールにクリックしたテキストを印字する
        print("ok")
    }
}
