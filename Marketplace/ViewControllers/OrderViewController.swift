import UIKit

class OrderViewController: UIViewController {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let productTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Digite o nome do produto"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.accessibilityIdentifier = "product-name-label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let productNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ex: MacBook Pro 2020..."
        textField.accessibilityIdentifier = "product-name-input-field"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let memoryUpgradeLabel: UILabel = {
        let label = UILabel()
        label.text = "Adicional de memória RAM (16GB)"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memoryUpgradeSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = false
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    let storageUpgradeLabel: UILabel = {
        let label = UILabel()
        label.text = "Adicional de armazenamento (1TB)"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let storageUpgradeSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = true
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Avançar para Endereço", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.accessibilityIdentifier = "order-next-button"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var orderManager: OrderManager
    
    init(orderManager: OrderManager = OrderManager()) {
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

extension OrderViewController: CustomViewProtocol {
    
    func setupViewHierarchy() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(productTitleLabel)
        stackView.addArrangedSubview(productNameTextField)
        stackView.setCustomSpacing(20, after: productNameTextField)
        
        stackView.addArrangedSubview(memoryUpgradeLabel)
        stackView.addArrangedSubview(memoryUpgradeSwitch)
        stackView.setCustomSpacing(20, after: memoryUpgradeSwitch)
        
        stackView.addArrangedSubview(storageUpgradeLabel)
        stackView.addArrangedSubview(storageUpgradeSwitch)
        stackView.setCustomSpacing(40, after: storageUpgradeSwitch)
        
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
        title = "Pedido"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        nextButton.addTarget(self, action: #selector(didPressNextButton), for: .touchUpInside)
    }
    
    @objc func didPressNextButton() {
        guard let productName = productNameTextField.text, !productName.isEmpty else { return }
        
        orderManager.product.name = productName
        orderManager.product.memoryUpgrade = memoryUpgradeSwitch.isOn
        orderManager.product.storageUpgrade = storageUpgradeSwitch.isOn
        
        let addressViewController = AddressViewController(orderManager: orderManager)
        navigationController?.pushViewController(addressViewController, animated: true)
    }
    
}
