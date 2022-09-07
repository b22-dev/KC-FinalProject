
import Foundation
import Network

class DataManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue.global(qos: .background)
    @Published var isConnected = true
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
           
            if path.status == .satisfied {
                print("Yay! We have internet!")
            
                self.isConnected = true
            } else {
                print("NOOO! no internet!")
                self.isConnected = false
            }
            }
        }
        monitor.start(queue: queue)
    }
}
