//
//  UserSearchTableViewCell.swift
//  Github Search
//
//  Created by Akshatha Hegde on 4/10/20.
//  Copyright © 2020 Akshatha Hegde. All rights reserved.
//

import Foundation
import UIKit

class UserSearchTableViewCell: UITableViewCell {
   @IBOutlet weak var userNameLabel: UILabel!
   @IBOutlet weak var repoLabel: UILabel!
   @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        self.avatarImage.layer.masksToBounds = true
        self.avatarImage.layer.cornerRadius = 30.0
    }
    
    
}
