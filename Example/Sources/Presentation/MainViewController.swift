//
//  MainViewController.swift
//  Core
//
//  Created by user on 2/25/26.
//

import UIKit
import Keychain

// UI
extension MainViewController {
    
    func initUI() {
        view.backgroundColor = .white
    }
}

// Logic
extension MainViewController {
    
    func keychainSetting() {
        
        guard let data = "keychainValue".data(using: .utf8, allowLossyConversion: false) else { return }
        do {
            try KeychainUtils.shared.save(key: "key", data: data)
        } catch let error {
            print("Save Error: \(error)")
        }
        
        guard let valueData = try? KeychainUtils.shared.read(key: "key"), let value = String(data: valueData, encoding: .utf8) else { return }
        
        print("value: \(value)")
    }
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        keychainSetting()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
