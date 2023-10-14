//
//  SideMenuViewModel.swift
//  TwitterClone
//
//  Created by AMAR on 12/10/23.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case list
    case bookmarks
    case logout
    
    var title: String {
        switch self{
        case .profile: return "Profile"
        case .list: return "Lists"
        case .bookmarks: return "Bookmarks"
        case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self{
        case .profile: return "person"
        case .list: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
        }
    }
}
