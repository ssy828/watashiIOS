##Codable

	struct PostModel:Codable {
	    var title:String
	    var content:String
	    var imgCoverUrl:String?
	    var image:UIImage?
	    
	    
	    var param:[String:String]
	    {
	        return ["title":title,"content":content]
	    }
	    
	//    //decoding
	    enum CodingKeys: String, CodingKey {
	        case title = "title"
	        case content = "content"
	        case imgCoverUrl  = "img_cover"
	        
	    }
	    
	    init(from decoder: Decoder) throws {
	        let container = try decoder.container(keyedBy: CodingKeys.self)
	        title = try container.decode(String.self, forKey: .title)
	        content = try container.decode(String.self, forKey: .content)
	        imgCoverUrl = try container.decode(String.self, forKey: .imgCoverUrl)
	    }
	    
	//
	//    //encoding
	    func encode(to encoder: Encoder) throws
	    {
	        var container = encoder.container(keyedBy: CodingKeys.self)
	        try container.encode(title, forKey: .title)
	        try container.encode(content, forKey: .content)
	    }
	}




