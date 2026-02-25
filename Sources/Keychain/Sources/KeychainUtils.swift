//
//  KeychainUtils.swift
//  Keychain
//
//  Created by user on 2/25/26.
//

import Foundation

public enum KeychainError: Error {
    case unexpectedStatus(OSStatus)
}

// -25303 = errSecInteractionNotAllowed => 암호화된 인증서에 사용하는 'kSecAttrApplicationLabel' 제거
// -25299 = errSecDuplicateItem => 중복 아이템
// -34018 = errSecMissingEntitlement => accessGroup entitlements, capabilities 설정 필요

public final class KeychainUtils {
    
    @MainActor public static let shared = KeychainUtils()
    // Keychain은 Keychain에 저장이 되기 때문에, 앱을 삭제하더라도 정보가 삭제되지 않음
    // Keychain에는 잠금 기능이 존재, 잠긴 상태에서는 아이템 값의 접근, 복호화 등 작업이 불가능함
    
    private let bundleIdentifier = Bundle.main.bundleIdentifier!
    private var accessGroup: String? = nil
    
    public func save(
        accessGroup: String? = nil,
        bundleIdentifier: String? = nil,
        key: String,
        data: Data
    ) throws {
        
        let bundleIdentifier = bundleIdentifier ?? self.bundleIdentifier
        
        let query: NSMutableDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecAttrService: bundleIdentifier,
            kSecValueData: data
        ]
        
        if let accessGroup {
            query[kSecAttrAccessGroup] = accessGroup // Keychain 데이터를 타겟 간의 공유에서 사용
        }
        
        let status = SecItemAdd(query, nil)
        
        switch status {
        case errSecSuccess:
            break
        case errSecDuplicateItem:
            try update(key: key, data: data)
            break
        default:
            throw KeychainError.unexpectedStatus(status)
        }
    }
    
    public func delete(
        accessGroup: String? = nil,
        bundleIdentifier: String? = nil,
        key: String
    ) throws {
        
        let bundleIdentifier = bundleIdentifier ?? self.bundleIdentifier
        
        let query: NSMutableDictionary = [
               kSecClass: kSecClassGenericPassword,
               kSecAttrAccount: key,
               kSecAttrService: bundleIdentifier
           ]
        
        if let accessGroup {
            query[kSecAttrAccessGroup] = accessGroup
        }
        
        let status = SecItemDelete(query)
        if status != errSecSuccess {
            print("Keychain Delete Error: \(status)")
            throw KeychainError.unexpectedStatus(status)
        }
    }
    
    public func read(
        accessGroup: String? = nil,
        bundleIdentifier: String? = nil,
        key: String
    ) throws -> Data? {
        
        let bundleIdentifier = bundleIdentifier ?? self.bundleIdentifier
        
        var item: CFTypeRef?
        
        let query: NSMutableDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecAttrService: bundleIdentifier,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        if let accessGroup {
            query[kSecAttrAccessGroup] = accessGroup
        }
        
        let status = SecItemCopyMatching(query, &item)
        
        if status == errSecItemNotFound {
            return nil
        }

        guard status == errSecSuccess else {
            print("Keychain Read Error: \(status)")
            throw KeychainError.unexpectedStatus(status)
        }
        
        return item as? Data
    }
    
    public func update(
        accessGroup: String? = nil,
        bundleIdentifier: String? = nil,
        key: String,
        data: Data
    ) throws {
        
        let bundleIdentifier = bundleIdentifier ?? self.bundleIdentifier
        
        let query: NSMutableDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecAttrService: bundleIdentifier
        ]

        if let accessGroup {
            query[kSecAttrAccessGroup] = accessGroup
        }
        
        let attributes: NSDictionary = [
            kSecValueData: data
        ]

        let status = SecItemUpdate(
            query,
            attributes
        )

        guard status == errSecSuccess else {
            print("Keychain Update Error: \(status)")
            throw KeychainError.unexpectedStatus(status)
        }
    }
}
