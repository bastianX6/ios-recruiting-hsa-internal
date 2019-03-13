import UIKit

protocol MovieDetailWireframeProtocol: class {
    static func assemble(repository: SavedMoviesRepositoryProtocol, movie: MovieModel) -> UIViewController
}

protocol MovieDetailViewProtocol: class {
    var presenter: MovieDetailPresenterProtocol? { get set }
    var model: MovieModel? { get set }

    func showLoading()
    func hideLoading()
    func updateSavedMovieStatus(saved: Bool)
}

protocol MovieDetailInteractorProtocol: class {
    var delegate: MovieDetailInteractorDelegate? { get set }

    func saveMovie(_ movie: MovieModel)
    func unsaveMovie(_ movie: MovieModel)
    func fetchSavedStatus(movieId: Int)
}

protocol MovieDetailInteractorDelegate: class {
    func saveMovieSuccess()
    func saveMovieFailure(error: Error)

    func unsaveMovieSuccess()
    func unsaveMovieFailure(error: Error)

    func savedMovieStatusFetched(saved: Bool)
}

protocol MovieDetailPresenterProtocol: class {
    var view: MovieDetailViewProtocol? { get set }
    var interactor: MovieDetailInteractorProtocol? { get set }
    var router: MovieDetailRouterProtocol? { get set }

    func viewDidLoad(movie: MovieModel?)
    func didTapSaveButton(movie: MovieModel, isDelete: Bool)
}

protocol MovieDetailRouterProtocol: class {
    var viewController: UIViewController? { get set }

    func showErrorAlert(error: Error)
    func dismiss()
}
