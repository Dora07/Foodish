
import UIKit

private let reuseIdentifier = "Cell"




class AllBurgerCollectionViewController: UICollectionViewController
{
   
    override func viewDidLoad()
    {
        super.viewDidLoad()

    
    }

    var NumberOfImage : Int?
    
    
    

   

    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        
        return 1
    }

   //重複顯出數量照片
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
       
        return Int(NumberOfImage!)
        
  }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AllBurgerCollectionViewCell.self)", for: indexPath) as! AllBurgerCollectionViewCell
    
       
        
        
        
        let urlStr = "https://foodish-api.herokuapp.com/images/burger/burger\( NumberOfImage!).jpg"
        
        
      
        if let url = URL(string: urlStr)
        {
           
           
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data
                {
                 
                    DispatchQueue.main.async
                    {
                        cell.AllBurgerImage.image = UIImage(data: data)
                
                        
                        
                    }
                   
                }
            }.resume() //執行task
           
          
          
          
         
        return cell
    }
     
        return cell

        
       
        
        
        
        
        
        
}
}
