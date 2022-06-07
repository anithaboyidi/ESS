//
//  EmployeeCell.swift
//  ESS
//
//  Created by wido technologies on 03/06/22.
//

import UIKit
import Contacts

class EmployeeCell: UITableViewCell {
    
    @IBOutlet var firstName: UILabel!
    @IBOutlet var lastName: UILabel!
    @IBOutlet var detailsButton: UIButton!
    
    private var contact: CNContact!
    var isMatched = false
    
 
    
    func setup(_ user: Contact, isMatchedContact: Bool) {
        
        firstName.text = user.name
        lastName.text = user.email
        
        detailsButton.isHidden = !isMatchedContact
        self.isMatched = isMatchedContact
    }
}
