import UIKit

class OneImageViewController: UIViewController
{
 
    var MyNumber :String?

    @IBOutlet weak var NumberYouChose: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        NumberYouChose.text = "MyNumber"
    }
    
    
    

}
