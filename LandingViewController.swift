//
//  LandingViewController.swift
//  Github Search
//
//  Created by Akshatha Hegde on 4/10/20.
//  Copyright © 2020 Akshatha Hegde. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
   @IBAction func searchBtnAction(_ sender: AnyObject) {
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "UserSearchViewController") as! UserSearchViewController
            self.present(newViewController, animated: true, completion: nil)
//    let profileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserSearchViewController") as! UserSearchViewController
//     self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
}

