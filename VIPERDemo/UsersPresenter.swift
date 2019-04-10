import Foundation

class UsersPresenter {
        // MARK: - VIPER Stack
        weak var interactor: UsersPresenterToInteractorInterface!
        weak var view: UsersPresenterToViewInterface!
        weak var wireframe: UsersPresenterToWireframeInterface!

        // MARK: - Instance Variables
        weak var delegate: UsersDelegate?
        var moduleWireframe: Users {
//                get {
                        let wireframe = (self.wireframe as? Users)!
                        return wireframe
//                }
        }

        // MARK: - Operational
        func getUserList() {
                view.showLoadingIndicator()
                interactor.getUsersFromAPI()
        }
}

// MARK: - Interactor to Presenter Interface
extension UsersPresenter: UsersInteractorToPresenterInterface {
    func fetchUsersFailedWithError(fetchError: UsersFetchError) {
        view.hideLoadingIndicator()
        var errorMessage = ""
        switch fetchError {
        case .badRequest, .parsing, .unexpected:
            errorMessage = "Something went wrong, please try again"
        case .noInternetConnection:
            errorMessage = "Please make sure you have good internet connection and try again"
        }
        view.showPopup(title: "Ops!", message: errorMessage, cancelTitle: "Ok") {
            //try to fetch again
            self.view.showLoadingIndicator()
            self.getUserList()
        }
    }
    func fetchUsersSuccess(userArr: [UserEntity]) {
        if  userArr.count != 0 {
            view.hideLoadingIndicator()
            view.getUsers(usersData: userArr)
        }
    }
}

// MARK: - View to Presenter Interface
extension UsersPresenter: UsersViewToPresenterInterface {
    func viewDidLoad() {
        getUserList()
    }
    func userListSelected(selectedUser: UserEntity) {
        wireframe.navigateToUserDetails(userInfo: selectedUser)
    }
}

// MARK: - Wireframe to Presenter Interface
extension UsersPresenter: UsersWireframeToPresenterInterface {
        func set(delegate newDelegate: UsersDelegate?) {
                delegate = newDelegate
        }
}
