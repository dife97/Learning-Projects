
struct SwiftBank {
    private let password: String
    private var balance: Double = 0 {
        didSet {
            if balance < 100 {
                displayLowBalanceMessage()
            }
        }
    }
    
    static let depositBonusRate: Double = 0.01
    
    init(password: String, initialDeposit: Double) {
        self.password = password
        makeDeposit(ofAmount: initialDeposit)
    }
}

//MARK: - Securing SwiftBank

extension SwiftBank {
    private func isValid(_ enteredPassword: String) -> Bool {
        if enteredPassword == password {
            return true
        } else {
            return false
        }
    }
}

//MARK: - Enabling Deposits

extension SwiftBank {
    mutating func makeDeposit(ofAmount depositAmount: Double) {
        let depositWithBonus = finalDepositWithBonus(fromInitialDeposit: depositAmount)
        print("Making a deposit of $\(depositAmount) with a bonus rate. The final amount deposited is $\(depositWithBonus).")
        balance += depositWithBonus
    }
    
    private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
        return deposit + (deposit * SwiftBank.depositBonusRate)
    }
}

//MARK: - Checking the Balance and Making Withdrawals

extension SwiftBank {
    
    func displayBalance(password: String) {
        if isValid(password) {
            print("Your current balance is $\(balance)")
        } else {
            print("Error: Invalid password. Cannot retrieve balance.")
            return
        }
    }
    
    mutating func makeWithdrawal(ofAmount withdrawalAmount: Double, usingPassword password: String) {
        if isValid(password) {
            balance -= withdrawalAmount
            print("Making a $\(withdrawalAmount) withdrawal")
        } else {
            print("Error: Invalid password. Cannot retrieve balance.")
            return
        }
    }
    
    private func displayLowBalanceMessage() {
        print("Alert: Your balance is under $100")
    }
}

//MARK: - testing SwiftBank
var myAccount = SwiftBank(password: "senha", initialDeposit: 500)
myAccount.makeDeposit(ofAmount: 50)
myAccount.makeWithdrawal(ofAmount: 100, usingPassword: "senhaErrada")
myAccount.displayBalance(password: "senha")
