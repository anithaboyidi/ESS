//
//  DashBoardViewController.swift
//  ESS
//
//  Created by wido technologies on 27/05/22.
//

import UIKit


class DashBoardViewController: UIViewController {
    
    @IBOutlet var sideMenuBtn: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    

    
    let parser = Parser()
    
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        self.tableView.register(UINib(nibName: "EmployeeCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.sideMenuBtn.target = revealViewController()
        self.sideMenuBtn.action = #selector(self.revealViewController()?.revealSideMenu)
        
        parser.parse {
            data in
            self.contacts = data
            DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        }
        tableView.dataSource = self
        tableView.delegate = self
    }

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.revealViewController()?.gestureEnabled = false
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.revealViewController()?.gestureEnabled = true
}
}
extension DashBoardViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? EmployeeCell {
            
            
            cell.firstName.text = contacts[indexPath.row].name
            cell.lastName.text = contacts[indexPath.row].email
            
           
          
               return cell
            
    }
    
    return UITableViewCell()
}
}





