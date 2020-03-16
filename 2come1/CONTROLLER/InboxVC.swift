//
//  InboxVC.swift
//  2come1
//
//  Created by MacBook on 3/16/20.
//

import UIKit

class InboxVC: BaseVC {
    
    //MARK: IBOutlet
    @IBOutlet weak var viewHeader: BaseHeader!
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            self.tableView.separatorStyle = .none
            self.tableView.indicatorStyle = .white
            self.tableView.backgroundColor = BaseColor.white.value
            // import cell
            self.tableView.register(UINib(nibName: "TVCInboxUser", bundle: nil), forCellReuseIdentifier: "TVCInboxUser")
        }
    }
    
    //MARK: Variable
    var refresher : UIRefreshControl!
    let arrayUsers: [String] = ["Lazar", "Srx", "Sadas fgfhg", "Sarma", "Stefan", "IDJ", "LSDA","Lazar", "Srx", "Sadas fgfhg", "Sarma", "Stefan", "IDJ", "LSDA",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initViewSetup()
    }
    
    func initViewSetup() -> Void {
        self.viewHeader.setup(NSLocalizedString("Inbox",
                                                comment: "comment for user"), BaseColor.gold.value)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 80
        // setup for refresh
        refresher = UIRefreshControl()
        self.tableView.addSubview(refresher)
        
        refresher.attributedTitle = NSAttributedString(string:
            NSLocalizedString("Pull to refresh",comment: "comment for user"),
                                                       attributes: [NSAttributedString.Key.foregroundColor : BaseColor.gold.value])
        refresher.tintColor = BaseColor.gold.value
        refresher.addTarget(self, action: #selector(self.refreshAction), for: .valueChanged)
    }
    
    //MARK: Action
    
    @objc func refreshAction(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                   self.refresher.endRefreshing()
               }
    }
    
}

extension InboxVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCInboxUser", for: indexPath) as! TVCInboxUser
       
        cell.setupData(user: self.arrayUsers[indexPath.row])
        
        if indexPath.row % 2 == 0 {
            cell.hideLblNumberOfNewMessageValue(true)
        }
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
}
extension InboxVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !self.refresher.isRefreshing && self.arrayUsers.count > indexPath.row {
            let currentUser = self.arrayUsers[indexPath.row]
            
            guard let nvc = self.navigationController as? NavigationVC else {
                return
            }
            print(currentUser)
            
        }
    }
}
