import Foundation

class UsersPresenter {
        // MARK: - VIPER Stack
        weak var interactor: UsersPresenterToInteractorInterface!
        weak var view: UsersPresenterToViewInterface!
        weak var wireframe: UsersPresenterToWireframeInterface!

        // MARK: - Instance Variables
        weak var delegate: UsersDelegate?
        var moduleWireframe: Users {
                get {
                        let mw = (self.wireframe as? Users)!
                        return mw
                }
        }

        // MARK: - Operational

}

// MARK: - Interactor to Presenter Interface
extension UsersPresenter: UsersInteractorToPresenterInterface {

}

// MARK: - View to Presenter Interface
extension UsersPresenter: UsersViewToPresenterInterface {

}

// MARK: - Wireframe to Presenter Interface
extension UsersPresenter: UsersWireframeToPresenterInterface {
        func set(delegate newDelegate: UsersDelegate?) {
                delegate = newDelegate
        }
}
