//
//  Created by aaqib.hussain on 15.05.22.
//

import Foundation

enum ChargingPointsViewState {
    case center(CoordinateRegion)
    case loading
    case update(ChargingPoints)
    case error(String)
}

protocol ChargingPointsViewModel {
    typealias ChargingPointsStateChange = (ChargingPointsViewState) -> Void
    var onStateChange: ChargingPointsStateChange? { get set }

    func focusOnCenter()
    func onViewDidLoad()

    func item(at index: Int) -> ChargingPoint
}

final class ChargingPointsViewModelImpl: ChargingPointsViewModel {
    var onStateChange: ChargingPointsStateChange?

    private let interactor: ChargingPointsInteractor
    private var points: ChargingPoints = []
    private let center = CoordinateRegion(latitude: 52.526, longitude: 13.415)

    init(interactor: ChargingPointsInteractor = ChargingPointsInteractorImpl()) {
        self.interactor = interactor
    }

    func focusOnCenter() {
        onStateChange?(.center(center))
    }

    func onViewDidLoad() {
        onStateChange?(.loading)
        fetchChargingPoints()
        startTimer()
    }

    func item(at index: Int) -> ChargingPoint {
        points[index]
    }
}

private extension ChargingPointsViewModelImpl {
    func fetchChargingPoints() {
        interactor.fetchChargingPoints(center: center) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case let .success(points):
                self.points = points
                self.onStateChange?(.update(points))

            case let .failure(error):
                self.onStateChange?(.error(error.localizedDescription))
            }
        }
    }

    func startTimer() {
        interactor.startTimer { [weak self] in
            self?.fetchChargingPoints()
        }
    }
}
