//
//  UnmatchedUserVC.swift
//  2come1
//
//  Created by MacBook on 3/15/20.
//

import UIKit

class UnmatchedUserVC: BaseVC {
      //MARK: Outlet
     @IBOutlet weak var lblTitle: UILabel!
     @IBOutlet weak var lblDescription: UILabel!
     @IBOutlet weak var btnSendRequest: UIButton!
     @IBOutlet weak var lblSendRequest: UILabel!
     @IBOutlet weak var mainScrollView: UIScrollView!
     @IBOutlet weak var imgUserProfile: UIImageView!
     @IBOutlet weak var separatorTopView: UIView!
     //MARK: Variable
     var currentUser: String?
     let text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Enim neque volutpat ac tincidunt. Ullamcorper sit amet risus nullam. Purus semper eget duis at tellus at. Cursus mattis molestie a iaculis at. Scelerisque felis imperdiet proin fermentum leo. Vitae nunc sed velit dignissim sodales ut eu sem. Adipiscing vitae proin sagittis nisl rhoncus. Nibh tortor id aliquet lectus proin nibh nisl. Eget sit amet tellus cras adipiscing enim eu turpis."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.lblTitle.text = "\(self.currentUser ?? ""), 20"
        self.lblDescription.text = self.text
    
        self.initViewSetup()
    }
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           var contentRect = CGRect.zero
           
           for view in mainScrollView.subviews {
               contentRect = contentRect.union(view.frame)
           }
           mainScrollView.contentSize = contentRect.size
       }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           if let nvc = self.navigationController {
               nvc.setNavigationBarHidden(false, animated: animated)
               nvc.navigationBar.tintColor = BaseColor.black.value
               nvc.navigationBar.backgroundColor = BaseColor.white.value
           }
           
           
       }
    
    func initViewSetup() {
        
        self.mainScrollView.bounces = true
        self.mainScrollView.showsHorizontalScrollIndicator = false
        self.mainScrollView.isDirectionalLockEnabled = true
        
        self.view.backgroundColor = .white
        
        self.lblTitle.textColor = BaseColor.black.value
        self.lblTitle.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        self.lblDescription.textColor = BaseColor.black.value
        self.lblDescription.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        self.btnSendRequest.tintColor = BaseColor.black.value
        self.btnSendRequest.setTitle("", for: .normal)
        self.btnSendRequest.setImage(customImages.yinYang.value, for: .normal)
        self.btnSendRequest.layer.borderWidth = 2
        self.btnSendRequest.layer.borderColor = BaseColor.gold.value.cgColor
        self.btnSendRequest.imageEdgeInsets.bottom = 2
        self.btnSendRequest.imageEdgeInsets.top = 2
        self.btnSendRequest.imageEdgeInsets.left = 2
        self.btnSendRequest.imageEdgeInsets.right = 2
        self.btnSendRequest.layer.cornerRadius =  self.btnSendRequest.frame.size.width / 2
        
        self.lblSendRequest.textColor = BaseColor.black.value
        self.lblSendRequest.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        self.lblSendRequest.textAlignment = .center
        self.lblSendRequest.textColor = BaseColor.gold.value
        self.lblSendRequest.layer.borderWidth = 2
        self.lblSendRequest.layer.borderColor = BaseColor.gold.value.cgColor
        self.lblSendRequest.backgroundColor = BaseColor.black.value
        self.lblSendRequest.text = NSLocalizedString("Send Requests", comment: "comment for user").uppercased()
        
        
        self.separatorTopView.backgroundColor = BaseColor.gold.value
    }
    
    @IBAction func btnSendRequestAction(_ sender: UIButton) {
         UIAlertController.createCustomAlert(self, "Action", "Send Request", [UIAlertAction.createDefoultOkAction()])
     }
}

