import UIKit


let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json")!
let fileContents = try! Data(contentsOf: fileUrl)

func main() {
    let json = try? JSONSerialization.jsonObject(with: fileContents, options: [])
    let dictionary: [String:Any] = json as! [String:Any]
    
    let name:String = dictionary["name"] as! String
    let hobbies:[String] = dictionary["hobbies"] as! [String]
    let age:Int = dictionary["age"] as! Int
    
    print("Good evening. I am recognized as \(name). I am of \(age) years on this planet. My personage appreciates \(hobbies.joined(separator: ", ")). Have a day.")
}


main()
