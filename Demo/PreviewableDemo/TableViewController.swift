//
//  TableViewController.swift
//  PreviewableDemo
//

import UIKit
import SwiftUI
import Previewable

class TableViewController: UITableViewController {
    init() {
        super.init(style: .insetGrouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
    }
}

class TableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textLabel?.text = "Hello world"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct Previews: PreviewProvider {
    static var previews: some View {
        Self.preview(TableViewCell())
            .previewLayout(.fixed(width: 320, height: 80))
        Self.preview(TableViewController())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
