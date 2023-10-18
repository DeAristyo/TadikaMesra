//
//  HomeViewController.swift
//  TadikaApp
//
//  Created by Vicky Irwanto on 17/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let countDownTimer = CountdownRingView()
    private var showInfo1 = false
    private var showInfo2 = false
    private var focusIsBegin = false
    private var titleHi : UILabel = {
        let title  = UILabel()
        
        title.text = "Hi, "
        title.layer.zPosition = 8
        title.textColor = UIColor(named: "regular-text")
        title.layer.shadowColor = UIColor.black.cgColor
        title.layer.shadowRadius = 0.5
        title.layer.shadowOpacity = 0.1
        title.layer.shadowOffset = CGSize(width: 3, height: 3)
        title.layer.masksToBounds = false
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    private var titleName : UILabel = {
        let title  = UILabel()
        
        title.text = "Player!"
        title.textColor = UIColor(named: "highlight-text")
        title.layer.shadowColor = UIColor.black.cgColor
        title.layer.shadowRadius = 0.5
        title.layer.shadowOpacity = 0.1
        title.layer.shadowOffset = CGSize(width: 3, height: 3)
        title.layer.masksToBounds = false
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    private var titleInfo : UILabel = {
        let title  = UILabel()
        
        title.text = "Ready to fish?  "
        title.textColor = UIColor(named: "regular-text")
        title.layer.shadowColor = UIColor.black.cgColor
        title.layer.shadowRadius = 0.5
        title.layer.shadowOpacity = 0.1
        title.layer.shadowOffset = CGSize(width: 3, height: 3)
        title.layer.masksToBounds = false
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    //    private var progressRank : UIProgressView = {
    //        let progress =  UIProgressView()
    //        progress.progress = 0.4
    //        progress.layer.cornerRadius = 10
    //        progress.layer.sublayers![1].backgroundColor = UIColor(red: 0.333, green: 0.502, blue: 0.647, alpha: 1).cgColor
    //        progress.clipsToBounds = true
    //        progress.layer.sublayers![1].cornerRadius = 10
    //        progress.subviews[1].clipsToBounds = true
    //        progress.translatesAutoresizingMaskIntoConstraints = false
    //
    //        return progress
    //    }()
    //
    private var bgFocus: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "bg-1")
        view.layer.zPosition = 0
        view.contentMode = .scaleAspectFill
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var mainBg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "bg-2")
        view.layer.zPosition = -1
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var bgCircle : UIView = {
        let circle = UIView()
        circle.clipsToBounds = true
        circle.layer.backgroundColor =  UIColor(red: 0.831, green: 0.8, blue: 0.624, alpha: 0.4).cgColor
        circle.layer.cornerRadius = 81
        circle.translatesAutoresizingMaskIntoConstraints =  false
        
        return circle
        
    }()
    
    private var innerCircle : UIView = {
        let circle = UIView()
        circle.clipsToBounds = true
        circle.layer.backgroundColor = UIColor(red: 0.831, green: 0.8, blue: 0.624, alpha: 0.6).cgColor
        circle.layer.cornerRadius = 64
        circle.translatesAutoresizingMaskIntoConstraints =  false
        
        return circle
        
    }()
    
    private var btnFocus: UIButton = {
        
        let btn =  UIButton()
        btn.setTitle("Focus", for: .normal)
        btn.layer.backgroundColor = UIColor(red: 0.976, green: 0.902, blue: 0.839, alpha: 1).cgColor
        btn.layer.cornerRadius = 45
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        btn.setTitleColor(UIColor(named: "primaryColor"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
        
    }()
    
    private var userInfoOverlay: UserInfoOverlay = {
        let view =  UserInfoOverlay()
        view.layer.zPosition = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var userInfoOverlay2: UserInfoOverlay2 = {
        let view =  UserInfoOverlay2()
        view.layer.zPosition = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        countDownTimer.translatesAutoresizingMaskIntoConstraints = false
        countDownTimer.layer.zPosition = 10
        countDownTimer.alpha = 0.0
        userInfoOverlay.alpha = 0.0
        userInfoOverlay2.alpha = 0.0
    
        
        view.addSubview(countDownTimer)
        
        NSLayoutConstraint.activate([
            countDownTimer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countDownTimer.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        view.addSubview(userInfoOverlay)
    
        NSLayoutConstraint.activate([
            userInfoOverlay.topAnchor.constraint(equalTo: view.topAnchor),
            userInfoOverlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoOverlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userInfoOverlay.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(userInfoOverlay2)
    
        NSLayoutConstraint.activate([
            userInfoOverlay2.topAnchor.constraint(equalTo: view.topAnchor),
            userInfoOverlay2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoOverlay2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userInfoOverlay2.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 39),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        
        stackView.addArrangedSubview(titleHi)
        stackView.addArrangedSubview(titleName)
        
        view.addSubview(titleInfo)
        
        NSLayoutConstraint.activate([
            titleInfo.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            titleInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 39)
        ])
        
        view.addSubview(mainBg)
        
        
        
        view.addSubview(bgFocus)
        
        NSLayoutConstraint.activate([
            bgFocus.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bgFocus.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgFocus.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgFocus.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        
        view.addSubview(bgCircle)
        
        
        NSLayoutConstraint.activate([
            bgCircle.centerXAnchor.constraint(equalTo: bgFocus.centerXAnchor),
            bgCircle.centerYAnchor.constraint(equalTo: bgFocus.centerYAnchor, constant: -50),
            bgCircle.widthAnchor.constraint(equalToConstant: 162),
            bgCircle.heightAnchor.constraint(equalToConstant: 162)
        ])
        
        
        view.addSubview(innerCircle)
        
        NSLayoutConstraint.activate([
            innerCircle.centerXAnchor.constraint(equalTo: bgFocus.centerXAnchor),
            innerCircle.centerYAnchor.constraint(equalTo: bgFocus.centerYAnchor, constant: -50),
            innerCircle.widthAnchor.constraint(equalToConstant: 128),
            innerCircle.heightAnchor.constraint(equalToConstant: 128)
        ])
        
        view.addSubview(btnFocus)
        
        NSLayoutConstraint.activate([
            btnFocus.centerXAnchor.constraint(equalTo: bgFocus.centerXAnchor),
            btnFocus.centerYAnchor.constraint(equalTo: bgFocus.centerYAnchor, constant: -50),
            btnFocus.widthAnchor.constraint(equalToConstant: 90),
            btnFocus.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        
        btnFocus.addTarget(self, action: #selector(focusStart), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func handleTap(_ gesture : UITapGestureRecognizer){
        
        if gesture.state == .ended {
            if showInfo1 == false {
                showInfo1 = true
                UIView.animate(withDuration: 0.3, animations: {
                    self.userInfoOverlay.alpha = 1.0
                })
            }else{
                UIView.animate(withDuration: 0.3, animations: {
                    self.userInfoOverlay.alpha = 0.0
                })
                
                if showInfo2 == false && showInfo1 == true {
                    showInfo2 = true
                    UIView.animate(withDuration: 0.3, animations: {
                        self.userInfoOverlay2.alpha = 1.0
                    })
                }else{
                    UIView.animate(withDuration: 0.3, animations: {
                        self.userInfoOverlay2.alpha = 0.0
                    })
                    
                    focusIsBegin = true
                }
            }
            
           
        }
    }
    
    @objc func focusStart(){
        
        if focusIsBegin{
            UIView.animate(withDuration: 0.5, animations: {
                self.countDownTimer.alpha = 1.0
            })
            countDownTimer.startCountdown()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5){
                self.nextScreen()
            }
        }
        
    }
    
    func nextScreen(){
        let vc = FocusViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
