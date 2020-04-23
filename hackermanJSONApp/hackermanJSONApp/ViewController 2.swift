import UIKit


class ViewController: UIViewController {
    
    var jsonFileData: Data?
    var jsonFileString: String?

    // TODO: Come up with a better UI than just a single boring label.
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") {
            jsonFileData = try? Data(contentsOf: fileUrl)
            jsonFileString = try? String(contentsOf: fileUrl)
        }
        let json = try? JSONSerialization.jsonObject(with: jsonFileData!, options: [])
        let dictionary: [String:Any] = json as! [String:Any]
        
        let name:String = dictionary["name"] as! String
        let playerName:String = dictionary["playerName"] as! String
        let race:String = dictionary["race"] as! String
        let klaus:String = dictionary["class"] as! String
        let HP:Int = dictionary["HP"] as! Int
        let abilities:[String] = dictionary["abilities"] as! [String]
        let items:[String] = dictionary["items"] as! [String]
        let hours:Int = dictionary["Hours until Sleep"] as! Int
        

        
        if jsonFileData != nil {
            // TODO: Parse the JSON data and display it in the app.
            var output = ""
            output += "Name: \(name)"
            output += "\n"
            output += "Controlled by: \(playerName)"
            output += "\n\n"
            output += "Race: \(race)"
            output += "\n\n"
            output += "Class: \(klaus)"
            output += "\n\n"
            output += "HP: \(HP)"
            output += "\n\n"
            output += "Hours until Sleep is required: \(hours)"
            
            label1.text = output
            
            output = ""
            output += "Abilities:"
            output += "\n"
            for each in abilities {
                output += each
                output += "\n"
            }
            
            label2.text = output
            
            output = ""
            output += "Items:"
            output += "\n"
            for each in items {
                output += each
                output += "\n"
            }
            
            label3.text = output
            
            output = ""
        }
    }

}
