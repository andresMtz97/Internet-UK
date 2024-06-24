//
//  InternetMonitor.swift
//  Internet-UK
//
//  Created by DISMOV on 08/06/24.
//

import Foundation
import Network

class InternetMonitor: ObservableObject {
    private let networkMonitor = NWPathMonitor()
    private let monitorQueue = DispatchQueue(label: "Monitor")
    @Published var isConnected = false
    @Published var connType = "no"
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            self.connType = path.usesInterfaceType(.wifi) ? "Wifi" : "Datos celulares"
        }
        
        networkMonitor.start(queue: monitorQueue)
    }
}
