//
//  TrainigPostViewController.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/04/18.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class TrainigPostViewController: ViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var trainigMenuTableViewDelegate:TrainigMenuTableViewDelegate?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initDataSource()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initDataSource(){
        //筋トレ種目のTableView
        trainigMenuTableViewDelegate = TrainigMenuTableViewDelegate()
        trainigMenuTableViewDelegate?.delegate = self
        trainigMenuTableViewDelegate?.dataSource = self
        
        tableView.dataSource = trainigMenuTableViewDelegate
        tableView.delegate = trainigMenuTableViewDelegate
    }
    
    
    @IBAction func musclePartAction(_ sender: Any) {
        
        let traingArrayData = TrainingMenuData()
        
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            trainigMenuTableViewDelegate?.trainingArray = traingArrayData.breastArray()
            refreshTableView()
        case 1:
            trainigMenuTableViewDelegate?.trainingArray = traingArrayData.legArray()
            refreshTableView()
        default:
            trainigMenuTableViewDelegate?.trainingArray = traingArrayData.backArray()
            
            refreshTableView()
        }
    }
    
    //TableViewをリフレッシュする
    private func refreshTableView(){
        tableView.reloadData()
    }
    
    //決定ボタンのクリックイベント
    @IBAction func onEnter(_ sender: Any) {
        
        let navigationViewController = self.navigationController!
        //呼び出し元にパラメータを渡す
        let infoViewController = navigationViewController.viewControllers[navigationViewController.viewControllers.count-2] as! PostViewController
        
        let selectMenu = trainigMenuTableViewDelegate?.getSelectMenu()
        
        if selectMenu == "1" {
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                (action:UIAlertAction!) -> Void in
                
            })
            alert(title: "エラー", messageText: "筋トレ種目を\n選択してください", okActition: okAction)
            
            return
        }
        
        infoViewController.trainigMenuTextField.text = selectMenu
        self.navigationController?.popViewController(animated: true)
    }
    
    //入力ボタンクリックイベント
    @IBAction func manualInput(_ sender: Any) {
        
        let navigationViewController = self.navigationController!
        //呼び出し元にパラメータを渡す
        let infoViewController = navigationViewController.viewControllers[navigationViewController.viewControllers.count-2] as! PostViewController
        
        infoViewController.manualInputWeight()
        infoViewController.forcusFlg = true
        
        self.navigationController?.popViewController(animated: true)
    }
}
