//
//  MatchVC.swift
//  2come1
//
//  Created by MacBook on 3/5/20.
//

import UIKit

class MatchVC: BaseVC {
    
    //MARK: IBOutlet
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var segmentedSort:UISegmentedControl!
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            self.tableView.backgroundView?.backgroundColor = .clear
            self.tableView.backgroundColor = .clear
            self.tableView.separatorStyle = .singleLine
            self.tableView.separatorColor = .lightGray
            self.tableView.indicatorStyle = .black
            // import cell
            self.tableView.register(UINib(nibName: "TVCMatchUser", bundle: nil), forCellReuseIdentifier: "TVCMatchUser")
        }
    }
    
    //MARK: Variable
    var refresher : UIRefreshControl!
    let arrayUsers: [String] = ["Lazar", "Srx", "Sadas fgfhg", "Sarma", "Stefan", "IDJ", "LSDA",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.viewBackground.backgroundColor = BaseColor.white.value
        self.setupUISegmented()
        self.setupUITableView()
        
    }
    
    func setupUITableView() {
        
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
    
    func setupUISegmented() -> Void {
        self.segmentedSort.removeAllSegments()
        self.segmentedSort.insertSegment(withTitle:  NSLocalizedString("Requests",comment: "comment for user").uppercased(), at: 0, animated: false)
        self.segmentedSort.insertSegment(withTitle:  NSLocalizedString("My Matches",comment: "comment for user").uppercased(), at: 1, animated: false)
        self.segmentedSort.selectedSegmentIndex = 0
        let font_bigger = UIFont.systemFont(ofSize: 17, weight: .bold)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                   NSAttributedString.Key.font : font_bigger]
        segmentedSort.setTitleTextAttributes(titleTextAttributes, for:.normal)
        
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                    NSAttributedString.Key.font : font_bigger]
        segmentedSort.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        if #available(iOS 13.0, *) {
            segmentedSort.backgroundColor = UIColor.clear
            segmentedSort.selectedSegmentTintColor = UIColor.black
            
        } else {
            // Fallback on earlier versions
            segmentedSort.backgroundColor = UIColor.clear
            segmentedSort.tintColor = UIColor.black
            
        }
        
        segmentedSort.addTarget(self, action: #selector(self.segmentedSortAction(_:)), for: .valueChanged)
    }
    
    @objc func segmentedSortAction (_ sender: UISegmentedControl) {
        print("Press:\(sender.selectedSegmentIndex)")
    }
    
}
extension MatchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCMatchUser", for: indexPath) as! TVCMatchUser
        cell.setupUIData(self.arrayUsers[indexPath.row])
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    
}

extension MatchVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !self.refresher.isRefreshing && self.arrayUsers.count > indexPath.row {
            let currentUser = self.arrayUsers[indexPath.row]
            
            guard let nvc = self.navigationController as? NavigationVC else {
                return
            }
            if self.segmentedSort.selectedSegmentIndex == 0 {
                // my requestes
                nvc.showRequestedMatchUserVCScreen(user: currentUser)
            } else if self.segmentedSort.selectedSegmentIndex == 1 {
                // my matches
                nvc.showMatchUserVCScreen(user: currentUser)
            }
            
        }
    }
}
