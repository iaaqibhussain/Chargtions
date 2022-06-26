//
//  Created by aaqib.hussain on 15.05.22.
//

import UIKit

final class ChargingPointsMapRouter: ChargingPointsRouter {
    typealias Data = ChargingPoint

    func present(presentingViewController: UIViewController, with data: ChargingPoint) {
        let detailsViewController: ChargingPointDetailsViewController = .instantiateViewController()
        detailsViewController.viewModel = ChargingPointDetailsViewModelImpl(chargingPoint: data)
        presentingViewController.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
