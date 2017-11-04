![image](/Users/songyeeshin/Desktop/AVFoundation.png)

###AVKit
--
-뷰를 제공하여 최신 미미디어를 쉽게 재생가능!

-재생,표준 네비게이션 컨트롤,챕터 선택 및 자막 지원 가능!

-영화를 재생할 경우 사용


###AVFoundation
--
-시간 기반 오디오 비주얼 미디어 작업에 권장되는 프레임워크

-비디오와 오디오에 관련된 API

 
-어플리케이션의 오디오 동작 설정: AVAudioSession

-AVAsset: 비디오 및 사운드와 같은 시각화 된 오디오 비주얼 미디어를 모델링하는 데 사용되는 추상 불변 클래스
->  오디오,비디오,텍스트,자막 등 국한되지 않는 단일 미디어 유형의 각 트랙을 함께 표시하거나 처리가능한 하나이상의 트랙 포함 가능!

### 사운드 파일 재생: AVAudioPlayrer
--
-**prepareToPlay() 메서드** :  
 버퍼를 미리로드하여 재생할 오디오 플레이어를 준비.  
-이때, play () 메서드를 호출하는 시점과 사운드 출력하는 시점 지연을 최소화함   
-stop () 메서드를 호출하거나 사운드 재생을 허용하면 설정을 취소하게 됨.

--
ex) 액션버튼에서 실행하는 행동과 메소드 행동이 다를 경우

	 @IBAction func playOrPauseBtn(_ sender: UIButton) {
	        audioPlayer.prepareToPlay()
	        if audioPlayer.isPlaying
	        {
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
	    func musicPlay()
	    {
	        let baseURL = musicModel.albumInfo[currentIndex]
	        // 번들에 담긴 음악주소를 가져와서 실행
	        if let url =  Bundle.main.url(forResource: "Music/\(baseURL.songURL)", withExtension: "mp3")
	        {
	            do{ // AVAudioPlayer는 throws 사용하므로
	                audioPlayer = try AVAudioPlayer(contentsOf: url)
	                if audioPlayer.isPlaying == false
	                { // 음악실행 중아니면 -> 음악실행
	                    audioPlayer.play()
	                }else
	                {// 음악실행 중이면 -> 음악멈춤
	                    audioPlayer.pause()
	                }
	            }catch let error{
	                print(error.localizedDescription)
	            }
	        }
	    }
	}



### -오디오 녹음: AVAudioRecorder 


