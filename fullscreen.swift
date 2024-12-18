import Cocoa
import Foundation
import CoreGraphics

/*
Keep mouse out of upper taskbar region in Windows App so it doesn't drop of out of fullscreen mode.
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
       let workspace = NSWorkspace.shared
       let activeApp = workspace.frontmostApplication
       if(activeApp?.localizedName == "Windows App") {
         let mouseLocation = event.locationInWindow
         let screenFrame = NSScreen.main?.frame ?? .zero
         let screenHeight = screenFrame.height
         let loc = CGPoint(x: mouseLocation.x + screenFrame.origin.x, y: screenHeight - mouseLocation.y - screenFrame.origin.y)
         let x = round(loc.x)
         let y = round(loc.y)
         if(y < 60) { 
           print("Windows App \(x),\(y)")
           let event = CGEvent(mouseEventSource: nil, 
				mouseType: CGEventType.mouseMoved, 
				mouseCursorPosition: CGPoint(x: x, y: 65), // push mouse back down 
				mouseButton: .left)
           event?.post(tap: CGEventTapLocation.cghidEventTap)
         } 
       }
    }
  }
}

let app = NSApplication.shared
app.delegate = AppDelegate()
app.run()
