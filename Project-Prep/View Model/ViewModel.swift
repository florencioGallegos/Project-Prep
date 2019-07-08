//
//  ViewModel.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/5/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import Foundation

protocol viewModelDelegate: class {
    func search()
}

class ViewModel{
    
    weak var delegate: viewModelDelegate?

    
    var books = [Items](){
        didSet{
            
            delegate?.search()
        }
        
        
    }

    
    
}
