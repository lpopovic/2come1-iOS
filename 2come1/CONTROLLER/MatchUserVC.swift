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
        self.lblDescription.text = self.text + self.text
        self.mainScrollView.bounces = false
        self.mainScrollView.showsHorizontalScrollIndicator = false
        self.mainScrollView.isDirectionalLockEnabled = true
        
        
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
        var contentRect = CGRect.zero
        
        for view in mainScrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        mainScrollView.contentSize = contentRect.size
    }
    
    func initViewSetup() {
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
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
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
    
}
