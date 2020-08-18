import UIKit

class NavigationControllerSpy: UINavigationController {
    
    var isPushCalled: Bool = false
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        isPushCalled = true
        super.pushViewController(viewController, animated: animated)
    }
    
}
