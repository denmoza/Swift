//
//  ViewController.swift
//  forfun5
//
//  Created by Denmoza on 31/10/20.
//  Copyright © 2020 Denmoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var status:Int = 0
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        lblStatus.text = "Status: \(status)"
    }
    
    @IBAction func segue(_ sender: Any) {
        if status == 0 {
            self.performSegue(withIdentifier: "setup", sender: self)
        } else if status == 1 {
            self.performSegue(withIdentifier: "main", sender: self)
        }
    }
    
    @IBAction func change(_ sender: Any) {
        if status == 0 {
            status += 1
            lblStatus.text = "Status: \(status)"
        } else if status == 1 {
            status -= 1
            lblStatus.text = "Status: \(status)"
        }
    }
    
}

