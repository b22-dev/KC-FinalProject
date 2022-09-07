
import Foundation

struct UserSessionDetails {
    let name: String
    let grade: Int
    let email: String
    let gender: Gender
}

extension UserSessionDetails {
    static var new: UserSessionDetails{
        
        UserSessionDetails(name: "", grade: 0, email: "", gender: .male)
    }
}
