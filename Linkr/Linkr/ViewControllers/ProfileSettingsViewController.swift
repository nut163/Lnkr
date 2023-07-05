import UIKit

class ProfileSettingsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var businessDetailsTextView: UITextView!
    
    let profileService = ProfileService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfileData()
    }
    
    func loadProfileData() {
        guard let user = profileService.getCurrentUser() else { return }
        nameTextField.text = user.name
        emailTextField.text = user.email
        businessDetailsTextView.text = user.businessDetails
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
              let email = emailTextField.text,
              let businessDetails = businessDetailsTextView.text else { return }
        
        let user = User(name: name, email: email, businessDetails: businessDetails)
        profileService.updateUser(user)
    }
}