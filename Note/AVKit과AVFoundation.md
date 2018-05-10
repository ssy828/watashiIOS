
###AVKit
--
-뷰를 제공하여 최신 미미디어를 쉽게 재생가능!

-재생,표준 네비게이션 컨트롤,챕터 선택 및 자막 지원 가능!

-영화를 재생할 경우 사용


###AVFoundation

######Apple 플랫폼에서 사운드 및 영상 미디어의 처리, 제어, 가져오기 및 내보내기 등 광범위한 기능을 제공하는 프레임워크
--
**주요기능**

-시간 기반 오디오 비주얼 미디어 작업에 권장되는 프레임워크

-비디오와 오디오에 관련된 API

-미디어 재생 및 편집(QuickTime 동영상 및 MPEG-4 파일 재생/생성/편집, HLS 스트림 재생: 재생가능 파일 목록)

-디바이스 카메라와 마이크를 이용한 영상 녹화 및 사운드 녹음

-시스템 사운드 제어

-문자의 음성화

 
-어플리케이션의 오디오 동작 설정: AVAudioSession

-AVAsset: 비디오 및 사운드와 같은 시각화 된 오디오 비주얼 미디어를 모델링하는 데 사용되는 추상 불변 클래스
-> 오디오,비디오,텍스트,자막 등 국한되지 않는 단일 미디어 유형의 각 트랙을 함께 표시하거나 처리가능한 하나이상의 트랙 포함 가능!

### 사운드 파일 재생: AVAudioPlayrer

######AVAudioPlayer 클래스는 파일 또는 메모리에 있는 사운드 데이터를 재생하는 기능 제공
--

**주요기능**

-파일 또는 메모리에 있는 사운드 재생(네트워크에 있는 사운드 파일은 재생 불가)

-파일 재생 시간 길이의 제한없이 사운드 재생

-여러 개 사운드 파일 동시 재생

-사운드의 재생 속도 제어 및 스테레오 위지 지정

-앞으로 감기와 뒤로 감기 등의 기능을 지원해 사운드 파일의 특정 지점 찾기

-현재 재생 정보 데이터 얻기

-사운드 반복재생 기능

--

*AVAudioPlayer 주요 프로퍼티*

	var isPlaying: Bool - 사운드가 현재 재생되고 있는지 아닌지 여부
	var volume: Float - 사운드의 볼륨값, 최소 0.0 ~ 최대 1.0
	var rate: Float - 사운드의 재생 속도
	
	var numberOfLoops: Int - 사운드 재생 반복 횟수
	기본값은 0으로 사운드 1회 재생 후 자동 종료
	양수값으로 설정시 설정값+1회 재생(ex. 1로 설정시 2회 재생 후 종료)
	음수값으로 설정시 stop 메서드가 호출 될때까지 무한 재생
	
	var dutation: TimeInterval - 사운드의 총 재생 시간(초 단위)
	
	var currentTime: TimeInterval - 사운드의 현재 재생 시각(초 단위)
	
	protocol AVAudioPlayerDelegate - 사운드 재생 완료, 재생 중단 및 디코딩 오류에 응답할 수 있는 프로토콜

--

*AVAudioPlayer 주요 메서드*

	**AVAudioPlayer 초기화 메서드**
	
	// 특정 위치에 있는 사운드 파일로 초기화 
	func init(contentOf: URL)
	
	// 메모리에 올라와있는 데이터를 이용해 초기화
	func init(data: Data)
	
	**AVAudioPlayer 재생관련 메서드**
	
	// 사운드 재생
	func play()
	
	// 특정 시점에서 사운드 재생
	func paly(atTime: TimeInterval)
	
	// 사운드 일시 정지
	func pause()
	
	// 사운드 재생 정지 
	func stop()


###### *timer클래스 정리 참고*
-- 
*혼자 공부하면서 사용한 방법*

**prepareToPlay()**:  
 버퍼를 미리로드하여 재생할 오디오 플레이어를 준비.  
-이때, play () 메서드를 호출하는 시점과 사운드 출력하는 시점 지연을 최소화함   
-stop () 메서드를 호출하거나 사운드 재생을 허용하면 설정을 취소하게 됨.

--
	ex) 액션버튼에서 실행하는 행동과 메소드 행동이 다를 경우

	 @IBAction func playOrPauseBtn(_ sender: UIButton) {
	        audioPlayer.prepareToPlay()
	        if audioPlayer.isPlaying{
	            audioPlayer.pause()
	        }else{
	            audioPlayer.play()
	        }
		
	}
	
	// 다음곡 실행버튼
	@IBAction func nextBtn(_ sender: UIButton) {
	        // 다음 곡 실행을 위해 인덱스를 더함
	        currentIndex += 1
	        // 음악플레이 메소드
	        musicPlay()
	    }
	 
	    // MARK: 음악플레이 메소드
	    // 버튼사용시 음악파일 데이터를 가져와야하므로 -> 함수필요
	    func musicPlay() {
	        let baseURL = musicModel.albumInfo[currentIndex]
	        // 번들에 담긴 음악주소를 가져와서 실행
	        if let url =  Bundle.main.url(forResource: "Music/\(baseURL.songURL)", withExtension: "mp3"){
	            do{ // AVAudioPlayer는 throws 사용하므로
	                audioPlayer = try AVAudioPlayer(contentsOf: url)
	                if audioPlayer.isPlaying == false{ 
	                // 음악실행 중아니면 -> 음악실행
	                    audioPlayer.play()
	                }else{// 음악실행 중이면 -> 음악멈춤
	                    audioPlayer.pause()
	                }
	            }catch let error{
	                print(error.localizedDescription)
	            }
	        }
	    }
	}
	
--
참고 문헌 - 애플 문서 / 참고 링크 - [http://www.edwith.org/boostcourse-ios/lecture/16846/]()
