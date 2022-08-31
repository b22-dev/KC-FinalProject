
import Foundation
import Combine

struct RegistrationDetails {
    var name: String
    var email: String
    var password: String
    var grade: Int
    var gender: Gender
}

extension RegistrationDetails {
    
    static var new: RegistrationDetails {
        
        RegistrationDetails(name: "",
                            email: "",
                            password: "",
                            grade: 0,
                            gender: .male)
    }
}
