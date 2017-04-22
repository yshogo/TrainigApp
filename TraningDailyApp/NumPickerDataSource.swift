//
//  NumPickerDataSource.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/04/20.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class NumPickerDataSource:NSObject,UIPickerViewDataSource,UIPickerViewDelegate{
    
    var delegate:UIPickerView?
    var dataSource:UIPickerView?
    
    var textField:UITextField?
    
    //表示要素数
    let showCount = 30
    
    /// pickerの表示列
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /// pickerの表示個数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return showCount
    }
    
    /// pickerの表示内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var text = getPickerText(count: showCount)
        
        return text[row]
    }
    
    /// pickerの選択時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        textField?.text = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
    }
    
    //表示するテキストを作成する
    private func getPickerText(count:Int) -> [String]{
        
        var text:Array<String> = []
        
        for var i in 1...count{
            text.append(String(i))
        }
        
        return text
        
    }
}
