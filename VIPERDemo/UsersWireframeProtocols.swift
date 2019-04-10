// VIPER Module Constants
struct UsersConstants {
        // Uncomment to utilize a navigation contoller from storyboard
        static let navigationControllerIdentifier = "UsersNavigationController"
        static let storyboardIdentifier = "Users"
        static let viewIdentifier = "UsersView"
        static let userTableViewCell = "UserCell"
}

// Interface Abstraction for working with the VIPER Module
protocol Users: class {
        var delegate: UsersDelegate? { get set }
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol UsersPresenterToWireframeInterface: class {
    func navigateToUserDetails(userInfo: UserEntity)
}
