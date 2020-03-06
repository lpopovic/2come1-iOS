//
//  NearbyVC.swift
//  2come1
//
//  Created by MacBook on 3/3/20.
//

import UIKit

class NearbyVC: BaseVC {
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var viewHeader: BaseHeader!
    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            self.tableView.backgroundView?.backgroundColor = .clear
            self.tableView.backgroundColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewHeader.setup(NSLocalizedString("Nearby",
                                                comment: "comment for user"), BaseColor.gold.value)
        self.viewBackground.backgroundColor = .darkGray
//        self.imageViewBackground.image = customImages.jin.value.withTintColor(.black)
        
    }
    
}
