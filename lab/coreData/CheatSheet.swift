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
      context.delete(UserStorage[i])
     
      (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
     }
    }
   }    
}
  
// SearchInput
func search() {
  if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
    let fetchRequest = NSFetchRequest<Person>(entityName: "User")
    let searchField = txtSearchName.text!
            
    fetchRequest.predicate = NSPredicate(format: "name == %@", searchField)
            
    do {
      UserStorage = try context.fetch(fetchRequest)
    } catch {
      print(error)
    }
            
    if UserStorage.count > 0 {
     lblOutput.text = ""
     for i in 0..<UserStorage.count {
     lblOutput.text! += "Results: \(UserStorage[i].name!) \(Health[i].age)\n"
    }
   }
  }
}

// DeleteLast
func deleteLast() {
  if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
   if UserStorage.isEmpty == true {
     print("is empty")
   } else {
     context.delete(UserStorage[UserStorage.count - 1])
     (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
   }
 }
}
  
// DeleteSelected
func deleteSelected() {
  if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
    let findUser = txtName.text!
    if findUser == "" {
      print("textfield is empty")
    } else if UserStorage.contains(where: { $0.name == "\(findUser)" }){
      let row = UserStorage.firstIndex(where: {$0.name == "\(findUser)"})!
      context.delete(UserStorage[row])
                
      (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    } else {
      print("cant find \(findUser)")
    }
   }
}
// More to be added soon
