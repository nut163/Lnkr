import UIKit

class MatchmakingViewController: UIViewController {

    var users: [User] = []
    var currentIndex: Int = 0
    var currentConnection: Connection?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
    }
    
    func loadUsers() {
        // This should be replaced with actual call to backend
        // For simplicity, we are just creating dummy users
        let user1 = User(name: "John Doe", email: "john@example.com", businessDetails: "Software Developer at XYZ")
        let user2 = User(name: "Jane Doe", email: "jane@example.com", businessDetails: "Product Manager at ABC")
        users = [user1, user2]
        updateUI()
    }
    
    func updateUI() {
        guard currentIndex < users.count else {
            // No more users to display
            return
        }
        let user = users[currentIndex]
        nameLabel.text = user.name
        detailsLabel.text = user.businessDetails
        // Load image from URL and set to profileImageView
    }
    
    @IBAction func didSwipeLeft(_ sender: Any) {
        // User is not interested, move to next profile
        currentIndex += 1
        updateUI()
    }
    
    @IBAction func didSwipeRight(_ sender: Any) {
        // User is interested, create a connection
        let user = users[currentIndex]
        currentConnection = Connection(user1: AuthenticationService.shared.currentUser, user2: user)
        ConnectionService.shared.createConnection(currentConnection!)
        currentIndex += 1
        updateUI()
    }
}