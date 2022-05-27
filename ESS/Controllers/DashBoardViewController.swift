//
//  DashBoardViewController.swift
//  ESS
//
//  Created by wido technologies on 27/05/22.
//

import UIKit

class DashBoardViewController: UIViewController {
    
    @IBOutlet var sideMenuBtn: UIBarButtonItem!

    @IBOutlet weak var EmployeeImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Menu Button Tint Color
        EmployeeImage.layer.masksToBounds = true
        EmployeeImage.layer.cornerRadius = EmployeeImage.bounds.width / 2
        
        
        navigationController?.navigationBar.tintColor = .white

        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
        
        
    }
}
