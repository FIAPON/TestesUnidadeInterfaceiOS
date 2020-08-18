import XCTest
@testable import Marketplace

class OrderViewControllerUnitTests: XCTestCase {

    let orderManager = OrderManager()
    lazy var sut = OrderViewController(orderManager: orderManager)
    lazy var spy = NavigationControllerSpy(rootViewController: sut)
    
    override func setUp() {
        super.setUp()
        spy.isPushCalled = false
    }
    
    func testDidPressNextButton() {
        sut.productNameTextField.text = "MacBook Pro 2020"
        sut.memoryUpgradeSwitch.isOn = true
        sut.storageUpgradeSwitch.isOn = true
        
        sut.didPressNextButton()
        
        XCTAssertEqual(orderManager.product.name, "MacBook Pro 2020")
        XCTAssertTrue(orderManager.product.memoryUpgrade)
        XCTAssertTrue(orderManager.product.storageUpgrade)
        XCTAssertTrue(spy.isPushCalled)
    }
    
    func testDidPressNextButtonWithoutUpgrades() {
        sut.productNameTextField.text = "MacBook Pro 2020"
        sut.memoryUpgradeSwitch.isOn = false
        sut.storageUpgradeSwitch.isOn = false
        
        sut.didPressNextButton()
        
        XCTAssertEqual(orderManager.product.name, "MacBook Pro 2020")
        XCTAssertFalse(orderManager.product.memoryUpgrade)
        XCTAssertFalse(orderManager.product.storageUpgrade)
        XCTAssertTrue(spy.isPushCalled)
    }
    
    func testDidPressNextButtonWithEmptyTextField() {
        sut.productNameTextField.text = ""
        
        sut.didPressNextButton()
        
        XCTAssertFalse(spy.isPushCalled)
    }

}
