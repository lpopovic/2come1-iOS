//
//  Helper+UIView.swift
//  2come1
//
//  Created by MacBook on 3/17/20.
//

import Foundation
import UIKit

extension UIView {
   @objc func createCircleView() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    func createBorderView( _ width: CGFloat, _ color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}

extension UIImageView {
    override func createCircleView() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
extension UITableView {

    func scrollToBottom(){

        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections-1) - 1,
                section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }

    func scrollToTop() {

        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
}
