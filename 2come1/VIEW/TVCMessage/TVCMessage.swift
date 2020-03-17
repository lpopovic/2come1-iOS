//
//  TVCMessage.swift
//  2come1
//
//  Created by MacBook on 3/17/20.
//

import UIKit

class TVCMessage: UITableViewCell {
    
    @IBOutlet var messageBackground: UIView!
    @IBOutlet var imgUser: UIImageView!
    @IBOutlet var messageBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initView()
        
    }
    func initView() -> Void {
        imgUser.createCircleView()
        messageBody.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        messageBody.textColor = BaseColor.black.value
        messageBody.textAlignment = .left
        messageBackground.backgroundColor = BaseColor.white.value
        messageBackground.clipsToBounds = true
        messageBackground.layer.cornerRadius = 4
    }
    func initData(text: String, isSender:Bool, image:UIImage) {
        self.imgUser.image = image
        self.messageBody.text = text
        if isSender == true {
            messageBackground.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,.layerMaxXMinYCorner]
        } else {
            messageBackground.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,.layerMinXMinYCorner]
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
