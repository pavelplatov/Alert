import Foundation
import UIKit

extension UIView {
    func rounded(radius: CGFloat = 15) {
        self.layer.cornerRadius = radius
    }
    
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 5, height: 10)
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(ovalIn: bounds).cgPath
        layer.shouldRasterize = true
    }
    
    func addGradient() {
        let gradient = CAGradientLayer()
               gradient.colors = [UIColor.red.cgColor, UIColor.white.cgColor, UIColor.green.cgColor]
               gradient.opacity = 1
               gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
               gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

               // Используем UIBezierPath для градиента
               let path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath

               // Создаем маску для градиента
               let maskLayer = CAShapeLayer()
               maskLayer.path = path
               gradient.mask = maskLayer

               gradient.frame = bounds
               self.layer.insertSublayer(gradient, at: 0)
    }
}
    
extension UIViewController {
    func showAlert(title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    func showAlert(defaultTittle: String = "OK", title: String, message: String, defaultAction:(() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: defaultTittle, style: .default) { _ in
            guard let action = defaultAction else { return }
            action()
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(defaultTittle: String = "OK", cancelTitle: String = "Cancel", title: String, message: String, okAction: (() -> Void)?, cancelAction: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: defaultTittle, style: .default) { _ in
            guard let action = cancelAction else { return }
            action()
        }
        let cancel = UIAlertAction(title: cancelTitle, style: .cancel) { _ in
            guard let action = cancelAction else { return }
            action()
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
}
