//
//  UserInfoManager.swift
//  watashiMemory
//

import Foundation
import UIKit

// MARK: UserDefaults 객체에 데이터를 저장할 때 사용될 키값
struct UserInfoKey {
    // 저장에 사용할 키
    static let loginId = "LoginID" // 왜 static?
    static let account = "Account"
    static let name = "Name"
    static let profile = "Profile"
    
}

// 전체적으로 사용할 유저디폴트 상수로 지정
let ud = UserDefaults.standard

// MARK: 계정 정보를 저장 관리하는 클래스
class UserInfoManager {
    // 로그인 아이디 :연산 프로퍼티
    // get: 프로퍼티 리스트에 저장된 로그인 아이디를 꺼내어 제공
    // set: loginId프로퍼티에 할당된 값을 프로퍼티 리스트에 저장
    var loginId: Int {
        get{
            return ud.integer(forKey: UserInfoKey.loginId)
        }
        set{
            ud.set(newValue, forKey: UserInfoKey.loginId)
            ud.synchronize() // 동기화처리: 기본 저장소와 메모리 간 서로 데이터 일치시킴
        }
    }
    // 계정
    // 로그인 하지 않았을 경우 nil로 설정하기위해
    var account: String? {
        get{
            return ud.string(forKey: UserInfoKey.account)
        }
        set{
            ud.set(newValue, forKey: UserInfoKey.account)
            ud.synchronize()
        }
    }
    
    // 이름
    var name: String? {
        get{
            return ud.string(forKey: UserInfoKey.name)
        }
        set{
            ud.set(newValue, forKey: UserInfoKey.name)
            ud.synchronize()
        }
    }
    
    // 프로파일
    var profile: UIImage? {
        get{
            if let profile = ud.data(forKey: UserInfoKey.profile)
            {
                return UIImage(data: profile)
            }else{
                return UIImage(named: "account.jpg")
                // 이미지가 없다면 기본 이미지
            }
        }
        
        set{
            if newValue != nil{
                ud.set(UIImagePNGRepresentation(newValue!), forKey: UserInfoKey.profile)
                ud.synchronize()
            }
        }
    }
    
    // 로그인 판별
    var isLogin: Bool {
        // 로그인 아이디가 0 or 빈 계정
        if self.loginId == 0 || self.account == nil{
            return false
        }else{
            return true
        }
    }
    
    // 로그인 메소드
    // 이 곳은 나중에 서버와 연동 코드로 대체
    func login(account: String, pwd: String) -> Bool {
        if account.isEqual("abc@naver.com") && pwd.isEqual("1234"){
            ud.set(100, forKey: UserInfoKey.loginId)
            ud.set(account, forKey: UserInfoKey.account)
            ud.set("쏭", forKey: UserInfoKey.name)
            ud.synchronize()
            return true
        }else{
            return false
        }
    }
    
    // 로그아웃 메소드 
    func logout() -> Bool {
        ud.removeObject(forKey: UserInfoKey.loginId)
        ud.removeObject(forKey: UserInfoKey.account)
        ud.removeObject(forKey: UserInfoKey.name)
        ud.removeObject(forKey: UserInfoKey.profile)
        return true
    }
    
}

