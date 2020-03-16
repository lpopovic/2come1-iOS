//
//  TVCInboxUser.swift
//  2come1
//
//  Created by MacBook on 3/16/20.
//

import UIKit

class TVCInboxUser: UITableViewCell {

    //MARK: IBOutlet
    @IBOutlet weak var imgProfileUser: UIImageView!
    @IBOutlet weak var lblNameUser: UILabel!
    @IBOutlet weak var lblTextMessage: UILabel!
    @IBOutlet weak var lblStatusValue: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblNumberOfNewMessageValue: UILabel!
    @IBOutlet weak var leftSuperView: NSLayoutConstraint!
    @IBOutlet weak var leftLblNumberMessages: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initViewSetup()
    }
    
    func setupData(user:String) {
        self.lblNameUser.text = user
        self.lblTextMessage.text = "Test dasdas a das das da da asd as das das das das das d kjlkj hlkjlk"
        self.lblStatusValue.text =  NSLocalizedString("Online", comment: "comment for user")
        self.lblNumberOfNewMessageValue.text = "3"
    }
    func hideLblNumberOfNewMessageValue(_ hide: Bool) {
        if hide == true {
            self.leftLblNumberMessages.constant = -100
             self.lblNumberOfNewMessageValue.isHidden = true
        }else {
            self.leftLblNumberMessages.constant = 8
             self.lblNumberOfNewMessageValue.isHidden = false
        }
    }
    
    func initViewSetup() -> Void {
        
        self.imgProfileUser.layer.borderWidth = 2
        self.imgProfileUser.layer.borderColor = BaseColor.black.value.cgColor
        self.imgProfileUser.layer.cornerRadius =  self.imgProfileUser.frame.size.width / 2
        self.imgProfileUser.contentMode = .scaleAspectFill
        self.imgProfileUser.clipsToBounds = true
        
        self.lblNameUser.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        self.lblNameUser.numberOfLines = 0
        self.lblNameUser.textAlignment = .left
        self.lblNameUser.textColor = BaseColor.black.value
        
        self.lblTextMessage.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        self.lblTextMessage.numberOfLines = 0
        self.lblTextMessage.textAlignment = .left
        self.lblTextMessage.textColor = BaseColor.black.value
        
        self.lblStatusValue.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        self.lblStatusValue.numberOfLines = 0
        self.lblStatusValue.textAlignment = .left
        self.lblStatusValue.textColor = BaseColor.black.value
        
        self.lblStatus.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight.regular)
        self.lblStatus.numberOfLines = 1
        self.lblStatus.textAlignment = .right
        self.lblStatus.textColor = BaseColor.black.value
        self.lblStatus.text = "\(NSLocalizedString("Status", comment: " comment for user")): "
        
        self.lblNumberOfNewMessageValue.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        self.lblNumberOfNewMessageValue.numberOfLines = 1
        self.lblNumberOfNewMessageValue.textAlignment = .center
        self.lblNumberOfNewMessageValue.textColor = BaseColor.white.value
        self.lblNumberOfNewMessageValue.backgroundColor = BaseColor.gold.value
        self.lblNumberOfNewMessageValue.layer.cornerRadius =  self.lblNumberOfNewMessageValue.frame.size.width / 2
        self.lblNumberOfNewMessageValue.clipsToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
