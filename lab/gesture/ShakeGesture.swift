import UIKit

class ViewController: UIViewController {

  override func viewDidLoad(){
    super.viewDidLoad()
  }
  
  override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      // Action here
      let shakeAlert = UIAlertController(title: "Alert", message: "Shake Gesture Detected", preferredStyle: UIAlertController.Style.alert)

      shakeAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        print("User shaked device.")
      }))

      present(shakeAlert, animated: true, completion: nil)
    }
  }
}
