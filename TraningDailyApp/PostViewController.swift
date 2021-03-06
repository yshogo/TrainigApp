//
//  PostViewController.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/22.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

//投稿画面
class PostViewController:ViewController{
    
    var datePicker:UIDatePicker!
    var trainigMenu:String?
    var postMode:String?
    
    var transitionTrainigData:TrainigData?
    
    @IBOutlet weak var datePickerField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var trainigMenuTextField: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //カレンダー画面からデータを取得したときにセットされる日付
    var transitionDate:String!
    
    //フォーカスを解除する
    var forcusFlg:Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //編集ボタンが入力された場合、既存データを取得する
        if transitionTrainigData != nil {
            datePickerField.text = transitionTrainigData?.date
            weightTextField.text = transitionTrainigData?.weight
            numTextField.text = transitionTrainigData?.num
            trainigMenuTextField.text = transitionTrainigData?.trainigMenu
        }
        
        if title != nil{
            titleLabel.text = title
        }
        
        initDataSource()
        initData()
        
        //DatePickerを生成する
        createDatePicker()
        createToober()
    }
    
    //DataSourceのDelegateの初期設定を行う
    private func initDataSource(){

        //重量入力のテキストフィールドと数量の入力のテキストフィールド
        weightTextField.delegate = self
        numTextField.delegate = self
        trainigMenuTextField.delegate = self
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
    
    //テキストフィールドの初期設定
    private func initData(){
        
        //日付の設定
        if transitionDate != nil{
            datePickerField.placeholder = transitionDate
            datePickerField.text = transitionDate
        }
        self.view.addSubview(datePickerField)
        
        //トレーニングメニューの設定
        trainigMenuTextField.text = trainigMenu
        
    }
    
    //完了を押したら閉じる
    func tappedToolBarBtn(sender: AnyObject?) {
        datePickerField.resignFirstResponder()
    }
    
    //投稿ボタンをクリックしたときのイベント
    @IBAction func postEvent(_ sender: Any) {
        
        
        let okAction: UIAlertAction = UIAlertAction(title: "ok", style: .default, handler: {
            
            (action:UIAlertAction!) -> Void in
            
            //データ取得する
            let date = self.datePickerField.text
            let trainingMenu = self.trainigMenuTextField.text
            let weight = self.weightTextField.text
            let num = self.numTextField.text
            
            let data = TrainigData(date: date!, trainigMenu: trainingMenu!, weight: weight!, num: num!)
            
            let dao = TraingDataDao()
            
            if self.titleLabel.text == "編集する" {
                let id = self.transitionTrainigData?.id
            }else{
                dao.saveData(data: data)
            }
            
            let completeOk:UIAlertAction = UIAlertAction(title: "YES", style: .default, handler: {
                (action:UIAlertAction!) -> Void in
                
                let navigationViewController = self.navigationController!
                
                let infoViewController = navigationViewController.viewControllers[navigationViewController.viewControllers.count - 2] as! DailyViewController
                
                infoViewController.initData()
                
                _ = self.navigationController?.popViewController(animated: true)
            })
            
            self.alert(title: "完了！", messageText: "保存が完了しました", okActition: completeOk)

        })
        
        let notAction:UIAlertAction = UIAlertAction(title: "NO", style: .default, handler: {
            //何もしない
            (action:UIAlertAction!) -> Void in
        })
        
        alert(title: "確認", messageText: "保存してもよろしいですか", okActition: okAction, noAction: notAction)
    }
    
    //テキストフィールドにフォーカスが当たったら呼ばれる
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        //すぐに画面遷移させるためにここでキーボードを閉じる
        numTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
        if !forcusFlg{
            trainigMenuTextField.resignFirstResponder()
        }
    }
    
    //トレーニングタイプにフォーカスを当てさせる
    public func manualInputWeight(){
        trainigMenuTextField.becomeFirstResponder()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        if forcusFlg == true{
            forcusFlg = false
            return false
        }
        
        return true
    }
}
