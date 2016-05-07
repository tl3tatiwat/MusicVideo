//
//  MyExtensions.swift
//  MusicVideo
//
//  Created by Tatiwat Borwornrattanakit on 5/7/2559 BE.
//  Copyright © 2559 Tatiwat Borwornrattanakit. All rights reserved.
//

import UIKit

extension MusicVideoTVC: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        searchController.searchBar.text!.lowercaseString
        filterSearch(searchController.searchBar.text!)
    }
}