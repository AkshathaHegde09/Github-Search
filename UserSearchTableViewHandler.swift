//
//  UserSearchTableViewHandler.swift
//  Github Search
//
//  Created by Akshatha Hegde on 4/11/20.
//  Copyright © 2020 Akshatha Hegde. All rights reserved.
//

import Foundation
import UIKit

extension UserSearchViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            if let query = searchBar.text
            {
                if query.contains(" ")
                {
                    Utility.showErrorAlert(msg: GEN_STRINGS.NO_SPACE)
                    return
                }
                if(!Utility.isInternetAvailable())
                {
                    Utility.showErrorAlert(msg: GEN_STRINGS.NO_NET)
                    return
                }
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIERS.SEARCH_TABLE_CELL) as! UserSearchTableViewCell
            let activeUser = dataArray[indexPath.row]
            configureCell(activeUser: activeUser, cell: cell)
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataArray.count
        }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: false)
            let activeUser = dataArray[indexPath.row]
            let cell = tableView.cellForRow(at: indexPath) as! UserSearchTableViewCell
            let currentUserImage = cell.avatarImage.image
            
            let userProfileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:IDENTIFIERS.USER_PROFILE_VIEW_CONTROLLER) as! UserProfileViewController
            
    //        if let _ = currentUserImage
    //        {
    //            userProfileViewController.userImage = currentUserImage!
    //        }
    //            self.navigationController?.pushViewController(userProfileViewController, animated: true)
    //
            
        }
        
        func configureCell(activeUser: User, cell: UserSearchTableViewCell)
            {
            cell.userNameLabel.text = activeUser.name
            cell.repoLabel.text = activeUser.location
           
            if activeUser.avatarUrl != GEN_STRINGS.NO_URL
            {
                let url = URL(string:activeUser.avatarUrl)
                let data = try? Data(contentsOf: url!)
                let image: UIImage = UIImage(data: data!)!
                cell.avatarImage.image = image
            }
            else{
                if let _ = cell.avatarImage
                {
                    cell.avatarImage.removeFromSuperview()
                }
            }
            
            
    //            cell.repoLabel.format = "%d"
    //            cell.repoLabel.count(from: 0.0, to: CGFloat(activeUser.publicRepos!), withDuration: 1.0)
            
        }
        
}

