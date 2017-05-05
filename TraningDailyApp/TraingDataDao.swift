//
//  TraingDataDao.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/04/01.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TraingDataDao{
    
    var appDelegate:AppDelegate
    var manageContext:NSManagedObjectContext
    var fetchRequest:NSFetchRequest<NSFetchRequestResult>

    //コンストラクタ
    init() {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        manageContext = appDelegate.managedObjectContext
        
        fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TrainigMenuEntity")
    }
    
    //データを保存する
    public func saveData(data:TrainigData){
        
        let entity = NSEntityDescription.entity(forEntityName: "TrainigMenuEntity", in: manageContext)
        let tranc = NSManagedObject(entity: entity!, insertInto: manageContext)
        
        tranc.setValue(data.date, forKey: "date")
        tranc.setValue(data.trainigMenu, forKey: "trainingMenu")
        tranc.setValue(data.weight, forKey: "weight")
        tranc.setValue(data.num, forKey: "num")
        tranc.setValue(selectId(), forKey: "id")
        
        do {
            try manageContext.save()
            print("保存されたよー!")
        } catch let error as NSError  {
            print("保存に失敗しました \(error), \(error.userInfo)")
        } catch {
            print("想定外のエラー")
        }
    }
    
    //データを全件取得する
    public func getTrainigData() -> Array<TrainigData> {
        
        var arrayList = Array<TrainigData>()
        
        do{
            let fetchResults = try manageContext.fetch(fetchRequest)
            
            for var row in fetchResults as! [NSManagedObject]{
                let date = row.value(forKey: "date") as! String
                let trainigMenu = row.value(forKey: "trainingMenu") as! String
                let num = row.value(forKey: "num") as! String
                let weight = row.value(forKey: "weight") as! String
                let id = row.value(forKey: "id") as! Int
                
                var trainigdata = TrainigData(date: date, trainigMenu: trainigMenu, weight: weight, num: num)
                trainigdata.setId(id: id)
                
                arrayList.append(trainigdata)
            }
            
        }catch{
            print("想定外のエラー")
        }
        
        return arrayList
    }
    
    //一番大きいIDを取得する
    public func selectId() -> Int{
        
        let allData = getTrainigData()
        
        if allData.count == 1 { return 1 }
        
        var max:Int = 0
        for var row in allData{
            if row.id >= max{
                max = row.id + 1
            }
        }
        
        return max
    }
    
    //データ削除
    public func delete(trainigData:TrainigData){
   
        do{
            let results = try manageContext.fetch(fetchRequest)
            for var row in results {
                
                if (row as AnyObject).value(forKey: "date") as! String == trainigData.date{
                    
                    //データを削除する
                    let recode = row as! NSManagedObject
                    manageContext.delete(recode)
                }
                
                //削除後データを登録し直す
                try manageContext.save()
            }

        }catch{
            print("検索エラー")
        }
    }
    
    //データ更新
    public func update(trainingMenu:TrainigData){
        
        delete(trainigData: trainingMenu)
        saveData(data: trainingMenu)
    }
    
    //中身のデータ確認用のメソッド
    public func showAllData(){
        
        for var row in getTrainigData(){
            
            print("id:" + String(row.id))
        }
    }
}
