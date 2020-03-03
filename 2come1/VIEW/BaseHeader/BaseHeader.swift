//
//  BaseHeader.swift
//  2come1
//
//  Created by MacBook on 3/3/20.
//

import UIKit

class BaseHeader: UIView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    func setup(_ title:String,_ separatorColor: UIColor) {
        self.title.text = title
        self.title.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        self.borderView.backgroundColor = separatorColor
        self.backgroundColor = BaseColor.white.value
    }

}
