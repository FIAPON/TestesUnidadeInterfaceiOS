import XCTest
@testable import Marketplace

class AddressViewControllerUnitTests: XCTestCase {

    let orderManager = OrderManager()
    lazy var sut = AddressViewController(orderManager: orderManager)
    lazy var spy = NavigationControllerSpy(rootViewController: sut)
    
    override func setUp() {
        super.setUp()
        spy.isPushCalled = false
    }
    
    func testDidFillAddress() {
        sut.streetTextField.text = "Endereço"
        sut.neighborhoodTextField.text = "Bairro"
        sut.cityTextField.text = "Cidade"
        sut.zipcodeTextField.text = "CEP"
        
        sut.didPressNextButton()
        
        XCTAssertTrue(spy.isPushCalled)
    }
    
    func testIncompleteAddress() {
        sut.streetTextField.text = ""
        sut.neighborhoodTextField.text = "Bairro"
        sut.cityTextField.text = ""
        sut.zipcodeTextField.text = "CEP"
        
        sut.didPressNextButton()
        
        XCTAssertFalse(spy.isPushCalled)
    }

}
