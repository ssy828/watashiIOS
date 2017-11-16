##IOS Network

-URLRequest인스턴스 생성

	      var request = URLRequest(url: URL(string: "http:")!)
	        request.httpMethod = "GET"
	        request.addValue("Token 173b78e9e0a0553f45fee10f2abf459a118a29a3", forHTTPHeaderField: "Authorization")
	       
--

-URLSessionTask생성
        
        let session = URLSession.shared
        session.dataTask(with: request) { (Data?, URLResponse?, Error?) in
            code 작성 부분
        }.resume()
        
 
--

        var request = URLRequest(url: URL(string: "http:")!)
        request.httpMethod = "GET"
        request.addValue("Token 173b78e9e0a0553f45fee10f2abf459a118a29a3", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, respose, error) in
            code 작성 부분
        }.resume()
   
-- 
-data: 서버에서 반환되는 데이터

-response: HTTPS헤더 및 상태코드와 같은 응답, 메타데이터 제공 
HTTP/HTTPS -> HTTP/HTTPS 객체 반환!

-error: 요청이 실패한 이유나 요청이 성공적이었는지 여부를 나타내는 오류