//
//  Created by aaqib.hussain on 15.05.22.
//

protocol ChargingPointsRepository {
    typealias ChargingPointsResponseCompletion = (Result<ChargingPointsResponse, NetworkError>) -> Void
    
    func fetchChargingPoints(
        _ request: ChargingPointsRequest,
        completion: @escaping ChargingPointsResponseCompletion
    ) throws
}

final class ChargingPointsRepositoryImpl: ChargingPointsRepository {
    private let requestManager: RequestManager

    init(requestManager: RequestManager = RequestManagerImpl()) {
        self.requestManager = requestManager
    }

    func fetchChargingPoints(
        _ request: ChargingPointsRequest,
        completion: @escaping ChargingPointsResponseCompletion
    ) throws {
        try requestManager.execute(request: request, completion: completion)
    }
}
