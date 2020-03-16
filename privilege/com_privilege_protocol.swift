//
//  com_privilege_protocol.swift
//  com.privilege.helper
//
//  Created by sri-7348 on 3/15/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import Foundation

@objc protocol ListenerProtocol {
    func changePrivilege(toAdmin: Bool)
    func upperCaseString(_ string: String, withReply reply: @escaping (String) -> Void)
}
