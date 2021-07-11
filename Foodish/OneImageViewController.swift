import UIKit



   


class OneImageViewController: UIViewController
{
 
  
    
    
    var NumberOfImage : Int?

    @IBOutlet weak var NumberYouChose: UILabel!
    @IBOutlet weak var FoodImge: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
      
        NumberYouChose.text = "\(NumberOfImage!)"
        TakeImage()
       
       
    }
    
   
    func TakeImage() {
      
            //欲讀取資料url
            let urlStr = "https://foodish-api.herokuapp.com/images/burger/burger\( NumberOfImage!).jpg"
            if let url = URL(string: urlStr) {
                //於其他執行緒open file, read content
                URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
                    if let data = data {
                        //主執行緒執行 display content
                        DispatchQueue.main.async {
                            self.FoodImge.image = UIImage(data: data)
                        }
                    }
                   
                    
                    
                }.resume() //執行task
            }
    
 
    
    
    

    

}
}
