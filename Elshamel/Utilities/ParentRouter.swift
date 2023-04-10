//
//  ParentRouter.swift
//  Akoon
//
//  Created by M.Ibrahim on 7/17/20.
//  Copyright © 2020 M.Ibrahim. All rights reserved.
//

import UIKit

protocol ParentRouterProtocol {
    
    func createModule() -> UIViewController?
}

class ParentRouter: ParentRouterProtocol {
    
    func createModule() -> UIViewController? {
        return nil
    }
    
}


//protocol ParentRouterProtocol {
//    func createModule<T: UIViewController>() -> T?
//}
//
//class ParentRouter: ParentRouterProtocol {
//    func createModule<T: UIViewController>() -> T? {
//        return nil
//    }
//}
