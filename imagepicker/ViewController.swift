import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate
, UINavigationControllerDelegate{

    @IBOutlet weak var imgSelected: UIImageView!
    @IBOutlet weak var addPhoto: UIButton!
    var imagePickController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePickController.delegate = self
        
        // Circle Border Effect
        imgSelected.layer.cornerRadius = imgSelected.frame.size.width/2
        imgSelected.layer.borderWidth = 3
        imgSelected.layer.borderColor = UIColor.black.cgColor
        addPhoto.layer.cornerRadius = addPhoto.frame.size.width/2
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        imgSelected.image = image
        addPhoto.isHidden = true
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnMedia(_ sender: UIButton ) {
        // Image Picker (from photolibrary)
        imagePickController.sourceType = .photoLibrary
        imagePickController.modalPresentationStyle = .fullScreen
        present(imagePickController, animated: true, completion: nil)
    }
    
    @IBAction func clearPicture(_ sender: Any) {
        imgSelected.image = nil
        addPhoto.isHidden = false
    }
}
