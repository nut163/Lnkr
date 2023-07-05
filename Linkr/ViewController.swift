import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let loginVC = LoginViewController()
        self.present(loginVC, animated: true, completion: nil)
    }

    @IBAction func signupButtonPressed(_ sender: UIButton) {
        let signupVC = SignupViewController()
        self.present(signupVC, animated: true, completion: nil)
    }
}