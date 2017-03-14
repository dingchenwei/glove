//
//  TrainViewController.swift
//  glove
//
//  Created by 丁晨炜 on 17/1/28.
//  Copyright © 2017年 zju. All rights reserved.
//

import UIKit

class TrainViewController: UIViewController {
    let babyBlueTooth = BabyBluetooth()
    let peripheralLocalName = "BTO5"
    let peripheralGlobalNmae = "BTO5"
    let uuid = "FFE0"
    var peripheral:CBPeripheral?
    var characteristic:CBCharacteristic?
    var service:CBService?
    var currentWriteValue: UInt8 = 0
    var myStorage = storage()
    var userDefault:UserDefaults = UserDefaults.standard
    var helpPercentNumber:UInt8 = 50
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var savedData:[String] = [String]()
    var tempData:[String] = [String]()
    var flagSegue:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate()
        self.babyBlueTooth.scanForPeripherals().connectToPeripherals().discoverServices().discoverCharacteristics().readValueForDescriptors().discoverDescriptorsForCharacteristic().readValueForDescriptors().begin()
        self.setOutlets(r: 10)
        self.connectView.isOn = false
        self.trainView.isOn = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "uploadTrainingData"{
            var uploadViewController = segue.destination as! UploadViewController
            uploadViewController.dataFromTrainViewController = self.savedData
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disppear")
        if self.peripheral?.state == CBPeripheralState.connected{
            self.flagSegue = true
            self.babyBlueTooth.cancelPeripheralConnection(self.peripheral)
            
        }
    }
    
    @IBOutlet weak var saveDataOutlet: UIButton!
    @IBAction func saveDataButtonDidPressed(_ sender: UIButton) {
        if self.trainView.isOn == false{
            self.savedData = self.tempData
            self.tempData = []
            self.performSegue(withIdentifier: "uploadTrainingData", sender: nil)
        }
        else{
            showAlert(myStr: "please stop trainning first")
        }
    }
    
    @IBOutlet weak var connectView: UISwitch!
    @IBAction func connectStateDidChanged(_ sender: UISwitch) {
        if self.connectView.isOn{
            if self.peripheral?.state == CBPeripheralState.disconnected{
                self.babyBlueTooth.scanForPeripherals().connectToPeripherals().discoverServices().discoverCharacteristics().readValueForDescriptors().discoverDescriptorsForCharacteristic().readValueForDescriptors().begin()
                //        self.showAlert(myStr: "connecting...")
                self.judgeConnect()
            }
            else
                if (self.peripheral?.state == CBPeripheralState.connected){
                    showAlert(myStr: "already connected")
                }
                else{
                    showAlert(myStr: "searching...try again")
                    self.connectView.isOn = false
                }
        }
        else
            if self.peripheral?.state == CBPeripheralState.connected{
                self.babyBlueTooth.cancelPeripheralConnection(self.peripheral)
            }
            else if self.peripheral?.state == CBPeripheralState.disconnected{
                self.showAlert(myStr: "connect failed")
            }
    }

    @IBOutlet weak var trainView: UISwitch!
    @IBAction func trainStateDidChanged(_ sender: UISwitch) {
        if self.connectView.isOn{
            if self.trainView.isOn == true{
                self.sendData(myData: UInt8(97))  //代表a
            }
            else{
                self.sendData(myData: UInt8(98))  //代表b
            }
        }
        else{
            if self.trainView.isOn{
                self.showAlert(myStr: "未连接设备，无法训练")
                self.trainView.isOn = false
            }
        }
    }

    @IBAction func helpPercentDidChanged(_ sender: UISlider) {
        if self.trainView.isOn{
            self.helpPercentNumber = UInt8(sender.value)
            print("help percent is: \(self.helpPercentNumber)")
            //发送指令
//            self.sendData(myData: UInt8(self.helpPercentNumber))
        }
        else{
            showAlert(myStr: "还未开始训练")
        }
    }
    
