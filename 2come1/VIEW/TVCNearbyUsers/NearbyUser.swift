//
//  NearbyUser.swift
//  2come1
//
//  Created by MacBook on 3/3/20.
//
import Foundation
import UIKit

protocol NearbyUserDelegate {
    func onPressNearbyUser(_ user: String) -> Void
}

class NearbyUser: UIView {
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imageViewUser: UIImageView!
    //    @IBOutlet weak var viewTap: UIView!
    var userName: String = ""
    var delegate: NearbyUserDelegate?
    override init(frame: CGRect) {
          super.init(frame: frame)
      }
      
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
      }
    override func awakeFromNib() {
        super.awakeFromNib()
        //custom logic goes here
        self.imageViewUser.layer.cornerRadius =  self.imageViewUser.frame.size.width / 2
        self.imageViewUser.clipsToBounds = true
        self.imageViewUser.contentMode = .scaleAspectFit
        self.imageViewUser.layer.borderWidth = 2
        self.imageViewUser.layer.borderColor = BaseColor.white.value.cgColor
        
        self.imageViewUser.isUserInteractionEnabled = true
        
        self.imageViewUser.isMultipleTouchEnabled = true
        self.imageViewUser.gestureRecognizers?.removeAll()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.imageViewUser.addGestureRecognizer(tap)
        
        self.lblDescription.textAlignment = .center
        self.lblDescription.textColor = BaseColor.gold.value
        self.lblDescription.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        
        self.backgroundColor = .clear
        
        
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        self.delegate?.onPressNearbyUser(self.userName)
    }
    
    
    func setup(_ user: String){
        self.userName = user
        self.lblDescription.text = "\(user),100km"
        self.imageViewUser.image = customImages.userAvatar.value.imageWithColor(color1:BaseColor.gold.value)
        
        
    }
    
}
