//
//  CheckBoxBotton.swift
//  SimpleCoreData
//
//  Created by Артём on 20.08.2021.
//

import UIKit

class CheckBoxBotton: UIButton {
    
    var index: Int!
    
    static let mainColor: UIColor = .systemBlue
    
    var toggleHandler: ((Bool, Int)->Void)?
    var isChecked: Bool!{
        didSet{
            setBackgroundColor()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(toggle), for: .touchUpInside)
        
        isChecked = false
        setBackgroundColor()
        
        layer.borderWidth = 2
        
        heightAnchor.constraint(equalToConstant: 20).isActive = true
        widthAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.size.width / 2
    }
    
    private func setBackgroundColor(){
        if isChecked {
            backgroundColor = CheckBoxBotton.mainColor
            layer.borderColor = UIColor.white.cgColor
        } else{
            backgroundColor = .clear
            layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
    
    @objc func toggle(){
        isChecked = !isChecked
        setBackgroundColor()
        toggleHandler?(isChecked, index)
    }
}
