//
//  SecondViewController.swift
//  Simple GCD
//
//  Created by Артём on 17.07.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    let imageURL = URL(string: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
    
    var image: UIImage? {
        get{
            return imageView.image
        }
        set{
            imageView.contentMode = .scaleAspectFill
            imageView.image = newValue
        }
    }
    
    // MARK: Изучение комментариев в проекте
    // TODO: Загляни в содержание это файла
    // FIXME: Не забудь убрать это все наконец
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.isHidden = false
        indicator.startAnimating()
        
        DispatchQueue.global(qos: .utility).async {
            let dowloadedImage = self.fetchImage()
            DispatchQueue.main.async {
                self.indicator.isHidden = true
                self.indicator.stopAnimating()
                self.image = dowloadedImage
            }
        }
        let delay = 3
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            self.showAlertMsg(message: "Как тебе картинка?")
        }
    }
    
    func showAlertMsg(message: String){
        
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func fetchImage() -> UIImage?{
        guard
            let url = imageURL,
            let data = try? Data(contentsOf: url)
        else {
            print("Cannot fetch image")
            return nil
        }
       return UIImage(data: data)
    }
}
