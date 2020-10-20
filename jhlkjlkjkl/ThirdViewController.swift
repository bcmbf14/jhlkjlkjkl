//
//  ThirdViewController.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/8/20.
//

import UIKit



class ThirdViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let totalCount = 132

    var isAnswersLabelTextColorChange = true
    
    override func viewWillAppear(_ animated: Bool) {
        setUp()
        tableView.reloadData()
    }
    
    private func reloadData(){
        guard !hideButton.isHidden || isAnswersLabelTextColorChange == false else { return tableView.reloadData() }
        
        appDelegate.tupleDict.removeValue(forKey: appDelegate.tupleDict.keys.first ?? "")
        
        if appDelegate.tupleDict.count == 0 {
            appDelegate.tupleDict = [
                "소프트웨어 아키텍쳐 4+1뷰":("유*논*프*구*배","유스케이스뷰*논리뷰*프로세스뷰*구현뷰*배포뷰"),
                "자료분석 산출물의 종류":("현*기*인*아*소*하*네","정보시스템 구성현황*정보시스템기능 구성도*인터페이스 현황*현행시스템아키텍처 구성도*소프트웨어 구성도*하드웨어 구성도*네트워크 구성도"),
                "OSI 7계층":("A*P*Se*T*Ne*Da*Phy","Application*Presentation*Session*Transport*Network*DataLink*Physical"),
                "기능적 요구사항 특징":("기*완*일","기능성*완전성*일관성"),
                "비기능적 요구사항 특징":("신*사*효*유*이","신뢰성*사용성*효율성*유지보수성*이식성"),
                "요구사항 개발프로세스":("도*분*명*확","요구사항 도출*요구사항 분석*요구사항 명세*요구사항 확인 및 검증"),
                "요구사항 개발프로세스 검증기법":("동*워*인","동료검토*워크스루*인스펙션"),
                "요구사항 관리절차":("협*기*변*확","요구사항 협상*요구사항 기준선*요구사항 변경관리*요구사항 확인 및 검증"),
                "요구사항 분석기법":("분*개*할*협*정","요구사항 분류*개념 모델링*요구사항 할당*요구사항 협상*정형 분석"),
                "요구사항 확인기법":("요*프*모*인","요구사항 검토*프로토타이핑*모델 검증*인수 테스트"),
                "요구사항 검증방법":("목*정*비*타","요구사항 목록확인*요구사항 정의서 및 작성여부확인*비기능적 요구사항의 확인*타시스템연계 및 인터페이스 요구사항 확인"),
                "분석모델 검증방법":("유*개*분","유스케이스 모델검증*개념수준의 분석클래스검증*분석클래스검증"),
                "분석 모델의 기술적 타당성 검토항목":("성*상*아*기","성능 및 용량산정의 적정성*시스템간 상호운용성*IT(아이티)시장성숙도 및 트렌드 부합성*기술적 위험분석"),
                "분석 모델의 시스템화 타당성 분석프로세스":("컬*작*검*확","타당성 검토의견 컬럼추가*타당성 검토의견작성*타당성 분석결과검증*타당성 분석결과확인 및 배포,공유"),
                "논리데이터 모델링특징":("정*포*완*독","정규화*포용성*완전성*독립성"),
                "논리데이터 모델링속성":("개*속*관","개체*속성*관계"),
                "정규화의 이상현상":("삽*삭*갱","삽입이상*삭제이상*갱신이상"),
                "정규화단계":("원*부*이*결*다*조","원자화(1)*부분함수 종속제거(2)*이행함수 종속제거(3)*결정자함수 종속제거(BCNF)*다치종속성제거(4)*조인종속성제거(5)"),
                "파티셔닝 유형 또는 종류":("레*해*리*컴","레인지파티셔닝*해시파티셔닝*리스트파티셔닝*컴포지트파티셔닝"),
                "파티션의 장점":("성*가*백*합","성능향상*가용성향상*백업가능*경합감소"),
                "연계요구사항 분석기법":("인*체*설*델*브","인터뷰*체크리스트*설문지*델파이기법*브레인스토밍"),
                "연계요구사항 분석참고문서":("코*테*응*시","코드정의서*테이블정의서*응용프로그램구성도*시스템구성도"),
                "인터페이스명세서 또는 정의서 구성요소":("인*최*크*시*데","인터페이스ID*최대처리횟수*데이터크기(평균/최대)*시스템정보*데이터정보"),
                "연계시스템 또는 인터페이스 시스템 구성":("송*수*중","송신시스템*수신시스템*중계서버"),
                "인터페이스시스템의 데이터표준":("공*개*종","인터페이스데이터 공통부*인터페이스데이터 개발부*인터페이스데이터 종료부"),
                "송수신전문구성사례":("공*전*시*거*개*데*종","전문공통부(고정)*전문길이*시스템공통*거래공통*전문개별부(가변)*데이터*전문종료부(고정)"),
                "개발도구의 분류":("빌*구*테*형","빌드도구*구현도구*테스트도구*형상관리도구"),
                "형상관리의 절차":("식*통*감*기","형상식별*형상통제*형상감사*형상기록"),
                "응집도의 유형":("우*논*시*절*통*순*기","우연적*논리적*시간적*절차적*통신적*순차적*기능적응집도"),
                "결합도의 유형":("내*공*외*제*스*자","내부*공통*외부*제어*스탬프*자료결합도"),
                "공통모듈 테스트의 종류":("화*메*화*드*스","화이트박스테스트*메서드기반테스트*화면기반테스트*테스트드라이버*테스트스텁"),
                "서버프로그램 세부구현 프로세스":("D*S*DA*Ser*C","DTO/VO*SQL문*DAO*Service*Controller"),
                "상세기능 인터페이스 정의서 주요항목":("아*명*오*개*전*후*파*반","인터페이스 아이디(ID)*인터페이스명*오페레이션명*오퍼레이션개요*사전조건*사후조건*파라미터*반환값"),
                "EAI 구축유형":("포*허*메*하","포인트투포인트*허브앤스포크*메시지버스*하이브리드"),
                "배치프로그램의 크론표현식":("초*분*시*일*월*요*연","초*분*시간*일*월*요일*연도"),
                "배치프로그램의 유형":("이*온*정","이벤트배치*온디맨드배치*정기배치"),
                "데이터베이스 암호화알고리즘 유형":("대*비*해","대칭키암호화알고리즘*비대칭키암호화알고리즘*해시암호화알고리즘"),
                "데이터베이스 암호화기법 유형":("AP*Pl*H","API방식*Plug-In방식*Hybrid방식"),
                "인터페이스구현 검증도구":("x*S*Fi*Sel*Wa","xUnit*STAF*FitNesse*Selenium*Watir"),
                "인터페이스 오류처리방법":("화*로*테","사용자 화면에서 오류를 인지하도록 구현*인터페이스 오류 로그생성*인터페이스 관련 테이블에 오류사항기록"),
                "UI유형":("C*G*N*O","CLI*GUI*NUI*OUI"),
                "UI설계원칙":("직*유*학*유","직관성*유효성*학습성*유연성"),
                "UI설계지침":("사*일*단*결*가*표*접*명*오","사용자중심*일관성*단순성*결과예측가능*가시성*표준화*접근성*명확성*오류발생해결"),
                "UI표준구성요소":("엑*정*스*패*조","전체적인 UX(유엑스)원칙*정책 및 철학*UI스타일가이드*UI패턴모델정의*UI표준수립을 위한 조직구성"),
                "UI컨셉션":("정*와*스","정보구조설계*와이어프레임스케치*스토리보드설계"),
                "UI화면설계구분":("와*스*프","와이어프레임*스토리보드*프로토타입"),
                "스토리보드 작성절차":("개*서*스*메*추","전체개요작성*서비스흐름작성*스타일확정*메뉴별화면설계도작성 및 상세설계*추가관련정보작성"),
                "프로토타입 작성시 고려사항":("계*범*목*기*산*유","프로토타입 계획작성*프로토타입 범위확인*프로토타입 목표확인*프로토타입기간 및 비용확인*프로토타입 산출물확인*프로토타입 유의사항확인"),
                "UI프로토타입 제작 및 검토프로세스":("아*유*프*적","소프트웨어 아키텍처 설계원리확인*프로토타입 유스케이스 작성*UI요구사항을 반영한 프로토타입제작*UI적정성 검토"),
                "소프트웨어 테스트필요성":("발*예*향","오류발견*오류예방*품질향상"),
                "소프트웨어 테스트원리":("결*완*초*집*살*정*오","결함이존재*완벽한테스팅불가능*초기에테스팅시작*결함집중*살충제패러독스*정황에의존*오류-부재의궤변"),
                "소프트웨어 테스트산출물":("결*시*계*케","테스트결과서*테스트시나리오*테스트계획서*테스트케이스"),
                "정적테스트유형":("동*워*인","동료검토*워크스루*인스펙션"),
                "동적테스트유형":("동*화*블","동적테스트*화이트박스테스트*블랙박스테스트"),
                "화이트박스 테스트유형":("제*루","제어구조테스트*루프테스트"),
                "블랙박스 테스트유형":("동*경*결*상*유*분*페","동등분할테스트*경계값분석테스트*결정테이블테스트*상태전이테스트*유스케이스테스트*분류트리테스트*페어와이즈테스트"),
                "테스트목적에 따른분류":("회*안*강*성*구*회*병","회복테스트*안전테스트*강도테스트*성능테스트*구조테스트*회귀테스트*병행테스트"),
                "테스트종류에 따른분류":("명*구*경","명세기반테스트*구조기반테스트*경험기반테스트"),
                "테스트오라클종류":("참*샘*휴*일","참오라클*샘플링오라클*휴리스틱오라클*일관성검사오라클"),
                "상향식 및 하향식 통합수행방식":("하*스*상*드","하향식*스텁*상향식*드라이버"),
                "테스트 자동화도구 유형":("정*실*성*통","정적분석도구*테스트실행도구*성능테스트도구*테스트통제도구"),
                "테스트 하네스 구성요소":("드*스*슈*케*스*목","드라이버*스텁*슈트*케이스*스크립트*목오브젝트"),
                "테스트 리포팅":("정*요*품*결*실","테스트결과정리*테스트요약문서*품질상태*테스트결과서*테스트실행절차 및 평가"),
                "결함관리 프로세스":("발*등*분*확*할*조*검","에러발견*에러등록*에러분석*결함확정*결함할당*결함조치*결함조치검토 및 승인"),
                "테스트 커버리지 유형":("기*라*코","기능기반커버리지*라인커버리지*코드커버리지"),
                "코드 커버리지 유형":("구*결*조*조*변*다","구문커버리지*결정커버리지*조건커버리지*조건/결정커버리지*변경 조건/결정커버리지*다중조건커버리지"),
                "결함심각도별 분류":("치*주*보*경*단","치명적(Critical)결함*주요(Major)결함*보통(Normal)결함*경미한(Minor)결함*단순(Simple)결함"),
                "애플리케이션 성능측정지표":("처*응*경*자","처리량*응답시간*경과시간*자원사용률"),
                "데이터베이스 성능저하원인":("Lock*Fe*Leak*S*Co","DBLock*DBFetch*ConnectionLeak*PoolSize*Commit"),
                "애플리케이션 성능테스트 수행절차":("도*환*시*성","성능테스트도구설치*테스트환경설정*시나리오생성*성능테스트실행 및 모니터링"),
                "배드코드유형":("오*문*이*결*침","오염*문서부족*의미없는이름*높은결합도*아키텍처침식"),
                "클린코드유형":("이*주*배*함*제*오","의미있는이름*간결한주석*보기좋은배치*작은함수*읽기쉬운제어흐름*오류처리"),
                "애플리케이션 성능개선방안":("소*아*프*메*입*시*애","소스코드최적화기법적용*아키텍처조정을통한성능개선*프로그램순서조정적용*메모리사용최소화적용*입출력발생최소화적용*시스템아웃프린트를사용제외*애플리케이션성능현황관리"),
                "프로시저구성":("DE*BE*CON*S*E*T","DECLARE*BEGIN/END*CONTROL*SQL*EXCEPTION*TRANSACTION"),
                "프로시저SQL유형":("SE*IN*UP*DE","SELECT*INSERT*UPDATE*DELETE"),
                "사용자정의함수 구성":("DE*BE*CON*S*E*R","DECLARE*BEGIN/END*CONTROL*SQL*EXCEPTION*RETURN"),
                "트리거구성":("DE*E*BE*CON*S*E","DECLARE*EVENT*BEGIN/END*CONTROL*SQL*EXCEPTION"),
                "윈도우함수의 분류":("순*행*비","순위함수*행순서함수*그룹내비율함수"),
                "GRANT명령":("G*ON*TO*WI","GRANT권한*ON테이블*TO사용자*WITH옵션"),
                "REVOKE명령":("RE*ON*F*CA","REVOKE권한*ON테이블*FROM사용자*CASCADE CONSTRAINTS"),
                "SW개발보안 3대요소":("기*무*가","기밀성*무결성*가용성"),
                "SW개발보안용어":("자*위*취*위","자산*위협*취약점*위험"),
                "개인정보보호 관련법령":("개*망*신","개인정보보호법*정보통신망법*신용정보법"),
                "고유식별정보의 종류":("주*여*운*외","주민등록번호*여권번호*운전면허번호*외국인등록번호"),
                "개인정보보호법령내 정보사고":("분*도*유*변*훼","분실*도난*유출*변조*훼손"),
                "SW개발보안 방법론":("M*S*C","MS_SDL*SevenTouchpoints*CLASP"),
                "시큐어코딩가이드 적용대상":("입*보*시*에*코*캡*A","입력데이터검증 및 표현*보안기능*시간 및 상태*에러처리*코드오류*캡슐화*API오용"),
                "데이터타입유형":("불*문*열*정*부*배","불린*문자*문자열*정수*부동소수점*배열타입"),
                "연산자종류":("산*시*관*논*비*대*증","산술연산자*시프트연산자*관계연산자*논리연산자*비트연산자*대입연산자*증감연산자"),
                "추상화종류":("기*자*제","기능추상화*자료추상화*제어추상화"),
                "객체지향프로그래밍의 구성요소":("객*클*메","객체*클래스*메시지"),
                "객체구성요소":("개*속*메","개체*속성*메서드"),
                "라이브러리의 구성":("도*설*샘","도움말*설치파일*샘플코드"),
                "윈도우즈계열 운영체제특징":("G*선*자*O","GUI(그래픽 사용자 인터페이스)제공*선점형멀티캐스팅제공*자동감지기능(Plug and Play)제공*OLE사용"),
                "유닉스계열 운영체제특징":("대*다*사*이*계","대화식운영채제기능제공*다중작업기능제공*다중사용자기능제공*이식성제공*계층적트리구조파일시스템제공"),
                "메모리관리기법의 종류":("반*배*할*교","반입기법*배치기법*할당기법*교체기법"),
                "선점스케줄링 알고리즘":("S*M*M*R","SRT*MLQ*MLFQ*ROUND ROBIN"),
                "비선점스케줄링 알고리즘":("우*기*H*F*S","우선순위*기한부*HRN*FCFS*SJP"),
                "프로세스상태":("생*준*실*대*완","생성상태*준비상태*실행상태*대기상태*완료상태"),
                "프로세스상태전이":("디*타*블*웨*S","디스패치*타이머런아웃*블록*웨이크업*Swap-in/Swap-out"),
                "클라우드 컴퓨팅분류":("사*공*하","사설클라우드*공용클라우드*하이브리드클라우드"),
                "클라우드 서비스유형":("인*플*소","인프라형서비스(IaaS)*플랫폼형서비스(PaaS)*소프트웨어형서비스(SaaS)"),
                "데이터베이스 유형":("Key*Col*Do*G","Key-Value Store*Column Family Data Store*Document Store*Graph"),
                "데이터베이스 기본연산":("SE*IN*UP*DE","SELECT*INSERT*UPDATE*DELETE"),
                "반환시간 및 대기시간 계산법":("반*종*도*대*반*서","반환시간*종료시간*도착시간*대기시간*반환시간*서비스시간"),
                "트랜잭션특성":("A*C*I*D","Atomicty(원자성)*Consistency(일관성)*Isolation(격리성)*Durability(영속성)"),
                "트랜잭션상태":("활*부*완*실*철","활동*부분완료*완료*실패*철회"),
                "TCL명령어":("커*롤*체","커밋*롤백*체크포인트"),
                "프로토콜 기본요소":("구*의*타","구문*의미*타이밍"),
                "SELECT명령문":("SEL*F*WH*G*HA*O","SELECT*FROM*WHERE*GROUP BY*HAVING*ORDER BY"),
                "TCP특징":("신*연*흐*혼","신뢰성보장*연결지향적특징*흐름제어*혼잡제어"),
                "TCP헤더구조":("So*De*Se*Ac*HLE*Fl*Win*Che*Ur*Op*Pa","Source Port Number*Destination Port Number*Sequence Number*Acknowledgement Number*HLEN*Flag bit*Window size*Checksum*Urgent pointer*Options*Padding"),
                "UDP헤더구조":("So*De*Leng*Che*Da","Source Port Number*Destination Port Number*UDP Length*UDP Checksum*Data"),
                "IPv4헤더구조":("Ver*I*T*To*I*Fl*F*T*P*He*So*De*Op*Pa","Version*IHL*Type of Service*Total length*Identification*Flag*Fragment Offset*Time To Live*Protocol*Header checksum*Source address*Destination Address*Options(선택옵션)*Padding(필요시만)"),
                "NoSQL유형":("Key*Col*Do*G","Key-Value Store*Column Family Data Store*Document Store*Graph"),
                "데이터마이닝절차":("목*데*가*마*검","목적설정*데이터준비*가공*마이닝기법적용*정보검증"),
                "데이터마이닝주요기법":("분*연*연*데","분류규칙*연관규칙*연속규칙*데이터군집화"),
                "IPv6특징":("주*이*보*큐*플*애*단*실","IP주소의 확장*이동성*인증 및 보안기능*개선된Qos(큐오에스)지원*Plug&Play(플러그앤플레이)지원*Adhoc(애드훅)네트워크지원*단순헤더적용*실시간패킷추척가능"),
                "IPv6헤더구조":("Ver*T*Fl*Pa*Ne*Hop*So*De","Version*Traffic Class*Flow Label*Payload length*Next header*Hop limit*Source address*Destination address"),
                "IPv4전송방식":("유*멀*브","유니캐스트*멀티캐스트*브로드캐스트"),
                "IPv6전송방식":("유*멀*애","유니캐스트*멀티캐스트*애니캐스트"),
                "사용자중심의 모듈패키징 작업수행":("기*모*빌*사*적*변","기능식별*모듈화*빌드진행*사용자환경분석*패키징적용시험*패키징변경개선"),
                "애플리케이션패키징 릴리즈노트 작성프로세스":("모*정*개*영*정*추","모듈식별*릴리즈정보확인*릴리즈노트개요작성*영향도체크*정식릴리즈노트작성*추가개선항목식별"),
                "애플리케이션배포도구 구성요소":("암*키*식*저*파*정*크*인","암호화*키관리*식별기술*저작권표현*암호화파일생성*정책관리*크랙방지*인증"),
                "애플리케이션배포도구 배포프로세스":("빌*식*수*설*배*정","빌드내용식별*패키징도구식별*패키징수행*패키징도구설치*배포작업*정상배포확인"),
                "제품소프트웨어 설치메뉴얼 기본작성항목":("목*이*주*구","목차 및 개요*문서이력정보*설치매뉴얼주석*설치도구의구성"),
                "제품소프트웨어 설치메뉴얼 구성요소":("개*파*절*아*삭*버*고*준","제품소프트웨어개요*설치관련파일*설치절차*설치아이콘*삭제방법*설치버전및작성자*고객지원방법및FAQ*준수정보&제한보증"),
                "제품소프트웨어 설치메뉴얼 작성프로세스":("개*유*설*삭*이*최","개요 및 기능식별*UI(유아이)분류*설치/백업파일확인*삭제절차확인*이상유형확인*최종메뉴얼적용"),
                "제품소프트웨어 사용자메뉴얼 작성항목":("목*이*주*항*사*고*준","목차 및 개요*문서이력정보*사용자매뉴얼주석*기록항목*기본사항*고객지원방법 및 FAQ*준수정보&제한보증"),
                "제품소프트웨어 사용자메뉴얼 작성프로세스":("작*사*구*검","작성지침정의*사용자매뉴얼구성요소정의*구성요소별내용작성*사용자매뉴얼검토"),
                "제품소프트웨어 배포용미디어 제작하기":("선*관*설*검*정*인","배포용미디어선정*관리체계확인*설치파일-매뉴얼확인*최종배포본검증*배포용미디어정보확인*최종미디어인증확인및배포"),
                "소프트웨어 버전관리도구 유형":("공*클*분","공유폴더방식*클라이언트/서버방식*분산저장소방식")
            ]
        }
        
        numbersLabel.text = "\(appDelegate.tupleDict.count)" + "/" + "\(totalCount)"
        answersLabel.text = appDelegate.tupleDict.keys.first ?? ""
        tableView.reloadData()
        
        hideButton.isHidden = !hideButton.isHidden
        
    }
    
    @IBAction func hide(_ sender: UIButton) {
        sender.isHidden = !sender.isHidden
    }
    
    
    @objc private func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            reloadData()
        }
    }
    
    private func setUp(){
        
        numbersLabel.text = "\(appDelegate.tupleDict.count)" + "/" + "\(totalCount)"
        answersLabel.text = appDelegate.tupleDict.keys.first
        answersLabel.adjustsFontSizeToFitWidth = true
        tableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        tableView.register(UINib(nibName: SecondCell.identifier, bundle: nil), forCellReuseIdentifier: SecondCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = appDelegate.baseColor
        tableView.bounces = false
        hideButton.setTitleColor(appDelegate.highlightColor, for: .normal)
        hideButton.backgroundColor = appDelegate.baseColor
        
    }
    
    
    @IBOutlet weak var numbersLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hideButton: UIButton!
    
    
}


