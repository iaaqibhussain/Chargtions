//
//  Created by aaqib.hussain on 15.05.22.
//

import XCTest
@testable import Chargtions

final class ChargingPointsInteractorMock: ChargingPointsInteractor {
    var fetchChargingPointsCompletionCallsCount = 0
    var fetchChargingPointsCompletionCalled: Bool {
        return fetchChargingPointsCompletionCallsCount > 0
    }
    var fetchChargingPointsCompletionReceivedArguemnts: (center: CoordinateRegion, completion: ChargingPointsCompletion)?
    var fetchChargingPointsCompletionReceivedInvocations: [(center: CoordinateRegion, completion: ChargingPointsCompletion)] = []
    var fetchChargingPointsCompletionClosure: ((@escaping ChargingPointsCompletion) -> Void)?

    func fetchChargingPoints(center: CoordinateRegion, completion: @escaping ChargingPointsCompletion) {
        fetchChargingPointsCompletionCallsCount += 1
        fetchChargingPointsCompletionReceivedArguemnts = (center, completion)
        fetchChargingPointsCompletionReceivedInvocations.append((center, completion))
        fetchChargingPointsCompletionClosure?(completion)
    }

    var startTimerCompletionCallsCount = 0
    var startTimerCompletionCalled: Bool {
        return startTimerCompletionCallsCount > 0
    }
    var startTimerCompletionReceivedCompletion: (() -> Void)?
    var startTimerCompletionReceivedInvocations: [(() -> Void)] = []
    var startTimerCompletionClosure: (() -> Void)?
    var timeOut: Int = 1

    func startTimer(with completion: @escaping () -> Void) {
        for _ in 0..<timeOut {
        startTimerCompletionCallsCount += 1
        startTimerCompletionReceivedCompletion = (completion)
        startTimerCompletionReceivedInvocations.append(completion)
        startTimerCompletionClosure?() ?? completion()
        }
    }
}
