protocol CustomViewProtocol {
    func setupView()
    func setupViewHierarchy()
    func setupConstraints()
    func setupDetails()
}

extension CustomViewProtocol {
    
    func setupView() {
        setupViewHierarchy()
        setupConstraints()
        setupDetails()
    }
    
}
