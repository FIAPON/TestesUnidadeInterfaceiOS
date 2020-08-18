import XCTest

class OrderFlowUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        addUIInterruptionMonitor(withDescription: "System Dialog") { alert in
            let returnToHomeButton = alert.buttons["Retornar para o Início"]
            returnToHomeButton.tap()
            
            return true
        }
    }
    
    func testOrderSuccessFlow() {
        let app = XCUIApplication()
        app.launch()
        
        fillProductName(app: app)
        fillDeliveryAddress(app: app)
        confirmPayment(app: app)
    }
    
    func fillProductName(app: XCUIApplication) {
        let productNameTextField = app.textFields["product-name-input-field"]
        let nextButton = app.buttons["order-next-button"]
        
        productNameTextField.tap()
        productNameTextField.typeText("iMac 27' 5K 2020")
        
        nextButton.tap()
    }
    
    func fillDeliveryAddress(app: XCUIApplication) {
        let addressTextField = app.textFields["address-text-field"]
        let neighborhoodTextField = app.textFields["neighborhood-text-field"]
        let cityTextField = app.textFields["city-text-field"]
        let zipcodeTextField = app.textFields["zipcode-text-field"]
        let nextButton = app.buttons["address-next-button"]
        
        addressTextField.tap()
        addressTextField.typeText("R. Leopoldo Couto de Magalhães Júnior, 700")
        
        neighborhoodTextField.tap()
        neighborhoodTextField.typeText("Itaim Bibi")
        
        cityTextField.tap()
        cityTextField.typeText("São Paulo")
        
        zipcodeTextField.tap()
        zipcodeTextField.typeText("01454-901")
        
        nextButton.tap()
    }
    
    func confirmPayment(app: XCUIApplication) {
        let nextButton = app.buttons["payment-next-button"]
        nextButton.tap()
        
        app.tap()
        
        let productNameLabel = app.staticTexts["product-name-label"]
        XCTAssertTrue(productNameLabel.waitForExistence(timeout: 5))
    }

}
