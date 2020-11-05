import UIKit

class ViewController: UIViewController {

  override func viewDidLoad(){
    super.viewDidLoad()
  }
  
  @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer){
    for _ in 0..< sender.numberOfTouches {
      // Action here
      if toggle == true {
        image.isHidden = false
      } else if toggle == false {
        image.isHidden = true
      }
    }
  }
}
