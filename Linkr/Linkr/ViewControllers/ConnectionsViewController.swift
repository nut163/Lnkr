import UIKit

class ConnectionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var connections: [Connection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadConnections()
    }

    func loadConnections() {
        ConnectionService.shared.getConnections { (connections) in
            self.connections = connections
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return connections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionCell", for: indexPath)
        let connection = connections[indexPath.row]
        cell.textLabel?.text = connection.user.name
        cell.detailTextLabel?.text = connection.user.businessDetails
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let connection = connections[indexPath.row]
        let profileVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        profileVC.user = connection.user
        navigationController?.pushViewController(profileVC, animated: true)
    }
}