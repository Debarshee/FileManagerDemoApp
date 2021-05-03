//
//  FileHandler.swift
//  FileManagerAppDemo
//
//  Created by Debarshee on 5/3/21.
//

import Foundation

struct FileHandler : AppFileManipulation, AppFileStatusChecking, AppFileSystemMetaData
{
    
    let fileName: String
    
    init(fileName: String)
    {
        self.fileName = fileName
    }
    
    // MARK: - Write Files
    func writeToDocuments(string: String, filename: String) -> Bool {
        writeFile(containing: string, to: .Documents, withName: filename)
    }
    
    func writeToLibrary(string: String, filename: String) -> Bool {
        writeFile(containing: string, to: .Library, withName: filename)
    }
    
    func writeToTemp(string: String, filename: String) -> Bool {
        writeFile(containing: string, to: .Temp, withName: filename)
    }
    
    // MARK: - Move Files
    func moveFromLibraryToDocuments() {
            _ = moveFile(withName: fileName, inDirectory: .Library, toDirectory: .Documents)
    }
    
    func moveFromDocumentsToLibrary() {
        _ = moveFile(withName: fileName, inDirectory: .Documents, toDirectory: .Library)
    }
    
    // MARK: - Delete Files
    func deleteTempFile() {
        _ = deleteFile(at: .Temp, withName: fileName)
    }
    
    func deleteDocumentsFile() {
        _ = deleteFile(at: .Documents, withName: fileName)
    }
    
    func deleteLibraryFile() {
        _ = deleteFile(at: .Library, withName: fileName)
    }
    
    // MARK: - Listing
    func listInDocuments() -> Bool {
        list(directory: getURL(for: .Documents))
    }
    
    // MARK: - Read
    
    func DocumentsFile(filename: String) -> String{
        readFile(at: .Documents, withName: filename)
    }
    
    func changeFileExtension(withName name: String, inDirectory: AppDirectories, toNewExtension newExtension: String) -> Bool
        {
            var newFileName = NSString(string:name)
            newFileName = newFileName.deletingPathExtension as NSString
            newFileName = (newFileName.appendingPathExtension(newExtension) as NSString?)!
            let finalFileName:String =  String(newFileName)
            
            let originURL = buildFullPath(forFileName: name, inDirectory: inDirectory)
            let destinationURL = buildFullPath(forFileName: finalFileName, inDirectory: inDirectory)
            
            try! FileManager.default.moveItem(at: originURL, to: destinationURL)
            
            return true
        }
 
}
