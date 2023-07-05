```swift
import Foundation
import Firebase

class ProfileService {
    
    static let shared = ProfileService()
    private init() {}
    
    func updateProfile(user: User, completion: @escaping (Error?) -> Void) {
        let ref = Database.database().reference().child("users").child(user.uid)
        let values = ["name": user.name, "email": user.email, "businessDetails": user.businessDetails]
        
        ref.updateChildValues(values) { (error, ref) in
            completion(error)
        }
    }
    
    func fetchProfile(uid: String, completion: @escaping (User?) -> Void) {
        let ref = Database.database().reference().child("users").child(uid)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let dictionary = snapshot.value as? [String: AnyObject] else {
                completion(nil)
                return
            }
            
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }) { (error) in
            print(error.localizedDescription)
            completion(nil)
        }
    }
}
```