//
//  Created by aaqib.hussain on 09.05.22.
//

import UIKit
import MapKit

final class ChargingPointsMapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    private var viewModel = ChargingPointsViewModelImpl()
    private let viewDataMapper = ChargingPointsViewDataMapperImpl()
    private let router = ChargingPointsMapRouter()
    lazy var activityIndicator: UIActivityIndicatorView = {
        return createActivityIndicator()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()

        viewModel.focusOnCenter()
        viewModel.onViewDidLoad()
    }
}

extension ChargingPointsMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard
            let annotation = view.annotation,
            let index = viewDataMapper.map(annotation: annotation, annotations: mapView.annotations)
        else { return }

        mapView.deselectAnnotation(annotation, animated: true)

       let point = viewModel.item(at: index)

        router.present(presentingViewController: self, with: point)

    }
}

private extension ChargingPointsMapViewController {
    func setupViewModel() {
        viewModel.onStateChange = { [weak self] state in
            self?.update(state: state)
        }
    }

    func update(state: ChargingPointsViewState) {
        switch state {
        case let .center(center):
            let region = viewDataMapper.map(center: center)
            mapView.setRegion(region, animated: true)
        case .loading:
            activityIndicator.startAnimating()
        case let .update(points):
            let annotations = self.viewDataMapper.map(points)
            DispatchQueue.main.async {
                let oldAnnotations = self.mapView.annotations
                self.mapView.removeAnnotations(oldAnnotations)
                self.mapView.addAnnotations(annotations)
                self.activityIndicator.stopAnimating()
            }
        case let .error(description):
            DispatchQueue.main.async {
                self.presentAlertController(message: description)
                self.activityIndicator.stopAnimating()
            }
        }
    }
}

