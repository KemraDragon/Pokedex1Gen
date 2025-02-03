//
//  LocationViewController.swift
//  Pokedex1Gen
//
//  Created by Kevin on 03-02-25.
//

import UIKit

class LocationViewController: UIViewController {
    private let tableView = UITableView()
    private let encounterAreas: [EncounterArea]

    init(encounterAreas: [EncounterArea]) {
        self.encounterAreas = encounterAreas
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.reloadData()
    }

    private func setupUI() {
        title = "Localizaciones"
        view.backgroundColor = .white
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
}

extension LocationViewController: UITableViewDelegate, UITableViewDataSource {
    // KEVIN, TENIAS LAS FUNCIONES COMO tableView( tableView...., TE LAS DEJE DE LA MANERA CORRECTA
    // SI TE TIRA ERROR ES QUE ES ALGO DE LAS VERSIONES DE XCODE, EN ESE CASO DESHACE MIS CAMBIOS ACA
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return encounterAreas.count
    }

    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = encounterAreas[indexPath.row].locationArea.name.capitalized
        return cell
    }
}
