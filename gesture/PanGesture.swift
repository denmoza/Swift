import UIKit

class ViewController: UIViewController {
  
  @IBAction func handlePanGesture(_ sender: UIPanGestureRecognizer){
    let translation = sender.translation(in: self.view)
    if let view = sender.view {
      view.center = CGPoint(x: view.center.x + translation.x,
                            y: view.center.y + translation.y)
    }
    sender.setTranslation(CGPoint.zero, in: self.view)
  }
}
