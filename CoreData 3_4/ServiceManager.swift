//
//  ServiceManager.swift
//  CoreData 3_4
//
//  Created by iOS TeamLead on 4/3/19.
//  Copyright © 2019 iOS TeamLead. All rights reserved.
//
import UIKit
import CoreData
class ServiceManager: NSObject {
    static let shared : ServiceManager = ServiceManager()
    
    //MARK: FUNCTION INSERT
    func insertDataFromLocalDataBase(name : String, city :String)  {
        
       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        
       {
        return
        }
        
        let manageObjectContext = appDelegate.persistentContainer.viewContext
        
        let personEntity = NSEntityDescription.entity(forEntityName: "User", in: manageObjectContext)
        let object : NSManagedObject = NSManagedObject(entity: personEntity!, insertInto: manageObjectContext)
        
        object.setValue(name, forKey: "name")
        object.setValue(city, forKey: "city")

        do {
            try manageObjectContext.save()
            print(manageObjectContext)
        } catch  {
            print("There is some problem")
        }
}
    func fetchDataFromLocalDataBase()  {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else{
                return
        }
        
        let manageObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        let fetchUniquId = NSFetchRequest<NSManagedObjectID>(entityName: "User")
        print("Unique Id: \(fetchUniquId)")
        do{
            let data = try manageObjectContext.fetch(fetchRequest)
            
            for person in data{
                
                
                let model = AIData(name: person.value(forKey: "name") as! String, city: person.value(forKey: "city") as! String)
                
              
                
                appDelegate.arrayGloble.append(model)
                
                
                print("\n\n")
                
                print("data : \(String(describing: person.value(forKey: "name")))")
                print("data : \(String(describing: person.value(forKey: "city")))")
                //                print("unique id : \(person.value(forKey: "_pk"))")
                print("data id :\(fetchUniquId)")
            }
        }catch{
            print("There is Some Problem")
            return
        }
    }
    
    func updateDataFromLocalDataBase(name : String, city :String)  {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
            return
        }
       let name = name
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        
        do{
            let data = try manageContext.fetch(fetchRequest)
            
            for person in data {
                
                if let allname = person.value(forKey: "name") as? String {
                    if name == allname{
                         person.setValue(city, forKey: "name")
                        let alertView:UIAlertView = UIAlertView()
                        alertView.message = " Update Successfully"
                        alertView.delegate = self
                        alertView.addButton(withTitle: "OK")
                        alertView.show()
                    }
                    
                  
                }
               
            }
          
        }catch {
           
        }
        
//        let alertView:UIAlertView = UIAlertView()
//        alertView.message = "Not match data"
//        alertView.delegate = self
//        alertView.addButton(withTitle: "OK")
//        alertView.show()
        do {
            try manageContext.save()
           
        }catch{
           
        }
       
    }
    
    
    
    
    //MARK: FUNCTION DELETE
    func deleteDataFromLocalDataBase(name : String, city :String)  {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else{ return }
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        
        do{
            let data = try managedObjectContext.fetch(fetchRequest)
            for person in data{
                //                print(person.value(forKey: "name"))
                if let allName = person.value(forKey: "name") as? String{
                    if allName == name {
                        let alertView:UIAlertView = UIAlertView()
                        alertView.message = "Delele Successfully"
                        alertView.delegate = self
                        alertView.addButton(withTitle: "OK")
                        alertView.show()
                        appDelegate.arrayGloble.removeAll()
                        let finalData = managedObjectContext.delete(person)
                       
                        //
                        //                        let model = AIData(name: person.value(forKey: "name") as! String, idPerson: person.value(forKey: "idPerson") as! String, date: person.value(forKey: "date") as! Date)
                        //                        appDelegate.arrayGloble.append(model)
                    }
                   
                }
               
                
            }
           
        }catch{
            
        }
        
        do{
            try managedObjectContext.save()
        }catch{
            
        }
        
        
    }
}
