//
//  CalendarCellViewController.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/19.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class CalendarCellViewController:UICollectionViewCell{
    
    @IBOutlet weak var dateNumLabel: UILabel!
    @IBOutlet weak var powereLabel: UILabel!
    
    var dateNum:String?
    var power:String?
    
    /// コンストラクタ
    ///
    /// - Parameter aDecoder: <#aDecoder description#>
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
}
