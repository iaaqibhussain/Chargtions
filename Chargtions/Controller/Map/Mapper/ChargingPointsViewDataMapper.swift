//
//  Created by aaqib.hussain on 15.05.22.
//

import MapKit

protocol ChargingPointsViewDataMapper {
    func map(_ points: ChargingPoints) -> [MKAnnotation]
    func map(center: CoordinateRegion) -> MKCoordinateRegion
    func map(annotation: MKAnnotation, annotations: [MKAnnotation]) -> Int?
}

struct ChargingPointsViewDataMapperImpl: ChargingPointsViewDataMapper {
    private let delta = 0.1

    func map(_ points: ChargingPoints) -> [MKAnnotation] {
        let mkAnnotations = points.map { point -> MKAnnotation in
            let mkPoint = MKPointAnnotation()
            mkPoint.title = point.title
            mkPoint.coordinate = CLLocationCoordinate2D(
                latitude: point.latitude,
                longitude: point.longitude
            )
            return mkPoint
        }
        return mkAnnotations
    }

    func map(center: CoordinateRegion) -> MKCoordinateRegion {
        let center = CLLocationCoordinate2D(
            latitude: center.latitude,
            longitude: center.longitude
        )
        let span = MKCoordinateSpan(
            latitudeDelta: delta,
            longitudeDelta: delta
        )
        return MKCoordinateRegion(
            center: center,
            span: span
        )
    }

    func map(annotation: MKAnnotation, annotations: [MKAnnotation]) -> Int? {
        var index: Int?
        for (idx, item) in annotations.enumerated() {
            let coordinate = annotation.coordinate
            if item.coordinate.latitude == coordinate.latitude && item.coordinate.longitude == coordinate.longitude {
                index = idx
                break
            }
        }
        return index
    }
}
