import UIKit

class UsersWireframe {
        // MARK: - VIPER Stack
        lazy var moduleInteractor = UsersInteractor()
        // Uncomment to use a navigationController from storyboard
        lazy var moduleNavigationController: UINavigationController = {
                let storyboard = UsersWireframe.storyboard()
                let navigationC = (storyboard.instantiateViewController(withIdentifier:
                    UsersConstants.navigationControllerIdentifier) as? UINavigationController)!
                return navigationC
        }()
        lazy var modulePresenter = UsersPresenter()
        lazy var moduleView: UsersView = {
                // Uncomment the commented line below and delete the storyboard
                //      instantiation to use a navigationController from storyboard
                let view = self.moduleNavigationController.viewControllers[0] as? UsersView
//                let sb = UsersWireframe.storyboard()
//                let vc = (sb.instantiateViewController(withIdentifier: UsersConstants.viewIdentifier) as? UsersView)!
//                _ = vc.view
                return view!
        }()

        // MARK: - Computed VIPER Variables
        lazy var presenter: UsersWireframeToPresenterInterface = self.modulePresenter
        lazy var view: UsersNavigationInterface = self.moduleView

        // MARK: - Instance Variables

        // MARK: - Initialization
        init() {
                let interactor = moduleInteractor
                let presenter = modulePresenter
                let view = moduleView

                interactor.presenter = presenter

                presenter.interactor = interactor
                presenter.view = view
                presenter.wireframe = self

                view.presenter = presenter
        }

    	class func storyboard() -> UIStoryboard {
                return UIStoryboard(name: UsersConstants.storyboardIdentifier,
                                    bundle: Bundle(for: UsersWireframe.self))
    	}

        // MARK: - Operational

}

// MARK: - Module Interface
extension UsersWireframe: Users {
        var delegate: UsersDelegate? {
                get {
                        return presenter.delegate
                }
                set {
                        presenter.set(delegate: newValue)
                }
        }
}

// MARK: - Presenter to Wireframe Interface
extension UsersWireframe: UsersPresenterToWireframeInterface {
    func navigateToUserDetails(userInfo: UserEntity) {
//        if uesrsDetailsWireframe != nil {
//            userDetailsWireframe = nil
//        }
//        userDetailsWireframe = userDetailsWireframe(userInfo: UserEntity)
//        moduleView.navigationController?.pushViewController(userDetailsWireframe!.moduleView, animated: true)
    }
}
