//
//  ViewController.swift
//  CanLo-300941213-IosTest
//
//  Created by Đậu Thư on 2018-12-13.
//  Copyright © 2018 Can Lo. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var bmi: UILabel!
    

    
    var data = ["Data1","Data2","Data3","Data4","Data5","Data6"]
    var bmiArray = [String]()
    var dateArray = [String]()
    var weightArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        readFromUserDefault()
        data = bmiArray
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    func readFromUserDefault()  {
        
          let userDefaults = UserDefaults.standard
        if (userDefaults.stringArray(forKey: "bmis") != nil && userDefaults.stringArray(forKey: "weights") != nil && userDefaults.stringArray(forKey: "dates") != nil ) {
      
        bmiArray = userDefaults.stringArray(forKey: "bmis")!
        weightArray = userDefaults.stringArray(forKey: "weights")!
        dateArray = userDefaults.stringArray(forKey: "dates")!
        }
        else
        {
            return
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return bmiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
       // Write the Data Here
        cell.textLabel?.text = "Weight= " + weightArray[indexPath.row] + " Bmi= " +  bmiArray[indexPath.row] + " Date " + dateArray[indexPath.row];
        
        readFromUserDefault()
    
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

