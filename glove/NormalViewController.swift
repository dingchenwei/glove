//
//  TrainViewController.swift
//  glove
//
//  Created by 丁晨炜 on 17/1/28.
//  Copyright © 2017年 zju. All rights reserved.
//

import UIKit

class NormalViewController: UIViewController {
    let babyBlueTooth = BabyBluetooth()
    let peripheralLocalName = "BTO5"
    let peripheralGlobalNmae = "BTO5"
    let uuid = "FFE0"
    var peripheral:CBPeripheral?
    var characteristic:CBCharacteristic?
    var service:CBService?
    var currentWriteValue: UInt8 = 0
    var flagSegue:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate()
        self.babyBlueTooth.scanForPeripherals().connectToPeripherals().discoverServices().discoverCharacteristics().readValueForDescriptors().discoverDescriptorsForCharacteristic().readValueForDescriptors().begin()
        self.setOutlets(r: 10)
        self.connectView.isOn = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
        if self.peripheral?.state == CBPeripheralState.connected{
            self.flagSegue = true
            self.babyBlueTooth.cancelPeripheralConnection(self.peripheral)
//            self.flagSegue = false
        }
        super.viewWillDisappear(animated)
        
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
    
    @IBOutlet weak var oneOutlet: UIButton!
    @IBAction func oneDidPressed(_ sender: UIButton) {
        if(self.connectView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x31
            self.numberDidPressed(message: "number 1", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未连接设备")
        }
        
    }
    
    @IBOutlet weak var twoOutlet: UIButton!
    @IBAction func twoDidPressed(_ sender: UIButton) {
        if(self.connectView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x32
            self.numberDidPressed(message: "number 2", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未连接设备")
        }
    }
    
    @IBOutlet weak var threeOutlet: UIButton!
    @IBAction func threeDidPressed(_ sender: UIButton) {
        if(self.connectView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x33
            self.numberDidPressed(message: "number 3", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未连接设备")
        }
    }
    
    @IBOutlet weak var fourOutlet: UIButton!
    @IBAction func fourDidPressed(_ sender: UIButton) {
        if(self.connectView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x34
            self.numberDidPressed(message: "number 4", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未连接设备")
        }
    }
    
    @IBOutlet weak var fiveOutlet: UIButton!
    @IBAction func fiveDidPressed(_ sender: UIButton) {
        if(self.connectView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x35
            self.numberDidPressed(message: "number 5", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未连接设备")
        }
    }
    
    @IBOutlet weak var sixOutlet: UIButton!
    @IBAction func sixDidPressed(_ sender: UIButton) {
        if(self.connectView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x36
            self.numberDidPressed(message: "number 6", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未连接设备")
        }
    }
    
    @IBOutlet weak var sevenOutlet: UIButton!
    @IBAction func sevenDidPressed(_ sender: UIButton) {
        if(self.connectView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x37
            self.numberDidPressed(message: "number 7", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未连接设备")
        }
    }
    
    @IBOutlet weak var eightOutlet: UIButton!
    @IBAction func eightDidPressed(_ sender: UIButton) {
        if(self.connectView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x38
            self.numberDidPressed(message: "number 8", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未连接设备")
        }
    }
    
    @IBOutlet weak var nineOutlet: UIButton!
    @IBAction func nineDidPressed(_ sender: UIButton) {
        if(self.connectView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x39
            self.numberDidPressed(message: "number 9", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未连接设备")
        }
    }
    
    @IBOutlet weak var tenOutlet: UIButton!
    @IBAction func tenDidPressed(_ sender: UIButton) {
        if(self.connectView.isOn){
            var completePercent = 0.5
            var data:UInt8 = 0x30
            self.numberDidPressed(message: "number ten", completePercent: completePercent, myData: data)
        }
        else{
            self.showAlert(myStr: "未连接设备")
        }
    }
    
    
    
    func judgeConnect(){
        
        sleep(1)
        if self.peripheral?.state == CBPeripheralState.connected{
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
            print("the characteristic value is \(c?.value?[0])")
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
    }
    func sendData(myData:UInt8) {
        var data:UInt8 = myData
        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
        self.currentWriteValue = data
    }
}

















////
////  ViewController.swift
////  glove
////
////  Created by 丁晨炜 on 17/1/24.
////  Copyright © 2017年 zju. All rights reserved.
////
////
//
//import UIKit
//
////import "BabyBluetooth.h"
//class NormalViewController: UIViewController {
//
//    let babyBlueTooth = BabyBluetooth()
//    let peripheralLocalName = "BabyBluetoothStubOnOSX"
//    let peripheralGlobalNmae = "Leo's MacBook Pro"
//    var peripheral:CBPeripheral?
//    var characteristic:CBCharacteristic?
//    var service:CBService?
//    var currentWriteValue: UInt8 = 0;
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        self.delegate()
//        self.babyBlueTooth.scanForPeripherals().connectToPeripherals().discoverServices().discoverCharacteristics().readValueForDescriptors().discoverDescriptorsForCharacteristic().readValueForDescriptors().begin()
//    }
//    
//    override func viewDidAppear(_ animated: Bool){
//        super.viewDidAppear(animated)
//    }
//    
//    @IBAction func tryToConnect(_ sender: UIButton) {
//        self.babyBlueTooth.scanForPeripherals().connectToPeripherals().discoverServices().discoverCharacteristics().readValueForDescriptors().discoverDescriptorsForCharacteristic().readValueForDescriptors().begin()
////        self.showAlert(myStr: "connecting...")
//        self.judgeConnect()
//    }
//    
//
//    func judgeConnect(){
//        
//        sleep(1)
//        if self.peripheral?.name == self.peripheralGlobalNmae{
//            showAlert(myStr: "successfully connected")
//        }
//        else{
//            showAlert(myStr: "fail to connect")
//        }
//    }
//    
//    @IBAction func wuzhishenzhi(_ sender: UIButton) {  //0x00
//        print("五指伸直")
//        var data:UInt8 = 0x00;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//    @IBAction func wuzhiwoquan(_ sender: UIButton) {  //0x01
//        print("五指握拳")
//        var data:UInt8 = 0x01;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//    @IBAction func muzhishenzhi(_ sender: UIButton) {  //0x02
//        print("拇指伸直")
//        var data:UInt8 = 0x02;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//    @IBAction func shizhishenzhi(_ sender: UIButton) {  //0x03
//        print("食指伸直")
//        var data:UInt8 = 0x03;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//    @IBAction func zhongzhishenzhi(_ sender: UIButton) {  //0x04
//        print("中指伸直")
//        var data:UInt8 = 0x04;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//    @IBAction func wumingshenzhi(_ sender: UIButton) {  //0x05
//        print("无名伸直")
//        var data:UInt8 = 0x05;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//    @IBAction func xiaozhishenzhi(_ sender: UIButton) {  //0x06
//        print("小指伸直")
//        var data:UInt8 = 0x06;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//    @IBAction func numberOne(_ sender: UIButton) {  //0x07
//        print("数字1")
//        var data:UInt8 = 0x07;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//    @IBAction func numberTwo(_ sender: UIButton) {  //0x08
//        print("数字2")
//        var data:UInt8 = 0x08;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//    @IBAction func numberThree(_ sender: UIButton) {  //0x09
//        print("数字3")
//        var data:UInt8 = 0x09;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//    @IBAction func numberFour(_ sender: UIButton) {  //0x0a
//        print("数字4")
//        var data:UInt8 = 0x0a;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//    @IBAction func numberFive(_ sender: UIButton) {  //0x0b
//        print("数字5")
//        var data:UInt8 = 0x0b;
//        var dataToSend = NSData(bytes:&data, length:MemoryLayout.size(ofValue: data))
//        self.peripheral?.writeValue(dataToSend as Data, for: self.characteristic!, type:CBCharacteristicWriteType.withResponse)
//        self.currentWriteValue = data
//    }
//
//    
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    
//    
//    
//    
//    func delegate() {
//        //        //设置
//        self.babyBlueTooth.setFilterOnDiscoverPeripherals { (name, adv, RSSi) -> Bool in
//            //找到测试机器，并连接
//            //这个测试模拟蓝牙外设的代码见：https://github.com/coolnameismy/BabyBluetooth/tree/master/Test/BabyTestStub
//            if let name = adv?["kCBAdvDataLocalName"] as? String {
//                if name == self.peripheralLocalName {
//                    return true;
//                }
//            }
//            return false;
//        }
//        
//        
//        self.babyBlueTooth.setFilterOnConnectToPeripherals { (name, adv, RSSI) -> Bool in
//            if let name = adv?["kCBAdvDataLocalName"] as? String {
//                if (name == self.peripheralLocalName){
//                    
//                    return true;
//                }
//            }
//            return false;
//        }
//        //扫描设备成功的委托
//        self.babyBlueTooth.setBlockOnDiscoverToPeripherals { (centralManager, peripheral, adv, RSSI) in
//            print("find \(peripheral?.name)")
//        };
//        
//        //连接设备成功的委托
//        self.babyBlueTooth.setBlockOnConnected { (centralManager, peripheral) in
//            print("connect to \(peripheral?.name)");
//            self.peripheral = peripheral
////            self.showAlert(myStr: "successfully connect to: \(peripheral?.name)")
//        };
//        
//        //连接设备失败的委托
//        self.babyBlueTooth.setBlockOnFailToConnect{(centerManager, peripheral, error) in
//            print("fail to connect to \(peripheral?.name)")
//            self.showAlert(myStr: "fail to connect")
//        }
//        
//        //失去连接的委托
//        self.babyBlueTooth.setBlockOnDisconnect{(centerManager, peripheral, error) in
//            print("disconnect to \(peripheral?.name)")
//            self.showAlert(myStr: "lose connect")
//        }
//        //成功写数据的委托
//        self.babyBlueTooth.setBlockOnDidWriteValueForCharacteristic { (characteristic, error) in
//            print("successfully write data: \(self.currentWriteValue)")
//            self.showAlert(myStr: "successfully write data: \(self.currentWriteValue)")
//        }
//        
//        self.babyBlueTooth.setBlockOnDiscoverServices { (p, error) in
//        }
//        self.babyBlueTooth.setBlockOnDiscoverDescriptorsForCharacteristic { (p, c, e) in
//            
//        }
//        self.babyBlueTooth.setBlockOnDiscoverCharacteristics { (p, s, err) in
//            if(s?.uuid.uuidString == "FFF0"){
//                self.service = s
//                self.characteristic = s?.characteristics?[2]
////                self.peripheral?.setNotifyValue(true, for: (s?.characteristics?[0])!)
//            }
//            
//        }
//        self.babyBlueTooth.setBlockOnReadValueForCharacteristic({ (p, c, e) in
//            print("the characteristic is \(c?.value?[1])")
//        })
//    }
//    
//    func showAlert(myStr:String) {
//        let alertController:UIAlertController = UIAlertController.init(title:myStr,message:nil,preferredStyle:UIAlertControllerStyle.alert)
//        present(alertController, animated: true, completion: nil)
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//            self.presentedViewController?.dismiss(animated: false, completion: nil)
//        }
//    }
//
//}
//
