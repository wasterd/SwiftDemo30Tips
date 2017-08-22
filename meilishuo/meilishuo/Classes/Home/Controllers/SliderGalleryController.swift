//
//  SliderGalleryController.swift
//  meilishuo
//
//  Created by ya Liu on 2017/7/26.
//  Copyright © 2017年 wasterd. All rights reserved.
//

import UIKit

//图片轮播组件代理协议
protocol SliderGalleryControllerDelegate {
    //获取数据源
    func gallerDataSource() -> [String]
    
    //获取内部scrollview的宽高尺寸
    func galleryScrollviewSize() -> CGSize
    
}

class SliderGalleryController: UIViewController,UIScrollViewDelegate {

    //代理对象
    var delegate = SliderGalleryControllerDelegate!.self
    let device_width = UIScreen.main.bounds.width
    let device_height = UIScreen.main.bounds.height
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        
        
    }

}
