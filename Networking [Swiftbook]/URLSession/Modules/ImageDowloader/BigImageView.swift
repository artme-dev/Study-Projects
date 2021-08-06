//
//  ImageDowloader.swift
//  URLSession
//
//  Created by Артём on 25.07.2021.
//

import UIKit

class BigImageView: UIView {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    
    var imageURL: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("ImageDownloader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.setupViews()
    }
    
    func setupViews(){
        indicator.isHidden = true
        indicator.hidesWhenStopped = true
        imageView.isHidden = true
        button.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
        imageView.contentMode = .scaleAspectFill
    }

    @objc func loadImage(){
        button.isHidden = true
        indicator.isHidden = false
        indicator.startAnimating()
        
        let url = imageURL ?? URLConstants.image
        guard let url = URL(string: url) else { return }
        
        AlamofireNetworkService.downloadImage(url: url) { image in
            DispatchQueue.main.async {
                self.imageView.image = image
                self.imageView.isHidden = false
                self.indicator.stopAnimating()
            }
        }
    }

}
