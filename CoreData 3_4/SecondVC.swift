//
//  SecondVC.swift
//  CoreData 3_4
//
//  Created by iOS TeamLead on 4/3/19.
//  Copyright © 2019 iOS TeamLead. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var tblData: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension SecondVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.arrayGloble.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as?  TableViewCell
        cell?.lblName.text = appDelegate.arrayGloble[indexPath.row].name
        cell?.lblCiy.text = appDelegate.arrayGloble[indexPath.row].city
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
