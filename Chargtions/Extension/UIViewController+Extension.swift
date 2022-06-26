//
//  Created by aaqib.hussain on 15.05.22.
//

import UIKit

extension UIViewController {
    static func instantiateViewController<T: UIViewController>(with storyboard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: .main)) -> T {
        let viewController: T = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        return viewController
    }

    func presentAlertController(
        title: String = "Error Occurred",
                                    message: String,
                                    actionHandler: ((UIAlertAction) -> Void)? = nil
    ) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: actionHandler)
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }

    func createActivityIndicator() -> UIActivityIndicatorView {
        let activityView = UIActivityIndicatorView(style: .large)
        activityView.center = view.center
        activityView.hidesWhenStopped = true
        view.addSubview(activityView)
        return activityView
    }
}

