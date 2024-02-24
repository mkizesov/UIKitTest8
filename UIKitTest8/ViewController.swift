//
//  ViewController.swift
//  UIKitTest8
//
//  Created by M K on 24.02.2024.
//

import UIKit


class ViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollView = UIScrollView()
    let size = CGFloat(36)
    let damnAvatar = UIImageView()
    let avatarWrapper = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Avatar"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationItem.standardAppearance = appearance

        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.frame = view.bounds
        scrollView.contentSize = view.bounds.size
        damnAvatar.image = UIImage(systemName: "person.crop.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: size))
        damnAvatar.tintColor = .systemGray4
        damnAvatar.frame = CGRect(x: view.bounds.width - size - 20, y: -43, width: size, height: size)
        scrollView.addSubview(damnAvatar)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let navigationBarOffset = navigationController?.navigationBar.frame.origin.y ?? 0
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        let offset = navigationBarHeight - navigationBarOffset
        cropImage(imageView: damnAvatar, height: offset)
    }
    
    func cropImage(imageView: UIImageView, height: CGFloat) {
        let visibleArea = CGRect(x: 0, y: size - height, width: imageView.bounds.width, height: height)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(rect: visibleArea).cgPath
        
        imageView.layer.mask = maskLayer
    }
}
