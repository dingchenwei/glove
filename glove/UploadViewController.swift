//
//  UploadViewController.swift
//  glove
//
//  Created by 丁晨炜 on 17/1/28.
//  Copyright © 2017年 zju. All rights reserved.
//

import UIKit
import MessageUI
class UploadViewController: UIViewController, MFMailComposeViewControllerDelegate,UITextFieldDelegate{
    var emailAddress:String = ""
    var dataFromTrainViewController:[String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.placeholder = "在这里输入医生邮箱"
        self.textField.delegate = self
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBAction func returnButtonDidPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func sendEmail(_ sender: UIButton) {
        print("尝试发送邮件...")
        var dataToBeSent:String = ""
        for item in self.dataFromTrainViewController {
            dataToBeSent = dataToBeSent+item
        }
        var composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        composeVC.setToRecipients([self.emailAddress])
//        composeVC.setCcRecipients([self.emailAddress])
//        composeVC.setBccRecipients([self.emailAddress])
        composeVC.setSubject("康复数据")
        composeVC.setMessageBody(dataToBeSent, isHTML: false)
        self.present(composeVC, animated: true, completion: nil)
//        composeVC.dismiss(animated: true, completion: nil)
//        //首先要判断设备具不具备发送邮件功能
//        if MFMailComposeViewController.canSendMail(){
//            var myData = userDefault.object(forKey: "data") as! String
//            print(myData)
//            let controller = MFMailComposeViewController()
//            //设置代理
//            controller.mailComposeDelegate = self
//            //设置主题
//            controller.setSubject("训练数据")
//            //设置收件人
//            controller.setToRecipients(["928977187@qq.com"])
//            //设置抄送人
//            //            controller.setCcRecipients(["b1@hangge.com","b2@hangge.com"])
//            //设置密送人
//            //            controller.setBccRecipients(["c1@hangge.com","c2@hangge.com"])
//            //设置邮件正文内容（支持html）
//            controller.setMessageBody(myData, isHTML: false)
//            //打开界面
//            print("1111")
//            self.present(controller, animated: true, completion: nil)
//        }else{
//            print("本设备不能发送邮件")
//        }
//
//    }
//    
    
    //发送邮件代理方法
        
//        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
//            print("hahahah")
//            controller.dismiss(animated: true, completion: nil)
//            switch result{
//            case .sent:
//                print("邮件已发送")
//            case .cancelled:
//                print("邮件已取消")
//            case .saved:
//                print("邮件已保存")
//            case .failed:
//                print("邮件发送失败")
//            default:
//                print("邮件没有发送")
//                break
//            }
//            
//        }
//    func mailComposeController(controller: MFMailComposeViewController, result: MFMailComposeResult, error: Error?) {
//        print("hahahah")
//        controller.dismiss(animated: true, completion: nil)
//        switch result{
//        case .sent:
//            print("邮件已发送")
//        case .cancelled:
//            print("邮件已取消")
//        case .saved:
//            print("邮件已保存")
//        case .failed:
//            print("邮件发送失败")
//        default:
//            print("邮件没有发送")
//            break
//        }
//        
//    }
}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.emailAddress = textField.text!
        if textField.isFirstResponder{
            textField.resignFirstResponder()
        }
        return true;
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
}
