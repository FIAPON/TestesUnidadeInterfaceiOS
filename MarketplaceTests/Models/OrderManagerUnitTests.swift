import XCTest
@testable import Marketplace

class OrderManagerUnitTests: XCTestCase {

    let sut = OrderManager()
    
    func testProductName() {
        sut.product.name = "MacBook Pro 2020"
        XCTAssertEqual(sut.product.name, "MacBook Pro 2020")
    }
    
    func testAcceptMemoryUpgrade() {
        sut.product.memoryUpgrade = true
        XCTAssertEqual(sut.product.formattedMemoryUpgrade, "SIM (+ R$ 579,99)")
    }
    
    func testNotAcceptMemoryUpgrade() {
        sut.product.memoryUpgrade = false
        XCTAssertEqual(sut.product.formattedMemoryUpgrade, "NÃO (+ R$ 0,00)")
    }
    
    func testAcceptStorageUpgrade() {
        sut.product.storageUpgrade = true
        XCTAssertEqual(sut.product.formattedStorageUpgrade, "SIM (+ R$ 839,99)")
    }
    
    func testNotAcceptStorageUpgrade() {
        sut.product.storageUpgrade = false
        XCTAssertEqual(sut.product.formattedStorageUpgrade, "NÃO (+ R$ 0,00)")
    }
    
    func testTotalValueWithoutUpgrades() {
        sut.product.memoryUpgrade = false
        sut.product.storageUpgrade = false
        XCTAssertEqual(sut.product.formattedPrice, "R$ 14.999,99")
    }
    
    func testTotalValueWithMemoryUpgrade() {
        sut.product.memoryUpgrade = true
        sut.product.storageUpgrade = false
        XCTAssertEqual(sut.product.formattedPrice, "R$ 15.579,98")
    }
    
    func testTotalValueWithStorageUpgrade() {
        sut.product.memoryUpgrade = false
        sut.product.storageUpgrade = true
        XCTAssertEqual(sut.product.formattedPrice, "R$ 15.839,98")
    }
    
    func testTotalValueWithBothUpgrades() {
        sut.product.memoryUpgrade = true
        sut.product.storageUpgrade = true
        XCTAssertEqual(sut.product.formattedPrice, "R$ 16.419,97")
    }
    
    func testFormattedAddress() {
        sut.address.street = "R. Leopoldo Couto de Magalhães Júnior, 700"
        sut.address.neighborhood = "Itaim Bibi"
        sut.address.city = "São Paulo"
        sut.address.zipcode = "01454-901"
        XCTAssertEqual(sut.address.formattedAddress, "R. Leopoldo Couto de Magalhães Júnior, 700 - Itaim Bibi, São Paulo, 01454-901")
    }

}
