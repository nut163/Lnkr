import Foundation

struct User {
    let id: String
    let name: String
    let email: String
    let businessDetails: String
    var connections: [Connection]
    
    init(id: String, name: String, email: String, businessDetails: String, connections: [Connection]) {
        self.id = id
        self.name = name
        self.email = email
        self.businessDetails = businessDetails
        self.connections = connections
    }
}