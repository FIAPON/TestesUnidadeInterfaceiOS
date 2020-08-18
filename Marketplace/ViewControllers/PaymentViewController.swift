import UIKit

class PaymentViewController: UIViewController {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Product Details
    
    let productTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do produto"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memoryUpgradeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Adicional de memória RAM"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memoryUpgradeValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let storageUpgradeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Adicional de armazenamento"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let storageUpgradeValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Price
    
    let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Valor total"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Address
    
    let addressTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Endereço de entrega"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Payment Button
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirmar Pagamento", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.accessibilityIdentifier = "payment-next-button"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var orderManager: OrderManager
    
    init(orderManager: OrderManager) {
        self.orderManager = orderManager
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

}

extension PaymentViewController: CustomViewProtocol {
    
    func setupViewHierarchy() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(productTitleLabel)
        stackView.addArrangedSubview(productNameLabel)
        stackView.setCustomSpacing(20, after: productNameLabel)
        
        stackView.addArrangedSubview(memoryUpgradeTitleLabel)
        stackView.addArrangedSubview(memoryUpgradeValueLabel)
        stackView.setCustomSpacing(20, after: memoryUpgradeValueLabel)
        
        stackView.addArrangedSubview(storageUpgradeTitleLabel)
        stackView.addArrangedSubview(storageUpgradeValueLabel)
        stackView.setCustomSpacing(40, after: storageUpgradeValueLabel)
        
        stackView.addArrangedSubview(addressTitleLabel)
        stackView.addArrangedSubview(addressValueLabel)
        stackView.setCustomSpacing(40, after: addressValueLabel)
        
        stackView.addArrangedSubview(priceTitleLabel)
        stackView.addArrangedSubview(priceValueLabel)
        stackView.setCustomSpacing(40, after: priceValueLabel)
        
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
        title = "Pagamento"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        productNameLabel.text = orderManager.product.name
        memoryUpgradeValueLabel.text = orderManager.product.formattedMemoryUpgrade
        storageUpgradeValueLabel.text = orderManager.product.formattedStorageUpgrade
        
        addressValueLabel.text = orderManager.address.formattedAddress
        priceValueLabel.text = orderManager.product.formattedPrice
        
        nextButton.addTarget(self, action: #selector(didPressNextButton), for: .touchUpInside)
    }
    
    @objc func didPressNextButton() {
        let alertController = UIAlertController(
            title: "Sucesso",
            message: "O pagamento foi confirmado.\n\nO seu novo computador será entregue nos próximos 14 dias úteis.",
            preferredStyle: .alert
        )
        
        alertController.addAction(
            UIAlertAction(
                title: "Retornar para o Início",
                style: .default,
                handler: { _ in
                    self.navigationController?.popToRootViewController(animated: true)
                }
            )
        )
        
        present(alertController, animated: true)
    }
    
}
