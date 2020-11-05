import UIKit

class ViewController: UIViewController {
  
  @IBAction func handlePinchGesture(_ sender: UIPinchGestureRecognizer) {
    switch sender.state {
    case .changed:
      print("Scale: \(sender.scale)")
    default:
      break
  }
}
