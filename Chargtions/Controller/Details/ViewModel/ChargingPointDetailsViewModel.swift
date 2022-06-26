//
//  Created by aaqib.hussain on 15.05.22.
//

enum ChargingPointDetailsViewState {
    case update(ChargingPoint)
}

protocol ChargingPointDetailsViewModel {
    typealias ChargingPointsDetailsStateChange = (ChargingPointDetailsViewState) -> Void
    var onStateChange: ChargingPointsDetailsStateChange? { get set }

    func onViewDidLoad()
}

final class ChargingPointDetailsViewModelImpl: ChargingPointDetailsViewModel {
    var onStateChange: ChargingPointsDetailsStateChange?
    private let chargingPoint: ChargingPoint

    init(chargingPoint: ChargingPoint) {
        self.chargingPoint = chargingPoint
    }

    func onViewDidLoad() {
        onStateChange?(.update(chargingPoint))
    }
}
