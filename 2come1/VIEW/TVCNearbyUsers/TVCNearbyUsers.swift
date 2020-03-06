//
//  TVCNearbyUsers.swift
//  2come1
//
//  Created by MacBook on 3/3/20.
//

import UIKit

protocol TVCNearbyUsersDelegate {
    func onPressNearbyUser(_ user: String) -> Void
}

class TVCNearbyUsers: UITableViewCell {
    
    @IBOutlet weak var user1: NearbyUser!
    @IBOutlet weak var user2: NearbyUser!
    @IBOutlet weak var user3: NearbyUser!
    var delegate: TVCNearbyUsersDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.backgroundColor = .clear
        self.user1.delegate = self
        self.user2.delegate = self
        self.user3.delegate = self
        
        self.user1.isHidden = true
        self.user2.isHidden = true
        self.user3.isHidden = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setup(_ users:[String]) {
        switch users.count {
        case 1:
            self.user1.setup(users[0])
            self.user1.isHidden = false
            break
        case 2:
            self.user1.setup(users[0])
            self.user1.isHidden = false
            self.user2.setup(users[1])
            self.user2.isHidden = false
            break
        case 3:
            self.user1.setup(users[0])
            self.user1.isHidden = false
            self.user2.setup(users[1])
            self.user2.isHidden = false
            self.user3.setup(users[2])
            self.user3.isHidden = false
            break
        default:
            break
        }
    }
    
}

extension TVCNearbyUsers: NearbyUserDelegate {
    func onPressNearbyUser(_ user: String) {
        self.delegate?.onPressNearbyUser(user)
    }
    
    
}
