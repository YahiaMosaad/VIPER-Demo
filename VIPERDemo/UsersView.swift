import UIKit

class UsersView: UIViewController {
        // MARK: - VIPER Stack
        weak var presenter: UsersViewToPresenterInterface!

        // MARK: - Instance Variables

        // MARK: - Outlets

        // MARK: - Operational

}

// MARK: - Navigation Interface
extension UsersView: UsersNavigationInterface { }

// MARK: - Presenter to View Interface
extension UsersView: UsersPresenterToViewInterface {

}
