class Address {
    
    var street: String = ""
    var neighborhood: String = ""
    var city: String = ""
    var zipcode: String = ""
    
    var formattedAddress: String {
        "\(street) - \(neighborhood), \(city), \(zipcode)"
    }
    
}
