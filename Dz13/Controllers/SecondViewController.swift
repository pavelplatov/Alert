//
//  SecondViewController.swift
//  Dz13
//
//  Created by Павел Платов on 07.01.2024.
//

import UIKit

class SecondViewController: UIViewController {
    let myView = UIView()
    let redButton = UIButton()
    let blueButton = UIButton()
    let greenButton = UIButton()
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.frame = CGRect(x: -200, y: 50, width: 200, height: 400)
        myView.backgroundColor = .lightGray
        self.view.addSubview(myView)
        

    }
    
@IBAction func buttonPressed(_ sender: Any) {
    animateView()
    addButtonRed()
    addButtonBlue()
    addButtonGreen()
    self.blurView.isHidden = false
    }
  
    private func animateView() {
        UIView.animate(withDuration: 0.3) {
            self.myView.frame.origin.x += 200
        }
        
    }
func addButtonRed() {
redButton.setTitle("Красный", for: .normal)
redButton.frame = CGRect(x: 20, y: 100, width: 100, height: 40)
redButton.addTarget(self, action: #selector(changeColorRed), for: .touchUpInside)
    redButton.setTitleColor(.red, for: .normal)
self.view.addSubview(redButton)
    
    }
    
    func addButtonBlue() {
    blueButton.setTitle("Cиний", for: .normal)
    blueButton.frame = CGRect(x: 20, y: 200, width: 100, height: 40)
    blueButton.addTarget(self, action: #selector(changeColorBlue), for: .touchUpInside)
        blueButton.setTitleColor(.blue, for: .normal)
    self.view.addSubview(blueButton)
        
        }
    func addButtonGreen() {
        greenButton.setTitle("Зеленый", for: .normal)
        greenButton.frame = CGRect(x: 20, y: 300, width: 100, height: 40)
        greenButton.addTarget(self, action: #selector(changeColorGreen), for: .touchUpInside)
            greenButton.setTitleColor(.green, for: .normal)
        self.view.addSubview(greenButton)
            
            }
    
    
    @objc private func changeColorRed() {
        
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = .red
        }
    }
    @objc private func changeColorBlue() {
        
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = .blue
            
        }
    }
    @objc private func changeColorGreen() {
        
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = .green
        }
    }

}
