//
//  UserSearchViewController.swift
//  Github Search
//
//  Created by Akshatha Hegde on 4/10/20.
//  Copyright © 2020 Akshatha Hegde. All rights reserved.
//

import Foundation
import UIKit

class UserSearchViewController: UIViewController
{
    
    var dataArray: Array<User> = []
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    override func viewDidLoad() {
           initializeSearchTableView()
       }
    
    override func viewWillAppear(_ animated: Bool) {
        searchBarOutlet.becomeFirstResponder()
    }
    
    func initializeSearchTableView()
    {
        let nib = UINib(nibName: "UserSearchTableViewCell", bundle: nil)
        tableViewOutlet.register(nib, forCellReuseIdentifier: IDENTIFIERS.SEARCH_TABLE_CELL)
        tableViewOutlet.showsVerticalScrollIndicator = false
        tableViewOutlet.separatorStyle = .none
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        searchBarOutlet.delegate = self
        searchBarOutlet.returnKeyType = .search
    }
    
    
}
