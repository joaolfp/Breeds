import SwiftKeychainWrapper

final class Keychain {
    static func setValue(value: String, forKey: String) -> Bool {
        let save: Bool = KeychainWrapper.standard.set(value, forKey: forKey)
        return save
    }
    
    static func standardValue(forKey: String) -> String? {
        let access: String? = KeychainWrapper.standard.string(forKey: forKey)
        return access
    }
    
    func removeValue(forKey: String) {
        KeychainWrapper.standard.removeObject(forKey: forKey)
    }
}
