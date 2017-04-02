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
    func saveData(data:TrainigData){
        
        let entity = NSEntityDescription.entity(forEntityName: "TrainigMenuEntity", in: manageContext)
        let tranc = NSManagedObject(entity: entity!, insertInto: manageContext)
        
        tranc.setValue(data.date, forKey: "date")
        tranc.setValue(data.trainigMenu, forKey: "trainingMenu")
        tranc.setValue(data.weight, forKey: "weight")
        tranc.setValue(data.num, forKey: "num")
        
        do {
            try manageContext.save()
            print("保存されたよー!")
        } catch let error as NSError  {
            print("保存に失敗しました \(error), \(error.userInfo)")
        } catch {
            print("想定外のエラー")
        }
    }
    
    
}
