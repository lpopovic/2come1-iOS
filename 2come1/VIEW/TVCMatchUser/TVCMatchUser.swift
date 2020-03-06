//
//  TVCMatchUser.swift
//  2come1
//
//  Created by MacBook on 3/6/20.
//

import UIKit

class TVCMatchUser: UITableViewCell {
    
    @IBOutlet weak var imgUserImage: UIImageView!
    @IBOutlet weak var lblUserDescritpion: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupUI()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setupUI() -> Void {
        
        self.contentView.backgroundColor = .clear
        
        self.lblUserDescritpion.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        self.lblUserDescritpion.numberOfLines = 0
        self.lblUserDescritpion.textAlignment = .left
        
        self.imgUserImage.layer.cornerRadius = self.imgUserImage.frame.size.height / 2
        self.imgUserImage.clipsToBounds = true
        self.imgUserImage.contentMode = .scaleAspectFit
        self.imgUserImage.layer.borderWidth = 2
        self.imgUserImage.layer.borderColor = BaseColor.black.value.cgColor
    }
    
    func setupUIData(_ user: String) {
        self.imgUserImage.backgroundColor = .red
        self.lblUserDescritpion.text = "\(user), 30"
    }
    
}
