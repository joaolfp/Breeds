import Foundation
import UIKit
import CoreData

final class DatabaseManager {
    
    func createBreeds(id: Int, name: String, photo: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let breed = NSEntityDescription.insertNewObject(forEntityName: Identifier.Database.entityName, into: context) as! BreedEntity
        
        breed.id = Int32(id)
        breed.name = name
        breed.photo = photo
        
        do {
            try context.save()
            print("Breed saved successfuly")
        } catch let error {
            print("Failed to create breed: \(error.localizedDescription)")
        }
    }
    
    func fetch() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<BreedEntity>(entityName: Identifier.Database.entityName)
        
        do {
            
            let breeds = try context.fetch(fetchRequest)
            
            for (_, breed) in breeds.enumerated() {
                print("\(String(describing: breed.id)))")
                print("\(String(describing: breed.name)))")
                print("\(String(describing: breed.photo)))")
            }
            
        } catch let error {
            print("Failed to fetch Breed:", error)
        }
    }
    
    func fetchAll() -> [BreedEntity] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        var breedList: [BreedEntity] = []
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Identifier.Database.entityName)
        
        do {
            breedList = try context.fetch(fetchRequest) as! [BreedEntity]
        } catch let error {
            print(error.localizedDescription)
        }
        
        return breedList
    }
    
    func getById(detailsView: DetailsView, breedsItems: BreedsDTO?) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Identifier.Database.entityName)
        
        guard let id = breedsItems?.id else { return }
        request.predicate = NSPredicate(format: "id == %@", "\(id)")
        
        do {
            let breed = try context.fetch(request)
            
            if breed.count == 1 {
                detailsView.buttonRemoveFavorite()
            } else {
                detailsView.buttonAddFavorite()
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
