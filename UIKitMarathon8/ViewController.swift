//
//  ViewController.swift
//  UIKitMarathon8
//
//  Created by alexeituszowski on 23.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let avatarImage: UIImageView = {
       let view = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
       return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "( ͡° ͜ʖ ͡°)"
        view.backgroundColor = .white
        view.addSubview(scrollView)
        configureNavigationBar()
    }
    
    override func viewWillLayoutSubviews() {
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
    }
    
    private func configureNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar,
              let largeTitleView = navigationBar.subviews.first(where: { NSStringFromClass($0.classForCoder).contains("UINavigationBarLargeTitleView")}),
              let label = largeTitleView.subviews.first(where: { $0 is UILabel }) else { return }
        
        largeTitleView.addSubview(avatarImage)
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: label.topAnchor),
            avatarImage.trailingAnchor.constraint(equalTo: largeTitleView.layoutMarginsGuide.trailingAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 36),
            avatarImage.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
