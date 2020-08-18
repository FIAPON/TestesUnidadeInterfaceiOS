import XCTest
@testable import Marketplace

class PaymentViewControllerUnitTests: XCTestCase {
    
    func testValidTexts() {
        let orderManager = OrderManager()
        orderManager.product.name = "iMac 2020"
        orderManager.product.memoryUpgrade = true
        orderManager.product.storageUpgrade = false
        
        orderManager.address.street = "Endereço"
        orderManager.address.neighborhood = "Bairro"
        orderManager.address.city = "Cidade"
        orderManager.address.zipcode = "CEP"
        
        let sut = PaymentViewController(orderManager: orderManager)
        
        XCTAssertFalse(sut.productNameLabel.text!.isEmpty)
        XCTAssertFalse(sut.memoryUpgradeValueLabel.text!.isEmpty)
        XCTAssertFalse(sut.storageUpgradeValueLabel.text!.isEmpty)
        XCTAssertFalse(sut.addressValueLabel.text!.isEmpty)
        XCTAssertFalse(sut.priceValueLabel.text!.isEmpty)
    }

}
