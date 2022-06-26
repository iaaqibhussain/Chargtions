//
//  Created by aaqib.hussain on 09.05.22.
//

import XCTest
@testable import Chargtions

final class ChargingPointsViewModelTests: XCTestCase {
    var interactor: ChargingPointsInteractorMock!
    var viewModel: ChargingPointsViewModel!

    override func setUp() {
        interactor = ChargingPointsInteractorMock()
        viewModel = ChargingPointsViewModelImpl(interactor: interactor)
    }

    func testOnViewDidLoad() {
        viewModel.onViewDidLoad()

        XCTAssert(interactor.fetchChargingPointsCompletionCalled)
    }

    func testStartTimer() {
        interactor.timeOut = 10
        viewModel.onViewDidLoad()


        XCTAssert(interactor.fetchChargingPointsCompletionCalled)
        XCTAssert(interactor.startTimerCompletionCalled)
        XCTAssertEqual(interactor.startTimerCompletionCallsCount, 10)
        XCTAssertEqual(interactor.fetchChargingPointsCompletionCallsCount, 11)
    }
}
