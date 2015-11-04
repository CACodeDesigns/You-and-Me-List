//
//  IconPickerViewController.swift
//  You and Me List
//
//  Created by Paul Prestwood on 7/30/15.
//  Copyright (c) 2015 Paul Prestwood. All rights reserved.
//

//MARK: This ViewController manages the the list icons for the App.

import UIKit

protocol IconPickerViewControllerDelegate: class {
    func iconPicker(picker: IconPickerViewController, didPickIcon iconName: String)
}

class IconPickerViewController:UITableViewController {
    weak var delegate: IconPickerViewControllerDelegate?
    
    let icons = [
        "No Icon",
        "Appointments",
        "Birthdays",
        "Chores",
        "Drinks",
        "Folder",
        "Groceries",
        "Inbox",
        "Photos",
        "Trips"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IconCell", forIndexPath: indexPath)
        
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let delegate = delegate {
            let iconName = icons[indexPath.row]
            delegate.iconPicker(self, didPickIcon: iconName)
        }
    }
}