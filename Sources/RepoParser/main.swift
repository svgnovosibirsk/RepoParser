import Alamofire
import Foundation


/*
print("Please enter a user's nikname:")

if let nikname = readLine()?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) {
    print("\(nikname.uppercased())'s REPOSITORIES ARE:")
   
    Alamofire.request("https://api.github.com/users/\(nikname)/repos").responseJSON { response in
        if let resultsArray = response.result.value as? [Any] {
            for result in resultsArray {
                if let repo = result as? Dictionary <String, Any> {
                    if let name = repo["name"] as? String {
                        print(name)
                    }
                }
            }
        } else {
            print("Networking Error: \(String(describing: response.result.error))")
        }
    }
}
RunLoop.main.run()
*/

while(true) {//
    let group = DispatchGroup()//
    
    
        
        print("Please enter a user's nikname or q to exit:")
    
    
    if let nikname = readLine()?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) {
        
        if nikname == "q" { break }
        
        print("\(nikname.uppercased())'s REPOSITORIES ARE:")
        
      
        group.enter()//
        Alamofire.request("https://api.github.com/users/\(nikname)/repos").responseJSON { response in
            
            
            
            
            if let resultsArray = response.result.value as? [Any] {
                for result in resultsArray {
                    if let repo = result as? Dictionary <String, Any> {
                        if let name = repo["name"] as? String {
                            
                            
                                print(name)
                            group.leave()//
                            
                        }
                    }
                }
            } else {
                print("Networking Error: \(String(describing: response.result.error))")
            }
            
            
        }
        
    }
    
    group.wait() //
}
//RunLoop.main.run()







