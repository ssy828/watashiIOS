//
//  User.swift
//  MyMusicPlayer

import Foundation
// MARK: 사용자 한사람 정보
struct User
{
    let userName: String
    let email: String
    let pwd: String
    
    // 값이 없을 경우: nil을 반환
    // Item이 딕셔너리로 되어 있고 키랑 값이 String으로 되어있음
    init?(dataDic: [String: String])
    {
        guard let name = dataDic["username"]  else { return nil }
        self.userName = name
        guard let email = dataDic["email"] else { return nil }
        self.email = email
        guard let pwd = dataDic["password"] else { return nil }
        self.pwd = pwd
    }
}

// MARK: 전체 사용자 모델담을 곳
struct Users
{
    var users: [User] = []// 여러개의 유저들을 담을 곳
    
    // 배열 안에 딕셔너리가 들어있음
    init(dic: [String: Any])
    {
        // item 키 통해 값을 배열안에 딕셔너리를 갖는 users에 할당
        guard let users = dic["item"] as? [[String: String]] else { return }
        
        for user in users
        {
            if let userS = User(dataDic: user)
            {
                self.users.append(userS)
            }
        }
        
    }
}
