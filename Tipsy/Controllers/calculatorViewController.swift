import UIKit

class calculatorViewController: UIViewController {

    @IBOutlet weak var billTotal: UITextField!
    @IBOutlet weak var zeroPercentTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tipPercentage: Double = 0
    var BillTotalBeforeSplit: Double = 0.0
    var billTotalPlusTip: Double = 0.0
    var splitBill: Double = 0.0
    
    @IBAction func billChanged(_ sender: UIButton) {
        billTotal.endEditing(true)
        zeroPercentTip.isSelected = false
        tenPercentTip.isSelected = false
        twentyPercentTip.isSelected = false

        sender.isSelected = true
        var percentage = sender.currentTitle
        percentage = String(percentage!.dropLast())
        
        tipPercentage = Double(percentage!)!
        tipPercentage = (tipPercentage/100) + 1
//        print(percentage/100)
        print(tipPercentage)
        print("Something")
        
        billTotal.endEditing(true)
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let BillTotalBeforeSplit = Double(billTotal.text!)!
        let billTotalPlusTip = BillTotalBeforeSplit * tipPercentage
        print(billTotalPlusTip)
        let splitBill = billTotalPlusTip / Double(splitNumberLabel.text!)!
        print(splitBill)
        print(splitNumberLabel.text!)
        self.performSegue(withIdentifier: "goToResultsViewController", sender: self)
    }
    //This method gets triggered just before the segue starts.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //If the currently triggered segue is the "goToResults" segue.
        if segue.identifier == "goToResultsViewController" {
            
            //Get hold of the instance of the destination VC and type cast it to a ResultViewController.
            let destinationVC = segue.destination as! ResultsViewController
            
            //Set the destination ResultsViewController's properties.
            destinationVC.pricePerPerson = String(format: "%.2f", splitBill)
            destinationVC.tipPercentage = Double((tipPercentage/100) + 1)
            destinationVC.numberOfPeople = splitNumberLabel.text!
        }
    }
}

