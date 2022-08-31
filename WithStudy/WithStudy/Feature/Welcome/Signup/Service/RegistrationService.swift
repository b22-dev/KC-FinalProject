
import Combine
import Foundation
import Firebase
import FirebaseDatabase

enum Gender: String, Identifiable, CaseIterable {
    var id: Self { self }
    case male
    case female
}

struct RegistrationCredentials {
    
    var email: String
    var password: String
    var name: String
    var grade: Int
    var gender: Gender
    
}

protocol RegistrationService {
    func register(with credentials: RegistrationDetails) -> AnyPublisher<Void, Error>
}

enum RegistrationKeys: String {
    case name
    case grade
    case gender
}

final class RegistrationServiceImpl: RegistrationService {
    
    func register(with credentials: RegistrationDetails) -> AnyPublisher<Void, Error> {
        
        Deferred {

            Future { promise in
                
                Auth.auth().createUser(withEmail: credentials.email,
                                       password: credentials.password) { res, error in
                    
                    if let err = error {
                        promise(.failure(err))
                    } else {
                        
                        if let uid = res?.user.uid {
                            
                            let values = [RegistrationKeys.name.rawValue: credentials.name,
                                          RegistrationKeys.grade.rawValue: credentials.grade,
                                          RegistrationKeys.gender.rawValue: credentials.gender.rawValue] as [String : Any]
                            
                            Database
                                .database()
                                .reference()
                                .child("users")
                                .child(uid)
                                .updateChildValues(values) { error, ref in
                                    
                                    if let err = error {
                                        promise(.failure(err))
                                    } else {
                                        promise(.success(()))
                                    }
                                }
                        }
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
