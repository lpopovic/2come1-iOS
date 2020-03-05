//
//  TabmanBottomVC.swift
//  2come1
//
//  Created by MacBook on 3/2/20.
//  Copyright © 2020 Popovic d.o.o. All rights reserved.
//

import Foundation
import UIKit
import Tabman
import Pageboy
import CoreLocation

class TabmanBottomVC: TabmanViewController {
    
    // service
    let locationManager = CLLocationManager()
    
    // variable
    var nizVC :[UIViewController] = []
    let titleBarItems :[String] = ["Around", "Chat", "Match", "Profile"]
    
    class var sharedInstance: TabmanBottomVC {
        struct Singleton {
            static let instance = TabmanBottomVC()
        }
        return Singleton.instance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTabManBottomTab()
        self.setupLocationManager()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.retriveCurrentLocation), name: NSNotification.Name(CustomNotificationName.getCurrentLocation.value), object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.retriveCurrentLocation()
    }
    func setupArrayVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        self.nizVC.append(storyboard.instantiateViewController(withIdentifier: "NearbyVC"))
        
        self.nizVC.append(storyboard.instantiateViewController(withIdentifier: "VC2"))
        
        self.nizVC.append(storyboard.instantiateViewController(withIdentifier: "VC3"))
        
        self.nizVC.append(storyboard.instantiateViewController(withIdentifier: "VC4"))
        self.reloadData()
    }
    
    func setupTabManBottomTab() {
        self.setupArrayVC()
        self.dataSource = self
        self.view.backgroundColor = BaseColor.black.value
        self.bounces = false
        self.isScrollEnabled = true
        // Create bar
        let bar = TMBar.TabBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.backgroundColor = BaseColor.black.value
        bar.backgroundView.style = .clear
        let tmpTop = UIView()
        tmpTop.frame = CGRect(x: 0, y: 0, width:self.view.frame.size.width, height: 1.5)
        tmpTop.backgroundColor = BaseColor.gold.value
        
        bar.backgroundView.addSubview(tmpTop)
        
        bar.buttons.customize { (button) in
            button.tintColor = BaseColor.white.value
            button.selectedTintColor = BaseColor.gold.value
            
        }
        // Add to view
        addBar(bar, dataSource: self, at: .bottom)
    }
    
    func setupLocationManager() {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    @objc func retriveCurrentLocation(){
        let status = CLLocationManager.authorizationStatus()
        
        if(status == .denied || status == .restricted || !CLLocationManager.locationServicesEnabled()){
            // show alert to user telling them they need to allow location data to use some feature of your app
            self.showAlertForDisabledPermisionLocation()
            return
        }
        
        // if haven't show location permission dialog before, show it to user
        if(status == .notDetermined){
            locationManager.requestWhenInUseAuthorization()
            
            // if you want the app to retrieve location data even in background, use requestAlwaysAuthorization
            // locationManager.requestAlwaysAuthorization()
            return
        }
        
        // at this point the authorization status is authorized
        // request location data once
        locationManager.requestLocation()
        
        // start monitoring location data and get notified whenever there is change in location data / every few seconds, until stopUpdatingLocation() is called
        // locationManager.startUpdatingLocation()
    }
    func showAlertForDisabledPermisionLocation(){
        func openSettings(alert: UIAlertAction!) {
            if let url = URL.init(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        var actions: [UIAlertAction] = []
        
        actions.append(UIAlertAction(title: NSLocalizedString("Open Settings",
                                                              comment: "comment for user"),
                                     style: UIAlertAction.Style.default,
                                     handler: openSettings))
        actions.append(UIAlertAction.createDefaultCancelAction())
        
        UIAlertController.createCustomAlert(self,
                                            NSLocalizedString("Alert",
                                                              comment: "comment for user"),
                                            NSLocalizedString("You need to allow location data to use some feature of app. Please modify your settings.",
                                                              comment:"comment for user" ),
                                            actions)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(CustomNotificationName.getCurrentLocation.value), object: nil)
    }
}
extension TabmanBottomVC: PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return self.nizVC.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return self.nizVC[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    
}

extension TabmanBottomVC: TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = NSLocalizedString(self.titleBarItems[index],comment: "comment for user")
        
        switch index {
        case 0:
            return TMBarItem(title: title, image: TabBarIcon.around.value)
        case 1:
            return TMBarItem(title: title, image: TabBarIcon.chat.value)
        case 2:
            return TMBarItem(title: title, image: TabBarIcon.match.value)
        case 3:
            return TMBarItem(title: title, image: TabBarIcon.profile.value)
        default:
            return TMBarItem(title: title)
        }
        
    }
}

extension TabmanBottomVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        print("location manager authorization status changed")
        
        switch status {
        case .authorizedAlways:
            self.retriveCurrentLocation()
            print("user allow app to get location data when app is active or in background")
        case .authorizedWhenInUse:
            self.retriveCurrentLocation()
            print("user allow app to get location data only when app is active")
        case .denied:
            print("user tap 'disallow' on the permission dialog, cant get location data")
        case .restricted:
            print("parental control setting disallow location data")
        case .notDetermined:
            print("the location permission dialog haven't shown before, user haven't tap allow/disallow")
        default:
            print("unknown")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // .requestLocation will only pass one location to the locations array
        // hence we can access it by taking the first element of the array
        if let location = locations.first {
            print("\(location.coordinate.latitude)")
            print("\(location.coordinate.longitude)")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // might be that user didn't enable location service on the device
        // or there might be no GPS signal inside a building
        
        // might be a good idea to show an alert to user to ask them to walk to a place with GPS signal
        
        UIAlertController.createCustomAlert(self,NSLocalizedString("Alert",
                                                                   comment: "comment for user"), error.localizedDescription, [UIAlertAction.createDefoultOkAction()])
    }
}
