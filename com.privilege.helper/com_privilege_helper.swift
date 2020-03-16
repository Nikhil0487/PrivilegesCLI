//
//  
//  com.privilege.helper
//
//  Created by sri-7348 on 3/15/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//



// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.

import Foundation
import XPC

class PrivilegeListener: NSObject, NSXPCListenerDelegate, ListenerProtocol {
    var privilegeListener = NSXPCListener()
    var serviceStarted = false
    /// Initialize the listener
    override init() {
        NSLog("Initializing the daemon service")
        privilegeListener = NSXPCListener.init(machServiceName: "com.privilege.helper")
        super.init()
        privilegeListener.delegate = self
        serviceStarted = false
    }
    /// Resume the listener
    func startService() throws {
        guard serviceStarted == false else {
            NSLog("Service start failed")
            throw ListenerError.serviceAlreadyResumed
        }
        NSLog("Resuming the service")
        serviceStarted = true
        privilegeListener.resume()
    }
    /// Suspend the listener
    func stopService() throws {
        guard serviceStarted == true else {
            NSLog("Service stop failed")
            throw ListenerError.serviceAlreadySuspended
        }
        serviceStarted = false
        privilegeListener.suspend()
    }
    func changePrivilege(toAdmin: Bool) {
        NSLog("Test me")
    }
    func upperCaseString(_ string: String, withReply reply: @escaping (String) -> Void) {
        NSLog("Request received for upper casing ")
        let response = string.uppercased()
        reply(response)
    }
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        NSLog("Request to listner recieved")
        newConnection.exportedInterface = NSXPCInterface.init(with: ListenerProtocol.self)
        newConnection.exportedObject = self
        newConnection.resume()
        return true
    }
}
/// Extending the listener
extension PrivilegeListener {
    enum ListenerError : Error {
        case serviceAlreadyResumed
        case serviceAlreadySuspended
    }
}
