//
//  ViewController.swift
//  Dz13
//
//  Created by Павел Платов on 28.12.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var myButton: UIButton!
    private let text = "Hello Manera"
    @IBOutlet var bottomLabelConstraint: NSLayoutConstraint!
    @IBOutlet var alertButton: UIButton!
    var timer = Timer()
    @IBOutlet var blurView: UIVisualEffectView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //createView()
        
        let font = UIFont(name: "GreatVibes-Regular", size: 45)
        label.font = font
        label.text = text
        
        
        
        
        //        let string = "Привет, пес"
        //        let attributes: [NSAttributedString.Key: Any] = [
        //            NSAttributedString.Key.foregroundColor: UIColor.green, NSAttributedString.Key.backgroundColor: UIColor.gray, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        //        ]
        //        let attrString = NSMutableAttributedString(string: string, attributes: attributes)
        //
        //        let newString = ". Как дела?"
        //        let newAttributes: [NSAttributedString.Key: Any] = [
        //            NSAttributedString.Key.foregroundColor: UIColor.yellow, NSAttributedString.Key.backgroundColor: UIColor.black, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.double.rawValue
        //        ]
        //        let newAttrString = NSAttributedString(string: newString, attributes: newAttributes)
        //
        //        attrString.append(newAttrString)
        //        label.attributedText = attrString
        
        
        //        var dictionary = [String: String] ()
        //        dictionary["Pavel"] = "Platov"
        //        print(dictionary["Pavel"])
        //        dictionary["Sergey"] = "Chirva"
        //        print(dictionary["Sergey"])
        //        dictionary["Anastasia"] = "Isaeva"
        //        print(dictionary["Anastasia"])
        //        dictionary["Zahar"] = "Afonin"
        //        print(dictionary["Zahar"])
        //        dictionary["Andrei"] = "Platov"
        //        print(dictionary["Andrei"])
        
        
    }
    private func showAlert() {
        let alert = UIAlertController(title: "Запусти мясоебку", message: "Выбери", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("запустилась мясоебка")
        }
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        let destructive = UIAlertAction(title: "Выебать всех", style: .destructive)
        alert.addAction(destructive)
        
        present(alert, animated: true, completion: nil)
    }
    private func showTextFieldAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField()
        let submit = UIAlertAction(title: "Sumbit", style: .default) { _ in
            if let password = alert.textFields?.first {
                if let text = password.text {
                    if text != "1234" {
                        self.showAlert(title: "Wrong Pass", message: "", defaultAction: nil)
                        
                    } else {
                        self.showAlert(title: "Congratulasions!", text: "Right Pass")
                    }
                }
            }
        }
        alert.addAction(submit)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func createView() {
        let myView = UIView()
        myView.frame = CGRect(x: 150, y: 300, width: 100, height: 100)
        myView.layer.cornerRadius = myView.frame.width / 2
        myView.backgroundColor = .black
        self.view.addSubview(myView)
        myView.dropShadow()
        myView.addGradient()
        
    }
    @IBAction func alertButtonPressed(_ sender: Any) {
//        showAlert(title: "Готов посасать", text: "")
        showTextFieldAlert(title: "Введи", message: "Пароль")
    }
    @IBAction func buttonPressed(_ sender: Any) {
        self.bottomLabelConstraint.constant += 200
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        self.blurView.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            UIView.animate(withDuration: 0.3) {
                self.blurView.isHidden = true
            }
        }
        
    }
    
}
