import Foundation

struct Connection {
    let id: String
    let user1: User
    let user2: User
    let dateCreated: Date
    var isMutual: Bool

    init(id: String, user1: User, user2: User, dateCreated: Date, isMutual: Bool) {
        self.id = id
        self.user1 = user1
        self.user2 = user2
        self.dateCreated = dateCreated
        self.isMutual = isMutual
    }
}