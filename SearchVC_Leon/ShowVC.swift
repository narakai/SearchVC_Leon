//
//  ShowVC.swift
//  SearchVC_Leon
//
//  Created by lai leon on 2017/12/20.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

class ShowVC: UIViewController {

    let textView: UITextView = {
        let textView = UITextView(frame: YHRect)
        textView.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 5))
        textView.textColor = .orange
        textView.isEditable = false
        return textView
    }()
    var province: Province!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    private func setupView() {
        //在ViewController 里面去定制导航栏左右按钮，以及中间标题
        title = province.name
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tapClick))
        var str = "省会名称：\(province.name)\n拥有\(province.citys.count)个市\n"
        for city in province.citys {
            str = "\(str)\n市名：\(city.name)\n别名：\(city.alias)\n"
        }
        textView.text = str

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapClick))
        textView.addGestureRecognizer(tap)

        view.addSubview(textView)
    }

    @objc func tapClick(_ sender: Any) {
        print("按钮被点击")
        dismiss(animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
