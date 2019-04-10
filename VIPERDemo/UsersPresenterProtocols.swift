// VIPER Interface to the Module
protocol UsersDelegate: class {

}

// VIPER Interface for communication from Interactor -> Presenter
protocol UsersInteractorToPresenterInterface: class {
    func fetchUsersFailedWithError(fetchError: UsersFetchError)
    func fetchUsersSuccess(userArr: [UserEntity])
}

// VIPER Interface for communication from View -> Presenter
protocol UsersViewToPresenterInterface: class {
    func viewDidLoad()
    func userListSelected(selectedUser: UserEntity)
}

// VIPER Interface for communication from Wireframe -> Presenter
protocol UsersWireframeToPresenterInterface: class {
    var delegate: UsersDelegate? { get }
        func set(delegate newDelegate: UsersDelegate?)
}
