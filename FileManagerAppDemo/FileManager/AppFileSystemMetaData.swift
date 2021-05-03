//
//  AppFileSystemMetaData.swift
//  FileManagerAppDemo
//
//  Created by Debarshee on 5/3/21.
//

import Foundation

protocol AppFileSystemMetaData
{
    func list(directory at: URL) -> Bool
    
    func attributes(ofFile atFullPath: URL) -> [FileAttributeKey : Any]
}
 
extension AppFileSystemMetaData
{
    func list(directory at: URL) -> Bool
    {
        let listing = try! FileManager.default.contentsOfDirectory(atPath: at.path)
        
        if listing.count > 0
        {
            print("LISTING: \(at.path)")
            print("")
            for file in listing
            {
                print("File: \(file.debugDescription)")
            }
            print("")
            
            return true
        }
        else
        {
            return false
        }
    }
    
    func attributes(ofFile atFullPath: URL) -> [FileAttributeKey : Any]
    {
        return try! FileManager.default.attributesOfItem(atPath: atFullPath.path)
    }
}
