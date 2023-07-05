```swift
import UIKit
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        setupGoogleButtons()
    }

    fileprivate func setupGoogleButtons() {
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16, y: 116, width: view.frame.width - 32, height: 50)
        view.addSubview(googleButton)
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Failed to log into Google: ", error)
            return
        }
        
        print("Successfully logged into Google", user)
        
        AuthenticationService.instance.googleLogin(user: user) { (success) in
            if success {
                self.performSegue(withIdentifier: "toHome", sender: self)
            } else {
                print("Problem with Google authentication.")
            }
        }
    }
}
```