    @IBOutlet weak var oneOutlet: UIButton!
    @IBAction func oneDidPressed(_ sender: UIButton) {
        if(self.trainView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x31
            self.numberDidPressed(message: "number 1", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未开始训练")
        }

    }
    
    @IBOutlet weak var twoOutlet: UIButton!
    @IBAction func twoDidPressed(_ sender: UIButton) {
        if(self.trainView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x32
            self.numberDidPressed(message: "number 2", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未开始训练")
        }
    }

    @IBOutlet weak var threeOutlet: UIButton!
    @IBAction func threeDidPressed(_ sender: UIButton) {
        if(self.trainView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x33
            self.numberDidPressed(message: "number 3", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未开始训练")
        }
    }
    
    @IBOutlet weak var fourOutlet: UIButton!
    @IBAction func fourDidPressed(_ sender: UIButton) {
        if(self.trainView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x34
            self.numberDidPressed(message: "number 4", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未开始训练")
        }
    }
    
    @IBOutlet weak var fiveOutlet: UIButton!
    @IBAction func fiveDidPressed(_ sender: UIButton) {
        if(self.trainView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x35
            self.numberDidPressed(message: "number 5", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未开始训练")
        }
    }
    
    @IBOutlet weak var sixOutlet: UIButton!
    @IBAction func sixDidPressed(_ sender: UIButton) {
        if(self.trainView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x36
            self.numberDidPressed(message: "number 6", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未开始训练")
        }
    }
    
    @IBOutlet weak var sevenOutlet: UIButton!
    @IBAction func sevenDidPressed(_ sender: UIButton) {
        if(self.trainView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x37
            self.numberDidPressed(message: "number 7", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未开始训练")
        }
    }
    
    @IBOutlet weak var eightOutlet: UIButton!
    @IBAction func eightDidPressed(_ sender: UIButton) {
        if(self.trainView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x38
            self.numberDidPressed(message: "number 8", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未开始训练")
        }
    }
    
    @IBOutlet weak var nineOutlet: UIButton!
    @IBAction func nineDidPressed(_ sender: UIButton) {
        if(self.trainView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x39
            self.numberDidPressed(message: "number 9", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未开始训练")
        }
    }
    
    @IBOutlet weak var tenOutlet: UIButton!
    @IBAction func tenDidPressed(_ sender: UIButton) {
        if(self.trainView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x30
            self.numberDidPressed(message: "number ten", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未开始训练")
        }
    }
    
    
    
    func judgeConnect(){
        
        sleep(1)
        if self.peripheral?.name == self.peripheralGlobalNmae{
            showAlert(myStr: "successfully connected")
        }
        else{
//            showAlert(myStr: "fail to connect")
            self.connectView.isOn = false
        }
    }
    
    func delegate() {
        //        //设置
        self.babyBlueTooth.setFilterOnDiscoverPeripherals { (name, adv, RSSi) -> Bool in
            //找到测试机器，并连接
            //这个测试模拟蓝牙外设的代码见：https://github.com/coolnameismy/BabyBluetooth/tree/master/Test/BabyTestStub
            if let name = adv?["kCBAdvDataLocalName"] as? String {
                if name == self.peripheralLocalName {
                    return true;
                }
            }
            return false;
        }
        
        
        self.babyBlueTooth.setFilterOnConnectToPeripherals { (name, adv, RSSI) -> Bool in
            if let name = adv?["kCBAdvDataLocalName"] as? String {
                if (name == self.peripheralLocalName){
                    
                    return true;
                }
            }
            return false;
        }
        //扫描设备成功的委托
        self.babyBlueTooth.setBlockOnDiscoverToPeripherals { (centralManager, peripheral, adv, RSSI) in
            print("find \(peripheral?.name)")
        };
        
        //连接设备成功的委托
        self.babyBlueTooth.setBlockOnConnected { (centralManager, peripheral) in
            print("connect to \(peripheral?.name)");
//            self.connectView.isOn = true
            self.peripheral = peripheral
            //            self.showAlert(myStr: "successfully connect to: \(peripheral?.name)")
        };
        
        //连接设备失败的委托
        self.babyBlueTooth.setBlockOnFailToConnect{(centerManager, peripheral, error) in
            print("fail to connect to \(peripheral?.name)")
            self.connectView.isOn = false
            self.showAlert(myStr: "fail to connect")
        }
        
        //失去连接的委托
        self.babyBlueTooth.setBlockOnDisconnect{(centerManager, peripheral, error) in
            print("disconnect to \(peripheral?.name)")
            self.connectView.isOn = false
            if self.flagSegue == false{
                self.showAlert(myStr: "lose connect")
            }
            else{
                self.flagSegue = false
            }
        }
        //成功写数据的委托
        self.babyBlueTooth.setBlockOnDidWriteValueForCharacteristic { (characteristic, error) in
            print("successfully write data: \(self.currentWriteValue)")
            self.showAlert(myStr: "successfully write data: \(self.currentWriteValue-48)")
        }
        
        self.babyBlueTooth.setBlockOnDiscoverServices { (p, error) in
        }
        self.babyBlueTooth.setBlockOnDiscoverDescriptorsForCharacteristic { (p, c, e) in
            
        }
        self.babyBlueTooth.setBlockOnDiscoverCharacteristics { (p, s, err) in
            if(s?.uuid.uuidString == self.uuid){
                self.service = s
                self.characteristic = s?.characteristics?[0]
                //                self.peripheral?.setNotifyValue(true, for: (s?.characteristics?[0])!)
            }
            
        }
        self.babyBlueTooth.setBlockOnReadValueForCharacteristic({ (p, c, e) in
            print("the characteristic is \(c?.value?[0])")
        })
    }
    
    func showAlert(myStr:String) {
        let alertController:UIAlertController = UIAlertController.init(title:myStr,message:nil,preferredStyle:UIAlertControllerStyle.alert)
        present(alertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
        }
    }

    func numberDidPressed(message:String, completePercent:Double, myData:UInt8){
        print(message+" pressed")
        var nowDate = Date()
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var dateString = formatter.string(from: nowDate)
        var temp:String = dateString+" "+message+" "+String(self.helpPercentNumber)
        self.tempData.append(temp)
//        myStorage.addItem(time: dateString, action: message, helpPercent: Double(self.helpPercentNumber), completePercent: completePercent)
        
        self.sendData(myData: myData)
    }
    func setOutlets(r:Int) {
        self.oneOutlet.layer.cornerRadius = CGFloat(r)
        self.twoOutlet.layer.cornerRadius = CGFloat(r)
        self.threeOutlet.layer.cornerRadius = CGFloat(r)
        self.fourOutlet.layer.cornerRadius = CGFloat(r)
        self.fiveOutlet.layer.cornerRadius = CGFloat(r)
        self.sixOutlet.layer.cornerRadius = CGFloat(r)
        self.sevenOutlet.layer.cornerRadius = CGFloat(r)
        self.eightOutlet.layer.cornerRadius = CGFloat(r)
        self.nineOutlet.layer.cornerRadius = CGFloat(r)
        self.tenOutlet.layer.cornerRadius = CGFloat(r)
        self.saveDataOutlet.layer.cornerRadius = CGFloat(r)
    }
    func sendData(myData:UInt8) {
        var data:UInt8 = myData
        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
        self.currentWriteValue = data
    }
}


