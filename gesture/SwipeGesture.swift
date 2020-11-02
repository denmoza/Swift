import UIKit

class ViewController: UIViewController {

  overrided func viewDidLoad(){
    super.viewDidLoad()
  }
  
  // Remember to add individual swipe Gesture from + in main.storyboard
  // 1 Swipe Gesture = 1 case .direction
  @IBAction func handleSwipeGesture(_ sender: UISwipeGestureRecognizer){
    switch sender.direction {
      case .right:
        print("user swipe right")
        self.view.backgroundColor = UIColor.yellow
       case .left:
        print("user swipe left")
        self.view.backgroundColor = UIColor.green
       default:
       break
    }
  }
}
