//
//  Created by aaqib.hussain on 15.05.22.
//

typealias ChargingPoints = [ChargingPoint]

protocol ChargingPointDataMapper {
    func map(_ points: ChargingPointsResponse) -> ChargingPoints
}

struct ChargingPointDataMapperImpl: ChargingPointDataMapper {
    func map(_ points: ChargingPointsResponse) -> ChargingPoints {
        points.map { point in
            let addr = point.addressInfo
            return ChargingPoint(
                title: point.dataProvider.title ?? "",
                address: map(addr),
                latitude: addr.latitude,
                longitude: addr.longitude,
                numberOfPoints: String("Number of charging points: \(point.numberOfPoints ?? 0)")
            )
        }
    }
}

private extension ChargingPointDataMapperImpl {
    func map(_ addr: AddressInfoResponse) -> String {
        "\(addr.addressLine1), \(addr.postcode ?? ""), \(addr.town ?? "")"
    }
}
