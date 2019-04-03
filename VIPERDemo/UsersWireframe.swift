import UIKit

class UsersWireframe {
        // MARK: - VIPER Stack
        lazy var moduleInteractor = UsersInteractor()
        // Uncomment to use a navigationController from storyboard
        /*
        lazy var moduleNavigationController: UINavigationController = {
                let sb = UsersWireframe.storyboard()
                let nc = (sb.instantiateViewController(withIdentifier: UsersConstants.navigationControllerIdentifier) as? UINavigationController)!
                return nc
        }()
        */
        lazy var modulePresenter = UsersPresenter()
        lazy var moduleView: UsersView = {
                // Uncomment the commented line below and delete the storyboard
                //      instantiation to use a navigationController from storyboard
                //let vc = self.moduleNavigationController.viewControllers[0] as! UsersView
                let sb = UsersWireframe.storyboard()
                let vc = (sb.instantiateViewController(withIdentifier: UsersConstants.viewIdentifier) as? UsersView)!
                _ = vc.view
                return vc
        }()

        // MARK: - Computed VIPER Variables
        lazy var presenter: UsersWireframeToPresenterInterface = self.modulePresenter
        lazy var view: UsersNavigationInterface = self.moduleView

        // MARK: - Instance Variables

        // MARK: - Initialization
        init() {
                let i = moduleInteractor
                let p = modulePresenter
                let v = moduleView

                i.presenter = p

                p.interactor = i
                p.view = v
                p.wireframe = self

                v.presenter = p
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

}
