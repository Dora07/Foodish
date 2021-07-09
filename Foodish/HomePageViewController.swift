

import UIKit
//滑動停止時計算目前所在的分頁位置，更新 segmented control的Index
extension HomePageViewController: UIScrollViewDelegate
{
    
  func ScrollViewDidEndDecelerating(scrollView:UIScrollView)
    {        let index = Int(scrollView.contentOffset.x / scrollView.bounds.width)
       ImageSegmentedControl.selectedSegmentIndex = index
        
    }
    
}


class HomePageViewController: UIViewController
{
   
   
   
   
    @IBOutlet weak var ImageSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var ImageChangeScrollView: UIScrollView!
    
    
   
    override func viewDidLoad()
    {
        
        
        super.viewDidLoad()
        //變更圖片大小
        func ReSizeImage(image: UIImage, width: CGFloat) -> UIImage {
                let Size = CGSize(width: width, height:
                    image.size.height * width / image.size.width)
                let Renderer = UIGraphicsImageRenderer(size: Size)
                let NewImage = Renderer.image { (context) in
                    image.draw(in: Renderer.format.bounds)
                }
                return NewImage
        }
        
        //  navigationItem 返回鍵變更圖片
        if let BakBtnicon = UIImage(named: "Group 1414")
        {
        let SmallImage = ReSizeImage(image:BakBtnicon, width: 25)
            let BakBtn = UIBarButtonItem(image:SmallImage.withRenderingMode(.alwaysOriginal), style:.plain, target: navigationController, action: #selector(UINavigationController.popViewController(animated:)))
        
            navigationItem.leftBarButtonItem = BakBtn
   
       
        }
    
  }
    //點選 segmented control時捲動 scrollview 
    @IBAction func ImageChangePage(_ sender: UISegmentedControl)
    {
        let x = CGFloat(sender.selectedSegmentIndex) * ImageChangeScrollView.bounds.width
                let offset = CGPoint(x: x, y: 0)
        ImageChangeScrollView.setContentOffset(offset, animated: true)
        
    }
    
 
    var NumberOfImage : Int?
    
    override func prepare (for segue :UIStoryboardSegue ,sender: Any?)
    {
       
        let oneImgeViewController = segue.destination as? OneImageViewController
        oneImgeViewController?.NumberOfImage = NumberOfImage
        
      let allImgeViewController = segue.destination as? AllBurgerCollectionViewController
      allImgeViewController?.NumberOfImage = NumberOfImage
       
        
        
    }

    
    
    
    
}
