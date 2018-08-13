//
//  ViewController.swift
//  Window-Shopper
//
//  Created by Shay Dubrovsky on 13/08/2018.
//  Copyright © 2018 Shay Dubrovsky. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var wageTxt: CurrencyTxtField!
    @IBOutlet weak var priceTxt: CurrencyTxtField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        
        calcBtn.backgroundColor = #colorLiteral(red: 1, green: 0.5976436734, blue: 0, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcBtn.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
        
        hideLabels(hidden: true)
    }
    
    @objc func calculate() {
        if let wageTxt = wageTxt.text, let priceTxt = priceTxt.text {
            if let wage = Double(wageTxt), let price = Double(priceTxt) {
//                Hide the keyboard
                view.endEditing(true)
                hideLabels(hidden: false)
                
                resultLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
    }
    
    func hideLabels(hidden: Bool) {
        resultLbl.isHidden = hidden
        hoursLbl.isHidden = hidden
    }
    
    @IBAction func clearCalculatorPressed(_ sender: Any) {
        hideLabels(hidden: true)
        wageTxt.text = ""
        priceTxt.text = ""
    }
}
