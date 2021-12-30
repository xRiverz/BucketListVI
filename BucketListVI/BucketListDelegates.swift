//
//  BucketListDelegates.swift
//  BucketListVI
//
//  Created by admin on 30/12/2021.
//

import Foundation
import UIKit

protocol BucketListDelegates : class {
    func cancelButtonPressed(by controller:VIBucket)
    func saveButtonPressed(by controller:VIBucket, with text:String, at indexPath:IndexPath?)
}
