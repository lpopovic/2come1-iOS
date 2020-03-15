//
//  RequestedMatchUserVC.swift
//  2come1
//
//  Created by MacBook on 3/15/20.
//

import UIKit

class RequestedMatchUserVC: BaseVC {
    
    //MARK: Outlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var btnAcceptRequest: UIButton!
    @IBOutlet weak var lblAcceptRequest: UILabel!
    
    @IBOutlet weak var btnDeclineRequest: UIButton!
    @IBOutlet weak var lblDeclineRequest: UILabel!
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var imgMainUserProfile: UIImageView!
    @IBOutlet weak var imgUserProfile1: UIImageView!
    @IBOutlet weak var imgUserProfile2: UIImageView!
    @IBOutlet weak var imgUserProfile3: UIImageView!
    
    @IBOutlet weak var separatorTopView: UIView!
    @IBOutlet weak var separatorBottomView: UIView!
    
    //MARK: Variable
    var currentUser: String?
    let text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Enim neque volutpat ac tincidunt. Ullamcorper sit amet risus nullam. Purus semper eget duis at tellus at. Cursus mattis molestie a iaculis at. Scelerisque felis imperdiet proin fermentum leo. Vitae nunc sed velit dignissim sodales ut eu sem. Adipiscing vitae proin sagittis nisl rhoncus. Nibh tortor id aliquet lectus proin nibh nisl. Eget sit amet tellus cras adipiscing enim eu turpis."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.initViewSetup()
        self.initActionTapImageView()
        
        self.lblTitle.text = "\(self.currentUser ?? ""), 20"
        self.lblDescription.text = self.text
        
        self.imgMainUserProfile.image = testImages.test1.value
        self.imgUserProfile1.image = testImages.test1.value
        self.imgUserProfile2.image = testImages.test2.value
        self.imgUserProfile3.image = testImages.test3.value
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
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
        
        self.btnAcceptRequest.tintColor = BaseColor.black.value
        self.btnAcceptRequest.backgroundColor = BaseColor.white.value
        self.btnAcceptRequest.setTitle("", for: .normal)
        self.btnAcceptRequest.setImage(customImages.yinYang.value, for: .normal)
        self.btnAcceptRequest.layer.borderWidth = 2
        self.btnAcceptRequest.layer.borderColor = BaseColor.gold.value.cgColor
        self.btnAcceptRequest.imageEdgeInsets.bottom = 2
        self.btnAcceptRequest.imageEdgeInsets.top = 2
        self.btnAcceptRequest.imageEdgeInsets.left = 2
        self.btnAcceptRequest.imageEdgeInsets.right = 2
        self.btnAcceptRequest.layer.cornerRadius =  self.btnAcceptRequest.frame.size.width / 2
        
        self.lblAcceptRequest.textColor = BaseColor.black.value
        self.lblAcceptRequest.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        self.lblAcceptRequest.textAlignment = .center
        self.lblAcceptRequest.textColor = BaseColor.gold.value
        self.lblAcceptRequest.layer.borderWidth = 2
        self.lblAcceptRequest.layer.borderColor = BaseColor.gold.value.cgColor
        self.lblAcceptRequest.backgroundColor = BaseColor.black.value
        self.lblAcceptRequest.text = " \(NSLocalizedString("Accept", comment: "comment for user").uppercased()) "
        
        self.btnDeclineRequest.tintColor = BaseColor.black.value
        self.btnDeclineRequest.backgroundColor = BaseColor.white.value
        self.btnDeclineRequest.setTitle("X", for: .normal)
        self.btnDeclineRequest.setTitleColor(BaseColor.black.value, for: .normal)
        self.btnDeclineRequest.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        self.btnDeclineRequest.layer.borderWidth = 2
        self.btnDeclineRequest.layer.borderColor = BaseColor.gold.value.cgColor
        self.btnDeclineRequest.imageEdgeInsets.bottom = 2
        self.btnDeclineRequest.imageEdgeInsets.top = 2
        self.btnDeclineRequest.imageEdgeInsets.left = 2
        self.btnDeclineRequest.imageEdgeInsets.right = 2
        self.btnDeclineRequest.layer.cornerRadius =  self.btnAcceptRequest.frame.size.width / 2
        
        self.lblDeclineRequest.textColor = BaseColor.black.value
        self.lblDeclineRequest.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        self.lblDeclineRequest.textAlignment = .center
        self.lblDeclineRequest.textColor = BaseColor.gold.value
        self.lblDeclineRequest.layer.borderWidth = 2
        self.lblDeclineRequest.layer.borderColor = BaseColor.gold.value.cgColor
        self.lblDeclineRequest.backgroundColor = BaseColor.black.value
        self.lblDeclineRequest.text = " \(NSLocalizedString("Decline", comment: "comment for user").uppercased()) "
        
        
        self.separatorTopView.backgroundColor = BaseColor.gold.value
        self.separatorBottomView.backgroundColor = BaseColor.gold.value
        
        self.imgUserProfile1.layer.borderColor = BaseColor.gold.value.cgColor
        self.imgUserProfile1.layer.borderWidth = 2
        self.imgUserProfile1.contentMode = .scaleAspectFit
        self.imgUserProfile1.tag = 1
        
        self.imgUserProfile2.layer.borderColor = BaseColor.gold.value.cgColor
        self.imgUserProfile2.layer.borderWidth = 2
        self.imgUserProfile2.contentMode = .scaleAspectFit
        self.imgUserProfile2.tag = 2
        
        self.imgUserProfile3.layer.borderColor = BaseColor.gold.value.cgColor
        self.imgUserProfile3.layer.borderWidth = 2
        self.imgUserProfile3.contentMode = .scaleAspectFit
        self.imgUserProfile3.tag = 3
    }
    //MARK: ACTION
    @IBAction func btnAcceptRequestAction(_ sender: UIButton) {
        UIAlertController.createCustomAlert(self, "Action", "Accept Request Action", [UIAlertAction.createDefoultOkAction()])
    }
    
    @IBAction func btnDeclineRequestAction(_ sender: UIButton) {
        UIAlertController.createCustomAlert(self, "Action", "Decline Request Action", [UIAlertAction.createDefoultOkAction()])
    }
    
    func initActionTapImageView(){
        
        self.imgUserProfile1.isUserInteractionEnabled = true
        self.imgUserProfile1.isMultipleTouchEnabled = true
        self.imgUserProfile1.gestureRecognizers?.removeAll()
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.imgUserProfile1.addGestureRecognizer(tap1)
        
        self.imgUserProfile2.isUserInteractionEnabled = true
        self.imgUserProfile2.isMultipleTouchEnabled = true
        self.imgUserProfile2.gestureRecognizers?.removeAll()
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.imgUserProfile2.addGestureRecognizer(tap2)
        
        self.imgUserProfile3.isUserInteractionEnabled = true
        self.imgUserProfile3.isMultipleTouchEnabled = true
        self.imgUserProfile3.gestureRecognizers?.removeAll()
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.imgUserProfile3.addGestureRecognizer(tap3)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard let selectedView = sender.view  as? UIImageView else {
            return
        }
        
        switch selectedView.tag {
        case 1:
            self.imgMainUserProfile.image = testImages.test1.value
            break
        case 2:
            self.imgMainUserProfile.image = testImages.test2.value
            break
        case 3:
            self.imgMainUserProfile.image = testImages.test3.value
            break
        default:
            break
        }
        self.mainScrollView.setContentOffset(.zero, animated: true)
    }
}
