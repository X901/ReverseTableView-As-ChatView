////
//ViewController.swift
//reverseDataVSReverseTable
//
//Created by Basel Baragabah on 10/07/2019.
//Copyright © 2019 Basel Baragabah. All rights reserved.
//

import UIKit

class ReverseTableViewController: UIViewController {
    
    @IBOutlet weak var messageTextfield: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayData = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // flip tableview
        tableView.transform = CGAffineTransform(rotationAngle: -(CGFloat)(Double.pi));

        // flip scrolling
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: tableView.bounds.size.width - 8.0)

    }
    
    

    @IBAction func sendTapped(_ sender: UIButton) {
        
        if let message = messageTextfield.text {
            arrayData.insert(message, at: 0 )
            tableView.reloadData()
        }
    }
    
}

extension ReverseTableViewController: UITableViewDataSource {



 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if arrayData.count > 0 {
        return arrayData.count
    }
    
        return 0
}


 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reverseDataCell", for: indexPath)
    
    // flip cell
    cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));

    cell.textLabel?.text = arrayData[indexPath.row]
    
    return cell
}

}
