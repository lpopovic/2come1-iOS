//
//  MatchUserVC.swift
//  2come1
//
//  Created by MacBook on 3/11/20.
//

import UIKit

class MatchUserVC: BaseVC {
    
    //MARK: Outlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAboutMe: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnMessage: UIButton!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var imgUserImage1: UIImageView!
    @IBOutlet weak var imgUserImage2: UIImageView!
    @IBOutlet weak var imgUserImage3: UIImageView!
    @IBOutlet weak var imgViewContainer: UIView!
    @IBOutlet weak var separatorTopView: UIView!
    @IBOutlet weak var separatorBottomView: UIView!
    //MARK: Variable
    var currentUser: String?
    let text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Enim neque volutpat ac tincidunt. Ullamcorper sit amet risus nullam. Purus semper eget duis at tellus at. Cursus mattis molestie a iaculis at. Scelerisque felis imperdiet proin fermentum leo. Vitae nunc sed velit dignissim sodales ut eu sem. Adipiscing vitae proin sagittis nisl rhoncus. Nibh tortor id aliquet lectus proin nibh nisl. Eget sit amet tellus cras adipiscing enim eu turpis."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItems = [self.createNavigationMoreBtn()]
        
        self.initViewSetup()
        
        self.lblTitle.text = "\(self.currentUser ?? ""), 20"
        self.lblDescription.text = self.text
      
        self.initActionTapImageView()
        
        self.imgUserImage1.image = testImages.test1.value
        self.imgUserImage2.image = testImages.test2.value
        self.imgUserImage3.image = testImages.test3.value
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
        
        self.initImageViewSetup()
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
        
        self.lblAboutMe.textColor = BaseColor.black.value
        self.lblAboutMe.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        self.lblAboutMe.text = NSLocalizedString("About me:",
                                                 comment: "comment for user")
        
        self.btnMessage.tintColor = BaseColor.black.value
        self.btnMessage.setTitle("", for: .normal)
        self.btnMessage.setImage(customImages.message.value, for: .normal)
        
        self.separatorTopView.backgroundColor = BaseColor.gold.value
        self.separatorBottomView.backgroundColor = BaseColor.gold.value
        
        self.imgUserImage1.isHidden = true
        self.imgUserImage2.isHidden = true
        self.imgUserImage3.isHidden = true
        
        self.imgViewContainer.backgroundColor = .clear
    }
    func initImageViewSetup() {
        
        self.imgUserImage1.isHidden = false
        self.imgUserImage2.isHidden = false
        self.imgUserImage3.isHidden = false
        
        self.imgUserImage1.layer.borderColor = BaseColor.black.value.cgColor
        self.imgUserImage1.layer.borderWidth = 2
        self.imgUserImage1.layer.cornerRadius = self.imgUserImage1.frame.size.width / 2
        self.imgUserImage1.clipsToBounds = true
        self.imgUserImage1.backgroundColor = .clear
        self.imgUserImage1.tag = 1
        self.imgUserImage1.contentMode = .scaleAspectFill
        
        self.imgUserImage2.layer.borderColor = BaseColor.black.value.cgColor
        self.imgUserImage2.layer.borderWidth = 2
        self.imgUserImage2.layer.cornerRadius = self.imgUserImage2.frame.size.width / 2
        self.imgUserImage2.clipsToBounds = true
        self.imgUserImage2.backgroundColor = .clear
        self.imgUserImage2.tag = 2
        self.imgUserImage2.contentMode = .scaleAspectFill
        
        self.imgUserImage3.layer.borderColor = BaseColor.black.value.cgColor
        self.imgUserImage3.layer.borderWidth = 2
        self.imgUserImage3.layer.cornerRadius = self.imgUserImage3.frame.size.width / 2
        self.imgUserImage3.clipsToBounds = true
        self.imgUserImage3.backgroundColor = .clear
        self.imgUserImage3.tag = 3
        self.imgUserImage3.contentMode = .scaleAspectFill
    }
    
    func initActionTapImageView(){
        
        self.imgUserImage1.isUserInteractionEnabled = true
        self.imgUserImage1.isMultipleTouchEnabled = true
        self.imgUserImage1.gestureRecognizers?.removeAll()
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.imgUserImage1.addGestureRecognizer(tap1)
        
        self.imgUserImage2.isUserInteractionEnabled = true
        self.imgUserImage2.isMultipleTouchEnabled = true
        self.imgUserImage2.gestureRecognizers?.removeAll()
         let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.imgUserImage2.addGestureRecognizer(tap2)
        
        self.imgUserImage3.isUserInteractionEnabled = true
        self.imgUserImage3.isMultipleTouchEnabled = true
        self.imgUserImage3.gestureRecognizers?.removeAll()
         let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.imgUserImage3.addGestureRecognizer(tap3)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard let selectedView = sender.view else {
            return
        }
        let vc = CCDetailViewController()
        switch selectedView.tag {
        case 1:
        
            vc.cc_setZoomTransition(originalView: self.imgUserImage1)
            vc.imageView.image = testImages.test1.value
            break
        case 2:
             vc.cc_setZoomTransition(originalView: self.imgUserImage2)
             vc.imageView.image = testImages.test2.value
            break
        case 3:
             vc.cc_setZoomTransition(originalView: self.imgUserImage3)
             vc.imageView.image = testImages.test3.value
            break
        default:
            break
        }
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func createNavigationMoreBtn() -> UIBarButtonItem {
        
        let moreImage = NavigationBarIcon.more.value
        let moreBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        moreBtn.setImage(moreImage, for: UIControl.State.normal)
        moreBtn.addTarget(self, action: #selector(self.moreBarBtnPress), for: UIControl.Event.touchUpInside)
        moreBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let moreBarBtn = UIBarButtonItem(customView: moreBtn)
        
        return moreBarBtn
        
    }
    @objc func moreBarBtnPress(){
        
        let alert = UIAlertController(title: "2come1", message: NSLocalizedString( "Please select an option",
                                                                                   comment: "comment for user"), preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title:     NSLocalizedString( "Report",
                                                                    comment: "comment for user"), style: .default , handler:{ (UIAlertAction)in
                                                                        print("User click Approve button")
        }))
        
        alert.addAction(UIAlertAction(title:     NSLocalizedString( "Block",
                                                                    comment: "comment for user"), style: .default , handler:{ (UIAlertAction)in
                                                                        print("User click Edit button")
        }))
        
        alert.addAction(UIAlertAction.createDefaultCancelAction())
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    @IBAction func btnSendMessageAction(_ sender: UIButton) {
        UIAlertController.createCustomAlert(self, "Action", "Show SendVC", [UIAlertAction.createDefoultOkAction()])
    }
    
}
