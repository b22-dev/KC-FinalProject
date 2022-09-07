
import Foundation
import Combine

struct RegistrationCredentials {
    var name: String
    var email: String
    var password: String
    var grade: Int
    var gender: Gender
}

extension RegistrationCredentials {
    
    static var new: RegistrationCredentials {
        
        RegistrationCredentials(name: "",
                            email: "",
                            password: "",
                            grade: 0,
                            gender: .male)
    }
}
