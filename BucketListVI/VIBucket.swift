//
//  VIBucket.swift
//  BucketListVI
//
//  Created by admin on 30/12/2021.
//

import UIKit

class VIBucket : UITableViewController {
    
    
    @IBOutlet weak var itemTextField: UITextField!
    
    var myTitle:String?
    var item:String?
    var indexPath:IndexPath?
    
    weak var delegate:BucketListDelegates?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = myTitle
        itemTextField.text = item
    }
    
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by:self)
    }    
    @IBAction func saveBarButtonPressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        delegate?.saveButtonPressed(by: self, with: text, at: indexPath)
    }
}
