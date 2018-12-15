//
//  SplashViewController.swift
//  CanLo-300941213-IosTest
//
//  Created by Đậu Thư on 2018-12-13.
//  Copyright © 2018 Can Lo. All rights reserved.
//

import Foundation

import UIKit

class CalculationViewController: UIViewController {
    
    var result:Double = 0;
    var bmiArray = [String]()
    var dateArray = [String]()
    var weightArray = [String]()
    
    
    override func viewDidLoad() {
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        _ = Date(timeIntervalSinceReferenceDate: 118800)
        super.viewDidLoad()
        readFromUserDefault()
        

        
   

    }
    
    func readFromUserDefault()  {
    
        let userDefaults = UserDefaults.standard
        if (userDefaults.stringArray(forKey: "bmis") != nil && userDefaults.stringArray(forKey: "weights") != nil && userDefaults.stringArray(forKey: "dates") != nil ) {
        bmiArray = userDefaults.stringArray(forKey: "bmis")!
        weightArray = userDefaults.stringArray(forKey: "weights")!
        } else
        {
            return
            
        }

        
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var sw: UISwitch!
    @IBAction func SeeRecords(_ sender: UIButton) {
        if(bmiArray == nil || bmiArray == ["",""] || weightArray == nil || weightArray == ["",""])
        {
            return
        }
    }
    
    @IBAction func CalculateBmi(_ sender: UIButton) {
        if  (self.height.text == "" || self.weight.text == "" ||
            self.height.text == nil || self.weight.text == nil || Double(weight.text!)! > 200 || Double(weight.text!)! <= 0 || Double(height.text!)! <= 0 )
        {
            label.text = "Invalid Entiry"
            return
        } else {
        
       if (sw.isOn){
                                 result = (Double(weight.text!)! * 703) / (Double(height.text!)! * Double(height.text!)!);
    
        }
       else {
            result = Double(weight.text!)! / (Double(height.text!)! * Double(height.text!)!);
       }
    
        if(result<=16){
            label.text = "Severe Thinness"
        }
        if(result>16 && result<17){
            label.text = "Moderate Thinness"
        }
        if(result>=17 && result<18.5){
        label.text = "Mild Thinness"
        }
        if(result>=17 && result<18.5){
            label.text = "Normal"
        }
        if(result>=25 && result<30){
            label.text = "Overweight"
        }
        if(result>=30 && result<35){
            label.text = "Obese Class I"
        }
        if(result>=35 && result<40){
             label.text = "Obese Class II"
        }
        if(result>=40){
            label.text = "Obese Class III"
        }
        
        // Take only a decimal place
        
        writeToUserDefaults()
        
    }
    }
    public func writeToUserDefaults() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        let date = Date(timeIntervalSinceReferenceDate: 118800)

        weightArray.append(weight.text!)
        bmiArray.append(String(result))
        dateArray.append(dateFormatter.string(from: date))
      //  dateArray.append(date)
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(weightArray, forKey: "weights")
        userDefaults.set(bmiArray, forKey: "bmis")
        userDefaults.set(dateArray, forKey: "dates")
        
        print(dateArray)
        print(weightArray)
        print(bmiArray)
    }
    

    
}
