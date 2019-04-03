// VIPER Interface to the Module
protocol UsersDelegate: class {

}

// VIPER Interface for communication from Interactor -> Presenter
protocol UsersInteractorToPresenterInterface: class {

}

// VIPER Interface for communication from View -> Presenter
protocol UsersViewToPresenterInterface: class {

}

// VIPER Interface for communication from Wireframe -> Presenter
protocol UsersWireframeToPresenterInterface: class {
        weak var delegate: UsersDelegate? { get }
        func set(delegate newDelegate: UsersDelegate?)
}
