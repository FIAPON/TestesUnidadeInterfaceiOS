import UIKit

class AddressViewController: UIViewController {

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let streetLabel: UILabel = {
        let label = UILabel()
        label.text = "Endereço"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let streetTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ex: Av. Lins de Vasconcelos, 1222"
        textField.accessibilityIdentifier = "address-text-field"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let neighborhoodLabel: UILabel = {
        let label = UILabel()
        label.text = "Bairro"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let neighborhoodTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ex: Aclimação"
        textField.accessibilityIdentifier = "neighborhood-text-field"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Cidade"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ex: São Paulo"
        textField.accessibilityIdentifier = "city-text-field"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let zipcodeLabel: UILabel = {
        let label = UILabel()
        label.text = "CEP"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let zipcodeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ex: 01538-001"
        textField.accessibilityIdentifier = "zipcode-text-field"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Avançar para Pagamento", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.accessibilityIdentifier = "address-next-button"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var orderManager: OrderManager
    
    init(orderManager: OrderManager) {
        self.orderManager = orderManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

}

extension AddressViewController: CustomViewProtocol {
    
    func setupViewHierarchy() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(streetLabel)
        stackView.addArrangedSubview(streetTextField)
        stackView.setCustomSpacing(20, after: streetTextField)
        
        stackView.addArrangedSubview(neighborhoodLabel)
        stackView.addArrangedSubview(neighborhoodTextField)
        stackView.setCustomSpacing(20, after: neighborhoodTextField)
        
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(cityTextField)
        stackView.setCustomSpacing(20, after: cityTextField)
        
        stackView.addArrangedSubview(zipcodeLabel)
        stackView.addArrangedSubview(zipcodeTextField)
        stackView.setCustomSpacing(40, after: zipcodeTextField)
        
        stackView.addArrangedSubview(nextButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
        ])
    }
    
    func setupDetails() {
        title = "Endereço"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        nextButton.addTarget(self, action: #selector(didPressNextButton), for: .touchUpInside)
    }
    
    @objc func didPressNextButton() {
        guard
            let street = streetTextField.text, !street.isEmpty,
            let neighborhood = neighborhoodTextField.text, !neighborhood.isEmpty,
            let city = cityTextField.text, !city.isEmpty,
            let zipcode = zipcodeTextField.text, !zipcode.isEmpty
        else {
            return
        }
        
        orderManager.address.street = street
        orderManager.address.neighborhood = neighborhood
        orderManager.address.city = city
        orderManager.address.zipcode = zipcode
        
        let paymentViewController = PaymentViewController(orderManager: orderManager)
        navigationController?.pushViewController(paymentViewController, animated: true)
    }
    
}
