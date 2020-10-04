import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var resultResume: UILabel!
    
    var numberOfPeople: String = ""
    var tipPercentage: Double = 0.0
    var pricePerPerson: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("we here")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculate(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
