import UIKit
import CoreData


class ViewController: UIViewController {
    
    @IBOutlet weak var lblOutput: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    
    var school:[Student] = []
    var index = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addData()
        getData()
    }
    
    func getData(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let data = try? context.fetch(Student.fetchRequest())
            school = data as! [Student]
            lblOutput.text = ""
            
            // Print out data
            for i in 0..<qg1904q.count {
                lblOutput.text! += "\(school[i].indexNo) \(school[i].name)\n"
                
                // print("\(school[i].name)")
            }
        
        }
    }
    func addData(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newData = Student(context: context)
            newData.name = "Student A"
            newData.indexNo = 1
                
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
    }
    
    func deleteLast(){
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        if school.isEmpty == true {
          print("Array is empty")
        } else {
          context.delete(school[school.count - 1])
          (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
      }
    }
    
    func deleteSelected(){
     if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
       let findUser = txtInput.text!
       if findUser == "" {
        print("Empty Input")
       } else if school.contains(where: { $0.name == "\(findUser)"}){
        let row = school.firstIndex(where: { $0.name == "\(findUser)"})!
        context.delete(school[row])
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
       } else {
        print("cannot find user")
       }
    }
    
   // Then add button and link button to call function. Remember to put getData() everytime to 'update/refresh'
}
