//
//  Created by aaqib.hussain on 15.05.22.
//

import UIKit

final class ChargingPointDetailsViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var numberOfPointsLabel: UILabel!

    var viewModel: ChargingPointDetailsViewModel!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupViewModel()

        viewModel.onViewDidLoad()
    }
}

private extension ChargingPointDetailsViewController {
    func setupNavigation() {
        title = "Details"
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }

    func setupViewModel() {
        viewModel.onStateChange = { [weak self] state in
            self?.update(state: state)
        }
    }

    func update(state: ChargingPointDetailsViewState) {
        switch state {
        case let .update(point):
            titleLabel.text = point.title
            addressLabel.text = point.address
            numberOfPointsLabel.text = point.numberOfPoints

        }
    }
}
