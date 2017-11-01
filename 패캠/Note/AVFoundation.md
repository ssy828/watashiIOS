##음악재생코드!
	 // 같은 클래스 안에서 
 
    lazy var dataManger:MusicDataManager = MusicDataManager()
    var currentIndex = 0{
        willSet{
            let selectedData = dataManger.songDatas[newValue]
            self.titleLb.text = selectedData.title
            self.artistLb.text = selectedData.artistName
        }
    }
____


    @IBAction func playBtn(_ sender: Any) {
    
    
        let seletedData = dataManger.songDatas[currentIndex]
        
        if let urlPath = Bundle.main.url(forResource: "Song/\(seletedData.songUrl)", withExtension: "mp3")
        {
            let asset = AVAsset(url: urlPath)
            let playItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: nil)
            player = AVPlayer(playerItem: playItem)
            player?.play()
        }
        
    }    
       
    var player:AVPlayer?

    
    @IBAction func nextSongAction(_ sender: UIButton) {
        // 수정해야함!!
        let seletedData = dataManger.songDatas[currentIndex]
        
        currentIndex += 1
        if let urlPath = Bundle.main.url(forResource: "Song/\(seletedData.songUrl)", withExtension: "mp3")
        {
            let asset = AVAsset(url: urlPath)
            let playItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: nil)
           
	//   player = AVPlayer(playerItem: playItem)
        player?.replaceCurrentItem(with: playItem)
            
        }
    }
    
    @IBAction func prevSongAction(_ sender: UIButton) {
        let seletedData = dataManger.songDatas[currentIndex]
        
        currentIndex -= 1
        if let urlPath = Bundle.main.url(forResource: "Song/\(seletedData.songUrl)", withExtension: "mp3")
        {
            let asset = AVAsset(url: urlPath)
            let playItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: nil)
            
            //            player = AVPlayer(playerItem: playItem)
            player?.replaceCurrentItem(with: playItem)
            
        }
    }
   
- 중복되는 코드 정리할 것!