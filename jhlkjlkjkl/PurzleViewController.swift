//
//  PurzleViewController.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 11/9/20.
//


import UIKit
import TTGTagCollectionView


class MyButton: UIButton {
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.lightGray : UIColor.orange
        }
    }
}



class PurzleViewController: UIViewController, TTGTextTagCollectionViewDelegate {
    
    var text: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var asnwersCollectionView:TTGTextTagCollectionView = {
        let collectionView = TTGTextTagCollectionView()
        collectionView.scrollView.bounces = false
        collectionView.alignment = .left
        collectionView.backgroundColor = .green
        return collectionView
    }()
    
    var questionsCollectionView:TTGTextTagCollectionView = {
        let collectionView = TTGTextTagCollectionView()
        collectionView.scrollView.bounces = false
        collectionView.alignment = .left
        collectionView.backgroundColor = .yellow
        return collectionView
    }()
    
    
    var config: TTGTextTagConfig = {
        let config = TTGTextTagConfig()
        config.backgroundColor = .systemBlue
        config.textColor = .white
        config.borderColor = .systemOrange
        config.borderWidth = 1
        return config
    }()
    
    var submitButton: MyButton = {
        let button = MyButton()
        button.setTitle("제출하기", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(submit), for: .touchUpInside)
        return button
    }()
    
    
    
    private var selections = [String]()
    
    
    private var answers = [String]()
    
    
    private var questions:[String] = ["집단적 창의적 발상기법으로","집단에 소속된 인원들이","자발적으로 자연스럽게 제시된", "아이디어 목록을 통해서", "특정한 문제에 대한", "해답을 찾고자 하는", "회의 기법이다."]
    
    
    @objc func submit() {
        
        let answer = selections.compactMap{ $0 + " "}.joined()
        let keyword = ["아이디어","특정한","찾고자","기법"]
        let result = keyword.compactMap { answer.contains($0) ? $0 : "❌" }
        
        print("제출 : \(answer)")
        
        if(result.contains("❌")){
            alert(text: "아래 키워드 모두 문장에 포함되면 정답:)\n\(keyword)\n\n오답입니다ㅠㅠ\n\(result)")
        }else{
            alert(text: "정답입니다:)\n답안 : \(questions.joined())\n\n제출 : \(selections.joined())")
        }
        
    }
    
    
    func alert(text:String){
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        alert.view.tintColor = .white
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .green
        alert.view.subviews.first?.subviews.first?.subviews.first?.alpha = 1.0
        alert.view.subviews.first?.subviews.first?.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .white
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        let attributes = [
            //            NSAttributedString.Key.foregroundColor : UIColor.aquamarine,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18),
            //            NSAttributedString.Key.underlineColor : UIColor.black,
            //            NSAttributedString.Key.strikethroughColor : UIColor.black,
        ]
        
        let messageText = NSAttributedString(
            string: text,
            attributes: attributes
        )
        
        alert.setValue(messageText, forKey: "attributedMessage")
        
        let canccelAction = UIAlertAction(title: "cancel", style: .default) {
            _ in
            print("cancel..")
        }
        
        alert.addAction(canccelAction)
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [asnwersCollectionView, questionsCollectionView].forEach {
            $0.delegate = self
            $0.defaultConfig = config
        }
        
        [text, asnwersCollectionView, questionsCollectionView, submitButton].forEach {
            view.addSubview($0)
        }
        
        self.view.backgroundColor = .blue
        text.text = "브레인 스토밍에 대해 설명하세요."
        questionsCollectionView.addTags(questions.shuffled(), with: config)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        text.frame = CGRect(x: 0, y: 44, width: view.frame.width, height: 100)
        asnwersCollectionView.frame = CGRect(x: 0, y: text.frame.maxY, width: view.frame.width, height: 200)
        questionsCollectionView.frame = CGRect(x: 0, y: asnwersCollectionView.frame.maxY, width: view.frame.width, height: 200)
        submitButton.frame = CGRect(x: 0, y: questionsCollectionView.frame.maxY, width: view.frame.width, height: 50)
    }
    
    
    
    
    
    
    
    
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, didTapTag tagText: String!, at index: UInt, selected: Bool, tagConfig config: TTGTextTagConfig!) {
        
        
        if textTagCollectionView == questionsCollectionView{
            
            asnwersCollectionView.addTag(tagText)
            asnwersCollectionView.reload()
            
            questionsCollectionView.removeTag(at: index)
            questionsCollectionView.reload()
            
            selections.append(tagText)
        }else{
            
            asnwersCollectionView.removeTag(at: index)
            asnwersCollectionView.reload()
            
            questionsCollectionView.addTag(tagText)
            questionsCollectionView.reload()
            
            selections.remove(at: Int(index))
        }
    }
    
}

