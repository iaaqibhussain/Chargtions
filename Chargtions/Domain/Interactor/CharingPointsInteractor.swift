//
//  Created by aaqib.hussain on 15.05.22.
//

import Foundation

protocol ChargingPointsInteractor {
    typealias ChargingPointsCompletion = (Result<ChargingPoints, NetworkError>) -> Void

    func fetchChargingPoints(
        center: CoordinateRegion,
        completion: @escaping ChargingPointsCompletion
    )

    func startTimer(with completion: @escaping () -> Void)
}

final class ChargingPointsInteractorImpl: ChargingPointsInteractor {
    private let repository: ChargingPointsRepository
    private let mapper: ChargingPointDataMapper
    private var timer: Timer?
    private let timeOut = 30.0
    init(
        repository: ChargingPointsRepository = ChargingPointsRepositoryImpl(),
        mapper: ChargingPointDataMapper = ChargingPointDataMapperImpl()
    ) {
        self.repository = repository
        self.mapper = mapper
    }

    func fetchChargingPoints(
        center: CoordinateRegion,
        completion: @escaping ChargingPointsCompletion
    ) {
        do {
            let request = ChargingPointsRequest(
                latitude: center.latitude,
                longitude: center.longitude
            )
            
            try fetchChargingPoints(
                request,
                completion: completion
            )
        } catch {
            completion(.failure(.error(error)))
        }
    }

    func startTimer(with completion: @escaping () -> Void) {
        self.timer = Timer.scheduledTimer(withTimeInterval: timeOut, repeats: true) { timer in
            completion()
        }
        timer?.fire()
    }

    deinit {
        timer?.invalidate()
    }
}

private extension ChargingPointsInteractorImpl {
    func fetchChargingPoints(
        _ request: ChargingPointsRequest,
        completion: @escaping ChargingPointsCompletion
    ) throws {
        try repository.fetchChargingPoints(
            request,
            completion: { [weak self] response in
                switch response {
                case let .success(chargingPointResponse):
                    let mappedChargingPoints = self?.map(chargingPointResponse) ?? []
                    completion(.success(mappedChargingPoints))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
        )
    }

    func map(_ chargingPointsResponse: ChargingPointsResponse) -> ChargingPoints {
        mapper.map(chargingPointsResponse)
    }
}
