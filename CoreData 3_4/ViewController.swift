//
//  ViewController.swift
//  CoreData 3_4
//
//  Created by iOS TeamLead on 4/3/19.
//  Copyright © 2019 iOS TeamLead. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        appDelegate.arrayGloble.removeAll()
        
    }
    @IBAction func btnSave(_ sender: UIButton) {
        ServiceManager.shared.insertDataFromLocalDataBase(name: txtName.text!, city: txtCity.text!)
        txtName.text = ""
        txtCity.text = ""
    }
    @IBAction func btnFatch(_ sender: UIButton) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
        guard let navigationController = navigationController else {
            return
        }
        ServiceManager.shared.fetchDataFromLocalDataBase()
        
        navigationController.pushViewController(secondVC!, animated: true)
        
    }
    @IBAction func btnUpdate(_ sender: UIButton) {
        ServiceManager.shared.updateDataFromLocalDataBase(name: txtName.text!, city: txtCity.text!)
        txtName.text = ""
        txtCity.text = ""
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        ServiceManager.shared.deleteDataFromLocalDataBase(name: txtName.text!, city: txtCity.text!)
        txtName.text = ""
        txtCity.text = ""
        
    }
}

