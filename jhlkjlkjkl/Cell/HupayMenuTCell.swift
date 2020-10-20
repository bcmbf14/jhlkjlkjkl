
import Foundation
import SnapKit
import Then

class HupayMenuTCell : UITableViewCell{
    
    
    let baseView = UIView().then{
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }
    
    let termsOfUseButton = IconButton().then{
        $0.tintColor = .black
        $0.setTitleColor(.black, for: .normal)
//        $0.titleLabel?.font = UIFont.notoMedium14
//        $0.titleLabel?.font = $0.titleLabel?.font.withSize(12)

    }
    
    let settingButton = IconButton().then{
        $0.tintColor = .black
        $0.setTitleColor(.black, for: .normal)
//        $0.titleLabel?.font = UIFont.notoMedium14
//        $0.titleLabel?.font = $0.titleLabel?.font.withSize(12)

    }
    
    let signOutButton = IconButton().then{
        $0.tintColor = .black
        $0.setTitleColor(.black, for: .normal)
//        $0.titleLabel?.font = UIFont.notoMedium14
//        $0.titleLabel?.font = $0.titleLabel?.font.withSize(12)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var didSetupConstraints = false
    
    var completionHandler: ((UIButton) -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
    }
    
    
    @objc private func termsOfUseButtonTapped(){
        completionHandler?(termsOfUseButton)
    }
    
    
    @objc private func settingButtonTapped(){
        completionHandler?(settingButton)
    }
    
    @objc private func signOutButtonTapped(){
        completionHandler?(signOutButton)
    }
    
    
    
    private func setupUI(){
        self.addSubview(baseView)
        [termsOfUseButton, settingButton, signOutButton].forEach{baseView.addSubview($0)}
        
//        self.contentView.backgroundColor = .gray009
        self.setNeedsUpdateConstraints()
        
        termsOfUseButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        termsOfUseButton.setTitleColor(.black, for: .normal)
        termsOfUseButton.setTitle("이용약관", for: .normal)
        termsOfUseButton.addTarget(self, action: #selector(termsOfUseButtonTapped), for: .touchUpInside)
        termsOfUseButton.alignVertical()
        
        
        termsOfUseButton.setImage(UIImage(systemName: "lock.fill"), for: .normal)
        settingButton.setTitleColor(.black, for: .normal)
        settingButton.setTitle("설정", for: .normal)
        settingButton.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        settingButton.alignVertical()
        
        
        termsOfUseButton.setImage(UIImage(systemName: "house.fill"), for: .normal)
        signOutButton.setTitleColor(.black, for: .normal)
        signOutButton.setTitle("로그아웃", for: .normal)
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        signOutButton.alignVertical()
        
    }
}



extension HupayMenuTCell {
    
    override func updateConstraints() {
        
        if (!didSetupConstraints) {
            
            baseView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
//                make.leading.equalToSuperview().offset(20)
//                make.trailing.equalToSuperview().offset(-20)
                
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
            }
            
            termsOfUseButton.snp.makeConstraints{ make in
                make.top.leading.bottom.equalToSuperview()
            }
            
            settingButton.snp.makeConstraints{ make in
                make.top.bottom.equalToSuperview()
                make.leading.equalTo(termsOfUseButton.snp.trailing)
                make.trailing.equalTo(signOutButton.snp.leading)
                make.width.equalTo(termsOfUseButton)
                make.width.equalTo(signOutButton)
            }
            
            signOutButton.snp.makeConstraints{ make in
                make.top.trailing.bottom.equalToSuperview()
            }
            
            didSetupConstraints = true
        }
        super.updateConstraints()
        
        
        
    }
}
