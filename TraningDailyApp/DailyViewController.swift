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
    }
    
    //TableViewの初期設定
    private func initTableViewDataSource(){
        
        tableViewDataSource = TrainigInfoTableViewDataSource()
        tableViewDataSource?.delegate = self
        tableViewDataSource?.dataSource = self
        
        trainingTableView.delegate = tableViewDataSource
        trainingTableView.dataSource = tableViewDataSource
        
    }
    
}
