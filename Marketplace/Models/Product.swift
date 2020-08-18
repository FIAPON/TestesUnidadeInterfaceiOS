import Foundation

class Product {
    
    var name: String = ""
    var memoryUpgrade: Bool = false
    var storageUpgrade: Bool = false
    
    private var memoryUpgradeValue: Double { 579.99 }
    var formattedMemoryUpgrade: String {
        if memoryUpgrade {
            return "SIM (+ \(formatter.string(for: memoryUpgradeValue) ?? ""))"
        } else {
            return "NÃO (+ \(formatter.string(for: 0.0) ?? ""))"
        }
    }
    
    private var storageUpgradeValue: Double { 839.99 }
    var formattedStorageUpgrade: String {
        if storageUpgrade {
            return "SIM (+ \(formatter.string(for: storageUpgradeValue) ?? ""))"
        } else {
            return "NÃO (+ \(formatter.string(for: 0.0) ?? ""))"
        }
    }
    
    private var price: Double {
        var total = 14999.99
        
        if memoryUpgrade {
            total += memoryUpgradeValue
        }
        
        if storageUpgrade {
            total += storageUpgradeValue
        }
        
        return total
    }
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        return formatter.string(for: price) ?? ""
    }
    
    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        return formatter
    }
    
}
