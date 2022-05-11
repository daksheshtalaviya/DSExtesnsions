//
//  Created by Daksh on 27/08/20.
//  Copyright © 2020 The One Technologies. All rights reserved.
//

import UIKit

extension UINib {
    //MARK: -
    
    class func loadNib(bundle: Bundle? = nil) -> Self {
        return UINib(nibName: self.className, bundle: nil) as! Self
    }
    
    class func instantiateFromNib(name: String, bundle: Bundle? = nil) -> Self {
        return self.init(nibName: name, bundle: bundle)
    }

}
