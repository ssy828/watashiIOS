//
// 버튼 클릭시 여러개 동시에 클릭 되는 것!
// 2017.10.09

import UIKit

class ViewController: UIViewController {
    // 배열에 넣어서 사용: 태그(구부하는 용도)만을 가지고는 하나씩 해줘야하는 한계가 있음.
    // 태그만으로 자리 위치를 0,0 / 0,1 / 이런식으로 표현하기엔 힘듦
    var btnArr: [UIButton] = [] // 빈배열 필요
    // 빈배열에 추가하면서 사용
    // 변수 btnArr에 UIButton클래스의 요소를 배열에 담아서 할당
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createBtn()
        setFrameOfBtn()
    }

    // MARK: -버튼 생성 함수
    // 버튼만 생성하므로 반환값도 파라미터도 필요 없음!
    func createBtn()
    {
        // 배열의 경우 9개버튼을 인덱스값 0~8
        for index in 0...8
        {   // .system: 자유롭게 스타일 바꿀 수 있음
            let btn: UIButton = UIButton(type: UIButtonType.system)
            btn.tag = index
            btnArr.append(btn)
            btn.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            btn.layer.cornerRadius = 20 // 버튼을 둥글게!
            btn.layer.borderColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
            btn.layer.borderWidth = 2
//            btn.setTitle("\(btn.tag)", for: UIControlState.selected)
            view.addSubview(btn)
            btn.addTarget(self, action: #selector(clickBtn(_:)), for: UIControlEvents.touchUpInside)
        }
    }
    
    // MARK: -버튼 9개칸에 넣기
    // 반환값없음 : 그냥 9개 칸에 버튼을 세팅.
    func setFrameOfBtn()
    {
        let btnWidth = view.frame.size.width/3// 전체 버튼가로크기
        let btnHeight  = (view.frame.size.height/2)/3 // 전체 버튼 세로크기
       // 버튼배열에 담은 것을 빼내서 배열에 따라서 칸에 버튼 집어넣기
        for btn in btnArr
        {
            let index = btn.tag
            let line = index%3 // 행: x좌표 : 나머지가 0,1,2일 경우에 따라
            let col = index/3  // 열: y좌표
            
            btn.frame = CGRect(x: CGFloat(line)*btnWidth, y: CGFloat(col)*btnHeight, width: btnWidth, height: btnHeight)
            
        }
        
    }

    // MARK: -addTarget할때 실행 될 함수
    // 색을 여기서 바꿀 거임
    @objc func clickBtn(_ sender: UIButton){
        let index: Int = sender.tag // tag가 Int형이므로!
        let isEvenNum = isEvenNumber(num: index)
        // 위의 isEvenNum의 값(true/false)
        // 짝수면 true 홀수면 false
        // 위의 버튼을 눌렀을때 실행시키는 것!
        
        // 기능마다 분리해서 만들기!!
        for btn in btnArr
        { // 13579 / 2468 태그일 경우 실행 색깔이 바뀜
          // 여기서 반복적으로 배열에 있는 모든 수를 비교해서 실행
            let subBtn = isEvenNumber(num: btn.tag)
            
            if isEvenNum == subBtn
            {// 누른 버튼 태그의 값(true/false)과
            //반복문에서 일어나는 subBtn의 값(true/false)이 같으면 보라색으로!
                btn.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            }else{
                // 다른 경우 노란색
                btn.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            }
            
        }
        
//        // btn이 배열에 들어가 있어서 배열 인덱스로 꺼내기
//        switch isSimultaneousNum {
//        case 1,3,5,7:
//            sender.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
//        default:
//            sender.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//        }
//
        // 버튼클릭시 색깔 바뀌게 하는 것
//        if sender.isSelected {
//            sender.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
//            sender.isSelected = false
//        }else{
//            sender.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//            sender.isSelected = true
//        }
    }
    
    // 짝수 태그일 경우: 불값으로 반환
    func isEvenNumber(num: Int) -> Bool {
        if num % 2 == 0
        {
            return true
        }
        return false
    }

}

