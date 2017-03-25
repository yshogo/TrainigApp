//
//  PostViewController.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/22.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

//投稿画面
class PostViewController:UIViewController{
    
    var datePicker:UIDatePicker!
    var trainigMenuTableViewDelegate:TrainigMenuTableViewDelegate?
    
    @IBOutlet weak var datePickerField: UITextField!
    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDataSource()
        
        //DatePikerの初期設定(仮で今日の日づけを設定する)
        datePickerField.placeholder = DateToStringUtil.dateToString(date: NSDate())
        datePickerField.text = DateToStringUtil.dateToString(date: NSDate())
        self.view.addSubview(datePickerField)
        
        //DatePickerを生成する
        createDatePicker()
        createToober()
    }
    
    //DataSourceのDelegateの初期設定を行う
    private func initDataSource(){
        
        trainigMenuTableViewDelegate = TrainigMenuTableViewDelegate()
        trainigMenuTableViewDelegate?.delegate = self
        trainigMenuTableViewDelegate?.dataSource = self
        
        tabelView.dataSource = trainigMenuTableViewDelegate
        tabelView.delegate = trainigMenuTableViewDelegate
    }
    
    
    //DatePickerを生成する
    private func createDatePicker(){
        
        datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(PostViewController.changedDateEvent), for: UIControlEvents.valueChanged)
        datePicker.datePickerMode = UIDatePickerMode.date
        
        datePickerField.inputView = datePicker
        
    }
    
    //DatePickerをスクロールしたときに呼ばれるクラス
    func changedDateEvent(){
        //テキストを変更する
        datePickerField.text = DateToStringUtil.dateToString(date: datePicker.date as NSDate)
    }
    
    /// Toolbarを生成
    private func createToober(){
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = .blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.black
        
        //ツールバーにボタンを追加
        let compToolBarBtn = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(PostViewController.tappedToolBarBtn))
        compToolBarBtn.tag = 1
        toolBar.items = [compToolBarBtn]
        
        datePickerField.inputAccessoryView = toolBar
    }
    
    //完了を押したら閉じる
    func tappedToolBarBtn(sender: AnyObject?) {
        datePickerField.resignFirstResponder()
    }

}
