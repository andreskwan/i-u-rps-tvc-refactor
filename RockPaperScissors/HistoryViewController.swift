//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Andres Kwan on 11/3/15.
//  Copyright © 2015 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var history: [RPSMatch]!
    let cellIdentifier = "matchResultCellIdentifier"
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //what should happen if user hit the history button and there is not game played yet?
        return history!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //1 obtain(dequeue) the cell from the tableView with indexPath
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        //2 prepare data to be used in the cell
        let match = history[indexPath.row]
        //3 add data to the cell 
        cell.textLabel?.text = match.resultString()
        
        // If the cell has a detail label, we will put the evil scheme in.
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = match.messageResult()
        }
        return cell
    }
}