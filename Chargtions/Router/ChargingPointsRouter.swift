//
//  Created by aaqib.hussain on 15.05.22.
//

import UIKit

protocol ChargingPointsRouter {
    associatedtype Data
    func present(presentingViewController: UIViewController, with data: Data)
}
