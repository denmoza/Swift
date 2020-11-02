import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var imgSelection: UIImageView!
    
    var imagePickController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePickController.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        imgSelection.image = image
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func btnMedia(_ sender: UIBarButtonItem) {
        imagePickController.sourceType = .photoLibrary
        present(imagePickController, animated: true, completion: nil)
    }
    
}
