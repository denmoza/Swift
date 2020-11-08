/* 
  CoreData Sheetsheet (UIKit, includes)
  * Not full code *
  - GetData
  - AddData
  - DeleteEverything
  - DeleteLastData
  - DeleteSelectedData
  - SearchInput
  - EditData (soon)
  
  Bonus:
  - CheckInput
  
  Legend:
  UserStorage - Array Name
  User - CoreData Entity
  txtName - UITextField Name
  txtAge - UITextField Name
  userName - Entity Attribute (Type: String)
  userAge - Entity Attribute (Type: Int16)
*/

/*
  Textbook Code 
  Chapter 1: Code
  Remember: AutoCorrect helps
  
  
  // ViewContext of CoreData
  if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
    // Send Request of CoreData of entityName of "User"
    let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    // Try to fetch request
    let data = try? context.fetch(fetch)
    // Store Data to Array
    UserStorage = data as! [User]
  }
  
  // Save Code
  (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
*/

// Remember to import CoreData 
import UIKit
import CoreData

// Create Array Data
var UserStorage:[User] = []

/* 
   CheckInput - Bool
   return True = if user input contains something & is in the right type (string, int, double)
*/
func checkInput() -> Bool {
  if txtName.text != "" && if txtAge.text != "" {
    if Int16(txtAge.text!) != nil {
      return true
  }
  return false
}

// GetData
if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
  let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
  let data = try? context.fetch(fetch)
  UserStorage = data as! [User]
}

// AddData
if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
  let newData = User(context: context)
  newData.name = txtName.text
  newData.age = Int16(txtAge.text!)!
  
  (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
}

// DeleteEverything
func deleteEverything() {
  if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
   if UserStorage.isEmpty == true {
    print("empty")
   } else {
      // Method 1
      let fetched = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
      let delAllReq = NSBatchDeleteResult(fetchRequest: fetched)
      do {
        try context.execute(delAllReq)
      } catch {
        print(error)
      }
      
      // Method 2
      for i in 0..<UserStorage.count {
      context.delete(Health[i])
     
      (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
     }
    }
   }    
}

// More to be added soon
