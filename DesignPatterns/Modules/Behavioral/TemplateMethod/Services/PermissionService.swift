//
//  PermissionService.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/10/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

typealias AuthorizationCompletion = (status: Bool, message: String)

class PermissionService: NSObject {
    private var message: String = ""
    
    // MARK: Template method
    
    func authorize(_ completion: @escaping (AuthorizationCompletion) -> Void) {
        let status = checkStatus()
        
        guard !status else {
            complete(with: status, completion)
            
            return
        }

        requestAuthorization { [weak self] status in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.complete(with: status, completion)
        }
    }
    
    // MARK: Steps that used in template method
    
    func checkStatus() -> Bool {
        return false
    }
    
    func requestAuthorization(_ completion: @escaping (Bool) -> Void) {
        completion(false)
    }
    
    func formMessage(with status: Bool) {
        let messagePrefix = status ? "Label.HaveAccess".localized() : "Label.HaveNotAccess".localized()
        let messageSuffix = self.nameOfClass.components(separatedBy: PermissionService.nameOfClass).first!
        message = messagePrefix.localizedFormat(messageSuffix)
    }
    
    private func complete(with status: Bool, _ completion: @escaping (AuthorizationCompletion) -> Void) {
        formMessage(with: status)
        
        let result = (status: status, message: message)
        completion(result)
    }
}
