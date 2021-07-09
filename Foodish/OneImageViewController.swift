import UIKit

class OneImageViewController: UIViewController
{
 
    var NumberOfImage : String?

    @IBOutlet weak var NumberYouChose: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        NumberYouChose.text = NumberOfImage
    }
    
    
    

}
