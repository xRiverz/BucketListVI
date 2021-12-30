//
//  ViewController.swift
//  BucketListVI
//
//  Created by admin on 30/12/2021.
//

import UIKit

class ViewController: UITableViewController, BucketListDelegates {
    
    
    var items : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketListItem", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        prepareVC(indexPath)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        prepareVC(sender)
    }
    
    func cancelButtonPressed(by controller: VIBucket) {
        controller.navigationController?.popViewController(animated: true)
        
    }
    
    func saveButtonPressed(by controller: VIBucket, with text: String, at indexPath: IndexPath?) {
        if let indexPath = indexPath {
            items[indexPath.row] = text
        }else {
            items.append(text)
        }
        tableView.reloadData()
        controller.navigationController?.popViewController(animated: true)
    }
    
    func prepareVC(_ sender:Any?){
        if sender is UIBarButtonItem {
            let navigationVC = storyboard?.instantiateViewController(identifier: "SecondVC") as! UINavigationController
            let secondVC = navigationVC.topViewController as! VIBucket
            secondVC.myTitle = "Add Item"
            secondVC.delegate = self
            self.navigationController?.pushViewController(secondVC, animated: true)
        }else if sender is IndexPath {
            let navigationVC = storyboard?.instantiateViewController(identifier: "SecondVC") as! UINavigationController
            let secondVC = navigationVC.topViewController as! VIBucket
            secondVC.myTitle = "Edit Item"
            secondVC.delegate = self
            let indexPath = sender as! IndexPath
            secondVC.item = items[indexPath.row]
            secondVC.indexPath = indexPath
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
    
}
