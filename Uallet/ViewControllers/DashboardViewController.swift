//
//  DashboardViewController.swift
//  Uallet
//
//  Created by Estefania Sassone on 05/07/2022.
//

import UIKit
import PromiseKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var lblBalance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WalletsStorage.shared.addDataChanged {
            self.updateBalance()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {

        updateBalance()
    }
    
    func updateBalance() {
        self.lblBalance.text = "⌛️"
        firstly {
            when(fulfilled:
                    APIRatePromises.bitcoinRatePromises(),
                 APIRatePromises.dolarBlueRatePromises(),
                 WalletsStorage.shared.walletsPromise()
            )
        }
        .done { (rateBitcoin, rateDolarBlue, wallets) in
            var suma: Double = 0
            for wallet in wallets {
                switch wallet.currency {
                case .Peso:
                    suma += wallet.balance / rateDolarBlue.buy
                case .Dollar:
                    suma += wallet.balance
                case .Bitcoin:
                    suma += wallet.balance * rateBitcoin
                }
            }
            self.lblBalance.text = "USD$ \(Int(suma))"
            
            
        }
        .catch { error in
            self.lblBalance.text = "Error"
        }
    }

}
