//
//  Created by aaqib.hussain on 29.07.21.
//

struct ChargingPointsRequest: Request {
    private let latitude: Double
    private let longitude: Double
    init(
        latitude: Double = 52.526,
        longitude: Double = 13.415
    ) {
        self.latitude = latitude
        self.longitude = longitude
    }

    var path: String {
        "/poi"
    }

    var queryParams: [String : String] {
        [
            "latitude" : "\(latitude)",
            "longitude" : "\(longitude)",
            "distance" : "5"
        ]
    }

    var requestType: RequestType {
        .GET
    }
}
