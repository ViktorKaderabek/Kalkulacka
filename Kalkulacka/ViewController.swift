
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lastAction: UILabel!
    var result: CLong = 0
    var symbolTapped: Symbols = .plus {
        didSet {
            operatorLabel.text = getSymbolSign(for: symbolTapped)
        }
    }
    
    enum Symbols: Int {
        
        case plus = 1
        case minus = 2
        case multiply = 3
        case divided = 4
    }
    

    @IBOutlet weak var lastResult: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var displayLabel: UILabel!
    var displayValue : CLong? = nil {
        didSet {
            
            if let displayValue = displayValue {
                displayLabel.text = "\(displayValue)"
            } else {
                displayLabel.text = "0"
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func didTapOperators(_ sender: UIButton) {
        
        print(getSymbol(for: sender.tag))
        symbolTapped = getSymbol(for: sender.tag)
        
        if displayValue == 0 {
                
            result = displayValue ?? 0
        } else {
            
            switch symbolTapped {
            case .plus:
                    
                result += displayValue ?? 0
            case .minus:
                
                result -= displayValue ?? 0
            case .multiply:
                
                result *= displayValue ?? 0
            case .divided:
                
                result /= displayValue ?? 0
            }
        }
        
        displayValue = nil
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        
        switch symbolTapped {
        case .plus:
                
            result += displayValue ?? 0
        case .minus:
            
            result -= displayValue ?? 0
        case .multiply:
            
            result *= displayValue ?? 1
        case .divided:
            
            result /= displayValue ?? 1
        }
        
        displayLabel.text = result.description
        
        
    }
    
    @IBAction func didTapNumber(_ sender: UIButton) {
        updateDisplay(with: "\(sender.tag)")
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        displayValue = 0
        result = 0
    }
    
    func getSymbol(for tag: Int) -> Symbols {
        return Symbols(rawValue: tag) ?? .plus
    }
    
    func getSymbolSign(for symbol: Symbols) -> String {
        switch symbol {
        case .plus:
            print ("+")
            return "+"
        case .minus:
             print ("-")
            return "-"
        case .divided:
            print ("÷")
            return "÷"
        case .multiply:
            print ("*")
            return "*"
            }
    }
    func updateDisplay(with number: String) {
        
        if number.isEmpty {
            displayValue = nil
        } else if let text = displayLabel.text {
            displayValue = CLong(text + number) ?? 0
        } else {
            displayValue = CLong(number) ?? 0
        }
    }
}
