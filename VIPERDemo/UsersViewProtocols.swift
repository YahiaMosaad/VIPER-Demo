// VIPER Interface for manipulating the navigation of the view
protocol UsersNavigationInterface: class {

}

// VIPER Interface for communication from Presenter -> View
protocol UsersPresenterToViewInterface: class, Popupable, Loadable {
    func getUsers(usersData: [UserEntity])
}
