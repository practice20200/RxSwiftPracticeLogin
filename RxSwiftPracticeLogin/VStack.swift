//
//  VStack.swift
//  RxSwiftPracticeLogin
//
//  Created by Apple New on 2022-06-09.
//

import Foundation
import UIKit

open class BaseUIStackView : UIStackView{
    public convenience init() {
        self.init(frame: .zero)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    
    public override func awakeFromNib(){
        super.awakeFromNib()
        setupView()
    }

    open func setupView(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}


open class VStack: BaseUIStackView {
    open override func setupView() {
        super.setupView()
        
        axis = .vertical
    }
}
