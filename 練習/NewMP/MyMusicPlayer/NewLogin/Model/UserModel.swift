//
//  UserDataCenter.swift
//  MyMusicPlayer

import Foundation
// UserModel과 데이터파일(Plist) 중간 역할
class UsefModel
{
    
    var userModel: Users?
    
    init()
    {
        
    }
    
    func loadData()
    {
        if let url = Bundle.main.url(forResource: "UserData", withExtension: "plist")
        {
            
        }
    }
}
