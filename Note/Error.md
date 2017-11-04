
## Error
// 에러처리구문예제
##
     1. Error프로토콜 채택: ErrorType 만들기
         -> Enum을 활용해서
     2. 에러 전달 메소드 만들기
         -> Return type앞에 throws 키워드 작성
     3. 에러상황일때 에러 발생
         1) throw 키워드를 사용 에러 반환
         2) do~catch를 통한 에러처리
         3) Converting to Optional Value
 
##

### Error 프로토콜 채택
    enum NumberCheckType: Error {
        case negativeNumber
        case biggerNum
        case nonNum
        case noData
    }
 
### 에러 전달 메소드 만들기
  
 
	func isSmallNum(baseNum: Int, 
  					targetNum:Int?)throws-> Int
   	  {
        guard let compareNum = targetNum else{
            throw NumberCheckType.noData
        }
        if baseNum < 0 || compareNum < 0
        {
            throw NumberCheckType.negativeNumber
        }
        
        if compareNum > baseNum
        {
            throw NumberCheckType.biggerNum
        }
        
        return compareNum
     }    

### do~catch

    do {
          let result = try isSmallNum(baseNum: 5,
            						 targetNum: -3)
            print(result)
        } catch NumberCheckType.noData {
            print("taget에 값을 넣어주세요")
        } catch NumberCheckType.negativeNumber{
            print("양수 입력 부탁")
        } catch NumberCheckType.biggerNum{
            print("타켓 숫자를 더 적게 입력")
        }catch{ // 꼭 마지막 catch문은 써줄 것!!
            print("다른 에러가 있을까?")
        }
       
            
### Converting to Optional Value

	// try -> 옵셔널로 바꾼 것 : 옵셔널체이닝과 다름
	let num = try? isSmallNum(baseNum: 5, targetNum: 10)
	// try! 일경우: nil이면 크러쉬!
  
         
### 에러처리구문예제

	class ErrorViewController: UIViewController {
   
	    enum NumberCheckType: Error {
	        case negativeNumber
	        case biggerNum
	        case nonNum
	        case noData
	    }
    
    func isSmallNum(baseNum: Int, 
    					targetNum:Int?) throws-> Int
    {
        guard let compareNum = targetNum else{
            throw NumberCheckType.noData
        }
        if baseNum < 0 || compareNum < 0
        {
            throw NumberCheckType.negativeNumber
        }
        
        if compareNum > baseNum
        {
            throw NumberCheckType.biggerNum
        }
        
        return compareNum
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // try -> 옵셔널로 바꾼 것 : 옵셔널체이닝과 다름
        let num = try? isSmallNum(baseNum: 5,
        								targetNum: 10)
        
        // 일반 try : do~catch문 사용
        do {
            let result = try isSmallNum(baseNum: 5,
            						 targetNum: -3)
            print(result)
        } catch NumberCheckType.noData {
            print("taget에 값을 넣어주세요")
        } catch NumberCheckType.negativeNumber{
            print("양수 입력 부탁")
        } catch NumberCheckType.biggerNum{
            print("타켓 숫자를 더 적게 입력")
        }catch{ // 꼭 마지막 catch문은 써줄 것!!
            print("다른 에러가 있을까?")
        }     
      }
	}
		
		
		


	 

