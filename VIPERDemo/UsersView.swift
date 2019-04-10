import UIKit

class UsersView: UIViewController {
        // MARK: - VIPER Stack
        weak var presenter: UsersViewToPresenterInterface!

        // MARK: - Instance Variables
        var userData = [UserEntity]()
        // MARK: - Outlets
        @IBOutlet weak var usersTableView: UITableView!

        // MARK: - Operational
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.isHidden = true
        setupTableView()
        presenter.viewDidLoad()
    }

}

// MARK: - Navigation Interface
extension UsersView: UsersNavigationInterface { }

// MARK: - Presenter to View Interface
extension UsersView: UsersPresenterToViewInterface {
    func getUsers(usersData: [UserEntity]) {
        userData = usersData
        usersTableView.isHidden = false
        usersTableView.reloadData()
    }

}

extension UsersView: UITableViewDataSource {
    func setupTableView() {
        usersTableView.dataSource = self
        usersTableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            UsersConstants.userTableViewCell, for: indexPath) as? UserTableViewCell

        let userInfo = userData[indexPath.row]
        cell?.nameLabel.text = userInfo.name
        cell?.emailLabel.text = userInfo.email
        cell?.addressLabel.text = userInfo.address.street + "," + userInfo.address.suite
        return cell!
    }
}

extension UsersView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUserInfo = userData[indexPath.row]
                presenter.userListSelected(selectedUser: selectedUserInfo)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
