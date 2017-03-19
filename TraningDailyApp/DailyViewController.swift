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
    
    @IBOutlet weak var callendarCollectionView: UICollectionView!
    @IBOutlet weak var trainingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDataSource()
    }

    //初期設定
    private func initDataSource(){
        
        //CollectionViewにDelegateとDataSourceを設定する
        calledarDataSource = CalendarCollectionDataSource()
        calledarDataSource?.dataSource = self
        calledarDataSource?.delegate = self
        
        callendarCollectionView.dataSource = calledarDataSource
        callendarCollectionView.delegate = calledarDataSource
    }
    
}
