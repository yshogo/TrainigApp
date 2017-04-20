//
//  NumPickerDataSource.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/04/20.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class NumPickerDataSource:NSObject,UIPickerViewDataSource,UIPickerViewDelegate{
    
    var delegate:NumViewController?
    var dataSource:NumViewController?
    
    
    /// pickerの表示列
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    /// pickerの表示個数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 30
    }
    
    /// pickerの表示内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return 1
    }
    
    /// pickerの選択時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
