//
//  mikmok_ban_meme.swift
//
//  Created by Kyle on 2025/01/20
//  MIT License

import AppKit

let alert = NSAlert()
alert.messageText = "Sorry, your Mac isn't available right now."
alert.informativeText = #"""
A law banning your Mac has been enacted in the U.S. Unfortunately, that means you can't use Mac for now.

We are fortunate that President Trump has indicated that he work with us on a solution to reinstate your Mac once he takes office. Please stay tuned!
"""#

alert.alertStyle = .critical
let shutdownButton = alert.addButton(withTitle: "Shutdown")
if #available(macOS 11, *) {
    shutdownButton.hasDestructiveAction = true
}
let _ = alert.addButton(withTitle: "Learn more")

let result = alert.runModal()

switch result {
case .alertFirstButtonReturn: // Shutdown button
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/sbin/shutdown")
    process.arguments = ["-h", "now"]
    try process.run()
case .alertSecondButtonReturn: // Learn more button
    if let url = URL(string: "https://github.com/Kyle-Ye/mikmok_ban_meme") {
        NSWorkspace.shared.open(url)
    }
default:
    break
}
