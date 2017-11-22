//
//  dragView.swift
//  PushImage
//
//  Created by 施宏政 on 2017/11/22.
//  Copyright © 2017年 施宏政. All rights reserved.
//

import Cocoa

class DragView: NSView {
    private var fileTypeIsOk = false
    private var acceptedFileExtensions = ["jpg"]
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        register(forDraggedTypes: [NSFilenamesPboardType])
    }
    //2
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        fileTypeIsOk = checkExtension(drag: sender)
        return []
    }
    //3
    override func draggingUpdated(_ sender: NSDraggingInfo) -> NSDragOperation {
        return fileTypeIsOk ? .copy : []
    }
    
    //4
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        guard let draggedFileURL = sender.draggedFileURL else {
            return false
        }
        
        return true
    }
    //5
    fileprivate func checkExtension(drag: NSDraggingInfo) -> Bool {
        guard let fileExtension = drag.draggedFileURL?.pathExtension?.lowercased() else {
            return false
        }
        
        return acceptedFileExtensions.contains(fileExtension)
    }
}
//6
extension NSDraggingInfo {
    var draggedFileURL: NSURL? {
        let filenames = draggingPasteboard().propertyList(forType: NSFilenamesPboardType) as? [String]
        let path = filenames?.first
        
        return path.map(NSURL.init)
    }
}
