
import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate
{

    
    @IBOutlet weak var NumberTextField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NumberTextField.delegate = self
     
    }
   
    //Delegate驗證欄位
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        //限制只能打數字
        if textField == NumberTextField
        {
            
            let NumOfWords = string.count +
               NumberTextField.text!.count - range.length

            
            if NumOfWords > 3  {
                return false
            }
            
            
            let allowedCharacters = "1234567890"
             let allowedCharcterSet = CharacterSet(charactersIn: allowedCharacters)
             let typedCharcterSet = CharacterSet(charactersIn: string)
             return allowedCharcterSet.isSuperset(of: typedCharcterSet)
    
        }
        
        return true
    }
}
