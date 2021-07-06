
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
        //限制只能打數字及字數限制
        if textField == NumberTextField
        {
            
            let NumOfWords = string.count +
               NumberTextField.text!.count - range.length

            
            if NumOfWords > 3  {
                return false
            }
            
            
            let AllowedCharacters = "1234567890"
             let AllowedCharcterSet = CharacterSet(charactersIn: AllowedCharacters)
             let TypedCharcterSet = CharacterSet(charactersIn: string)
             return AllowedCharcterSet.isSuperset(of: TypedCharcterSet)
    
        }
        
        return true
    }
}
