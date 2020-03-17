//
//  MessagesVC.swift
//  2come1
//
//  Created by MacBook on 3/17/20.
//

import UIKit

class MessagesVC: BaseVC {
    
    // MARK: - IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var btnSend: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    //MARK: - Variable
    var currentUser: String = "Test"
    var textArray:[String] = []
    var topSafeArea: CGFloat = 0
    var bottomSafeArea: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = self.currentUser
        self.navigationItem.rightBarButtonItems = [self.createNavigationImageBtn()]
        self.setupView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let nvc = self.navigationController {
            nvc.setNavigationBarHidden(false, animated: animated)
            nvc.navigationBar.tintColor = BaseColor.black.value
            nvc.navigationBar.backgroundColor = BaseColor.white.value
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if #available(iOS 11.0, *) {
            topSafeArea = view.safeAreaInsets.top
            bottomSafeArea = view.safeAreaInsets.bottom
        } else {
            topSafeArea = topLayoutGuide.length
            bottomSafeArea = bottomLayoutGuide.length
        }
        
        // safe area values are now available to use
        
    }
    //MARK: - Setup View
    
    func setupView() {
        //TODO: Set yourself as the delegate of the text field here:
        messageTextfield.delegate = self
        messageTextfield.textColor = BaseColor.black.value
        messageTextfield.backgroundColor = BaseColor.white.value
        messageTextfield.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("Enter Your Message",
        comment: "comment for user"), attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        //TODO: Set the tapGesture here:
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        //TODO: Set yourself btnSend here:
        self.btnSend.setImage(customImages.send.value, for: .normal)
        self.btnSend.imageView?.contentMode = .scaleAspectFit
        self.btnSend.tintColor = BaseColor.white.value
        self.btnSend.setTitle(nil, for: .normal)
        
        //TODO: Register your MessageCell.xib file here:
        messageTableView.register(UINib(nibName: "TVCMessage", bundle: nil), forCellReuseIdentifier: "TVCMessage")
        messageTableView.dataSource = self
        messageTableView.delegate = self
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 80.0
        messageTableView.separatorStyle = .none
        messageTableView.indicatorStyle = .white
        messageTableView.backgroundColor = BaseColor.black.value
    }
    func createNavigationImageBtn() -> UIBarButtonItem {
        
        let userImage = UIImage().resizeImage(image: customImages.userAvatar.value, targetSize: CGSize(width: 30, height: 30))
        let userBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        userBtn.setImage(userImage, for: UIControl.State.normal)
        userBtn.imageView?.contentMode = .scaleAspectFill
        userBtn.imageView?.clipsToBounds = true
        userBtn.layer.cornerRadius = 15
        userBtn.clipsToBounds = true
        userBtn.addTarget(self, action: #selector(self.rightBarItemAction), for: UIControl.Event.touchUpInside)
        userBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let userBarBtn = UIBarButtonItem(customView: userBtn)
        
        
        
        
        
        
        return userBarBtn
        
    }
    //MARK: - Action
    //TODO: Declare tableViewTapped here:
    @objc func tableViewTapped() {
        
        messageTextfield.endEditing(true)
    }
    //TODO: Declare keyboardWillShow here:
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.heightConstraint.constant = keyboardHeight - self.bottomSafeArea
            self.view.layoutIfNeeded()
        }
    }
    @objc func rightBarItemAction(){
        UIAlertController.createCustomAlert(self, "Alert", "Press User Icon", [UIAlertAction.createDefoultOkAction()])
    }
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        self.messageTextfield.endEditing(true)
        self.textArray.append(self.messageTextfield.text ?? "")
        self.messageTextfield.text = nil
        self.messageTableView.reloadData()
        self.messageTableView.scrollToBottom()
        
    }
}
//MARK:- TextField Delegate Methods
extension MessagesVC: UITextFieldDelegate{
    
    //TODO: Declare textFieldDidEndEditing here:
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
}

extension MessagesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVCMessage", for: indexPath) as! TVCMessage
            cell.initData(text: self.textArray[indexPath.row], isSender: false, image: testImages.test2.value)
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVCMessageSender", for: indexPath) as! TVCMessage
              cell.initData(text: self.textArray[indexPath.row], isSender: true, image: testImages.test2.value)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
    }
    
    
}
extension MessagesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
