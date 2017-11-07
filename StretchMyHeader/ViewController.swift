//
//  ViewController.swift
//  StretchMyHeader
//
//  Created by Carlo Namoca on 2017-11-07.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

import UIKit

var headerView: UIView!

let items = [
    NewsItem (category: .World, summary: "Climate change protests, divestments meet fossil fuels realities"),
    NewsItem (category: .Europe, summary: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime"),
    NewsItem (category: .MiddleEast, summary: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
    NewsItem (category: .Africa, summary: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
    NewsItem (category: .AsiaPacific, summary: "Despite UN ruling, Japan seeks backing for whale hunting"),
    NewsItem (category: .Americas, summary: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
    NewsItem (category: .World, summary: "South Africa in $40 billion deal for Russian nuclear reactors"),
    NewsItem (category: .Europe, summary: "One million babies' created by EU student exchanges"),
    ]

private let kTableHeaderHeight: CGFloat = 200.0

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight, 0, 0, 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
    }

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    //MARK: UIScrollViewDelegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! NewsItemCell
        cell.newsItem = item
        return cell
    }
    
    //MARK: Methods
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
    }

}

