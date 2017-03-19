//
//  CalendarCollectionDataSource.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/19.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class CalendarCollectionDataSource: NSObject,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var delegate: DailyViewController?
    var dataSource: DailyViewController?
    
    var dateManager = DateManager()
    
    //クリックされたときのイベントメソッド
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.row)
    }
    
    //Cellの合計数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dateManager.daysAcquisition()
    }
    
    
    //セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //セルを取得
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! CalendarCellViewController
        cell.dateNumLabel.text = dateManager.conversionDateFormat(index: indexPath.row)
        
        return cell
    }
}
