//
//  Created by Daksh on 27/08/20.
//  Copyright © 2020 The One Technologies. All rights reserved.
//

import UIKit
import SideMenuSwift

extension UIViewController {
    //MARK: -
    
    static func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UIViewController? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
        ).instantiate(withOwner: nil, options: nil).first as? UIViewController
    }
    
    var currentNavigationController: UINavigationController? {
        if let vcTab = self.tabBarController {
            return vcTab.navigationController
        } else {
            return self.navigationController
        }
    }
    
    //From Nib
    static func instantiateFromNib(bundle: Bundle? = nil) -> Self {
        return self.init(nibName: self.className, bundle: bundle)
    }
    
    //From Storyboard
    static func instantiateFromStoryboard<T>(name: String, bundle: Bundle? = nil) -> T {
        return UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: self.className) as! T
    }
    
}

extension UIViewController {
    //MARK: - Side Menu
    func openSideMenu() {
        self.sideMenuController?.revealMenu()
    }
    func closeSideMenu() {
        self.sideMenuController?.hideMenu()
    }
}
