//
//  TrainigMenuEntity+CoreDataProperties.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/04/01.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension TrainigMenuEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrainigMenuEntity> {
        return NSFetchRequest<TrainigMenuEntity>(entityName: "TrainigMenuEntity");
    }

    @NSManaged public var date: String?
    @NSManaged public var trainingMenu: String?
    @NSManaged public var weight: String?
    @NSManaged public var num: String?

}
