```swift
import UIKit
import GoogleSignIn

class SignupViewController: UIViewController, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().presentingViewController = self
    }

    @IBAction func googleSignupButtonTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            guard let authentication = user.authentication else { return }
            let idToken = authentication.idToken
            let email = user.profile.email
            let name = user.profile.name
            AuthenticationService.shared.googleSignup(idToken: idToken, email: email, name: name) { (result) in
                switch result {
                case .success(let user):
                    self.performSegue(withIdentifier: "SignupToProfileSettings", sender: user)
                case .failure(let error):
                    print("Signup failed with error: \(error)")
                }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignupToProfileSettings",
           let profileSettingsVC = segue.destination as? ProfileSettingsViewController,
           let user = sender as? User {
            profileSettingsVC.user = user
        }
    }
}
```