import Cocoa
import Foundation
import CoreGraphics

/*
About:
  Keep mouse out of upper taskbar region so Windows App doesn't go drop of out of fullscreen mode.
  This could be customized to keep the mouse out of any area.
Usage: 
  swift fullscreen.swift[
*/
class AppDelegate: NSObject, NSApplicationDelegate {
  override init() {
    signal(SIGINT, { _ in
    print("Received SIGINT, exiting gracefully...")
    exit(0)
    })
  }

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    NSEvent.addGlobalMonitorForEvents(matching: [.mouseMoved]) { event in
      let mouseLocation = event.locationInWindow
       let screenFrame = NSScreen.main?.frame ?? .zero
       let screenHeight = screenFrame.height
       let loc = CGPoint(x: mouseLocation.x + screenFrame.origin.x, y: screenHeight - mouseLocation.y - screenFrame.origin.y)
       let x = round(loc.x)
       let y = round(loc.y)
       if(y < 40) { 
         self.moveMouseTo(x: x, y: 40)
       } 
       print("\(x),\(y)")
    }
  }

  func moveMouseTo(x: CGFloat, y: CGFloat) {
    let event = CGEvent(mouseEventSource: nil, mouseType: CGEventType.mouseMoved, mouseCursorPosition: CGPoint(x: x, y: y), mouseButton: .left)
    event?.post(tap: CGEventTapLocation.cghidEventTap)
  }
}

let app = NSApplication.shared
app.delegate = AppDelegate()
app.run()
