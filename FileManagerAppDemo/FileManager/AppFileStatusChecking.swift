//
//  AppFileStatusChecking.swift
//  FileManagerAppDemo
//
//  Created by Debarshee on 5/3/21.
//

import Foundation

protocol AppFileStatusChecking
{
    func isWritable(file at: URL) -> Bool
    
    func isReadable(file at: URL) -> Bool
    
    func exists(file at: URL) -> Bool
}
 
extension AppFileStatusChecking
{
    func isWritable(file at: URL) -> Bool
    {
        if FileManager.default.isWritableFile(atPath: at.path)
        {
            print(at.path)
            return true
        }
        else
        {
            print(at.path)
            return false
        }
    }
    
    func isReadable(file at: URL) -> Bool
    {
        if FileManager.default.isReadableFile(atPath: at.path)
        {
            print(at.path)
            return true
        }
        else
        {
            print(at.path)
            return false
        }
    }
    
    func exists(file at: URL) -> Bool
    {
        if FileManager.default.fileExists(atPath: at.path)
        {
            return true
        }
        else
        {
            return false
        }
    }
}
