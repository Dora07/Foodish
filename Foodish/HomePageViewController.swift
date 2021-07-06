

import UIKit

class HomePageViewController: UIViewController
{

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
}
