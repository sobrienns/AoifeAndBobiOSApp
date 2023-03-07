//
//  Extensions.swift
//  AoifeAndBob
//
//  Created by Stephen O'Brien on 23/02/2023.
//

import UIKit

 extension UIView {

     func addSubViews(_ views: UIView...){
         views.forEach({
             addSubview($0)
         })
     }
     

}
