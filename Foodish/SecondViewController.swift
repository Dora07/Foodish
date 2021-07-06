
import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate
{

    
    @IBOutlet weak var NumberTextField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NumberTextField.delegate = self
     
    
        
    }
   
    //textFieldDelegate驗證欄位
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        //限制只能打數字及字數限制
        if textField == NumberTextField
        {
            
            let NumOfWords = string.count +
               NumberTextField.text!.count - range.length

            
            if NumOfWords > 3
            {
                return false
            }
            
            
            let AllowedCharacters = "1234567890"
             let AllowedCharcterSet = CharacterSet(charactersIn: AllowedCharacters)
             let TypedCharcterSet = CharacterSet(charactersIn: string)
             return AllowedCharcterSet.isSuperset(of: TypedCharcterSet)
    
        }
        
        return true
    }
    
    //亂數按鈕產生1~20並且填入textfield中
    @IBAction func RandomButtonAction(_ sender: UIButton)
    {
        let Number = Int.random(in: 1...20)
        NumberTextField.text = "\(Number)"
        
    }
    
    
    
    
    
}