extension ThirdViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 20))
        view.backgroundColor = appDelegate.baseColor
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 20))
        view.backgroundColor = appDelegate.baseColor
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let str = appDelegate.tupleDict[appDelegate.tupleDict.keys.first ?? ""]?.0 else {
            return 0
        }
        return str.components(separatedBy: "*").count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let strOne = appDelegate.tupleDict[appDelegate.tupleDict.keys.first ?? ""]?.0,
              let strTwo = appDelegate.tupleDict[appDelegate.tupleDict.keys.first ?? ""]?.1 else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondCell.identifier, for: indexPath) as! SecondCell
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = appDelegate.baseColor
        cell.answersLabel.backgroundColor = appDelegate.baseColor
        
        
        if(!hideButton.isHidden){
            cell.answersLabel.textColor = appDelegate.baseColor
            isAnswersLabelTextColorChange = true
        }else{
            cell.answersLabel.textColor = appDelegate.highlightColor
            isAnswersLabelTextColorChange = false
        }
        
        let highlight = strOne.components(separatedBy: "*")[indexPath.row]
        let attributedString = NSMutableAttributedString(string: strTwo.components(separatedBy: "*")[indexPath.row])
        let text = strTwo.components(separatedBy: "*")[indexPath.row]
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: (text as NSString).range(of:highlight))
        cell.answersLabel.attributedText = attributedString
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reloadData()
    }
    
    
    
    
}



