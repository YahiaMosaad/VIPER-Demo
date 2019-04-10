import Foundation
enum UsersFetchError {
    case unexpected
    case parsing
    case badRequest
    case noInternetConnection
}

class UsersInteractor {
        // MARK: - VIPER Stack
        weak var presenter: UsersInteractorToPresenterInterface!

        // MARK: - Instance Variables

        // MARK: - Operational

}

// MARK: - Presenter To Interactor Interface
extension UsersInteractor: UsersPresenterToInteractorInterface {
    func getUsersFromAPI() {
        guard let gitUrl = URL(string: APIBaseURL.APIBaseURL) else {
            self.presenter.fetchUsersFailedWithError(fetchError: .unexpected)
            return }
        URLSession.shared.dataTask(with: gitUrl) { (data, _, error) in
            guard let data = data else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain &&
                    error.code == NSURLErrorNotConnectedToInternet {
                    DispatchQueue.main.async {//call main thread to handle response
                        self.presenter.fetchUsersFailedWithError(fetchError: .noInternetConnection)
                    }
                    return
                }
                return
            }
            do {
                let gitData = try JSONDecoder().decode([UserEntity].self, from: data)
                print(gitData)
                DispatchQueue.main.async {
                    self.presenter.fetchUsersSuccess(userArr: gitData)
                }
            } catch let err {
                print("Err", err)
                DispatchQueue.main.async {
                    self.presenter.fetchUsersFailedWithError(fetchError: .unexpected)

                }
            }
            }.resume()
    }
}
