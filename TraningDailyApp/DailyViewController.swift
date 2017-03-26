//
//  DailyViewController.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/19.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class DailyViewController:ViewController{
    
    var calledarDataSource:CalendarCollectionDataSource?
    var tableViewDataSource:TrainigInfoTableViewDataSource?
    
    @IBOutlet weak var callendarCollectionView: UICollectionView!
    @IBOutlet weak var trainingTableView: UITableView!
    @IBOutlet weak var calendaeHeader: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionDataSource()
        initTableViewDataSource()
    }

    //CollectionViewの初期設定
    private func initCollectionDataSource(){
        
        //CollectionViewにDelegateとDataSourceを設定する
        calledarDataSource = CalendarCollectionDataSource()
        calledarDataSource?.dataSource = self
        calledarDataSource?.delegate = self
        
        callendarCollectionView.dataSource = calledarDataSource
        callendarCollectionView.delegate = calledarDataSource
        
        //ヘッダーに月を表示する
        calendaeHeader.text = calledarDataSource?.selectMonth()
    }
    
    //TableViewの初期設定
    private func initTableViewDataSource(){
        
        tableViewDataSource = TrainigInfoTableViewDataSource()
        tableViewDataSource?.delegate = self
        tableViewDataSource?.dataSource = self
        
        trainingTableView.delegate = tableViewDataSource
        trainingTableView.dataSource = tableViewDataSource
        
    }
    
    //次の月の表示ボタン
    @IBAction func nextButtonEvent(_ sender: Any) {
        calledarDataSource?.nextMonth()
        callendarCollectionView.reloadData()
        calendaeHeader.text = calledarDataSource?.selectMonth()
    }
    
    //前の月の表示ボタン
    @IBAction func beforeButtonEvent(_ sender: Any) {
        calledarDataSource?.beforeMonth()
        callendarCollectionView.reloadData()
        calendaeHeader.text = calledarDataSource?.selectMonth()
    }
}
