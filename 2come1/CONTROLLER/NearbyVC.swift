//
//  NearbyVC.swift
//  2come1
//
//  Created by MacBook on 3/3/20.
//

import UIKit

class NearbyVC: BaseVC {
    //MARK: IBOutlet
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var viewHeader: BaseHeader!
    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            self.tableView.backgroundView?.backgroundColor = .clear
            self.tableView.backgroundColor = .clear
            self.tableView.separatorStyle = .none
            self.tableView.indicatorStyle = .white
            // import cell
            self.tableView.register(UINib(nibName: "TVCNearbyUsers", bundle: nil), forCellReuseIdentifier: "TVCNearbyUsers")
        }
    }
    
    //MARK: Variable
    var refresher : UIRefreshControl!
    let arrayUsers: [String] = ["Lazar", "Srx", "Sadas fgfhg", "Sarma", "Stefan", "IDJ", "LSDA",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewHeader.setup(NSLocalizedString("Nearby",
                                                comment: "comment for user"), BaseColor.gold.value)
        self.viewBackground.backgroundColor = .darkGray
        self.imageViewBackground.image = customImages.jin.value.withTintColor(.black)
        
        self.setupForTableView()
    }
    
    func setupForTableView() {
        
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
    
    @objc func refreshAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.refresher.endRefreshing()
        }
    }
    
}

extension NearbyVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.arrayUsers.count % 3 == 0 {
            return self.arrayUsers.count / 3
        }else {
            return self.arrayUsers.count / 3 + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCNearbyUsers", for: indexPath) as! TVCNearbyUsers
        cell.delegate = self
        let startIndex: Int = indexPath.row * 3
        let endIndex: Int = indexPath.row * 3 + 3 > self.arrayUsers.count ? self.arrayUsers.count : indexPath.row * 3 + 3
        let array = Array(self.arrayUsers[startIndex..<endIndex])
        cell.setup(array)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    
}

extension NearbyVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension NearbyVC: TVCNearbyUsersDelegate {
    func onPressNearbyUser(_ user: String) {
        if !self.refresher.isRefreshing {
            print("Press:\(user)")
        }
    }
    
    
}
