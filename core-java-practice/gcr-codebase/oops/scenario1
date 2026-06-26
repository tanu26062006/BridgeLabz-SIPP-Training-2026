/**
 * BankAccount.java
 *
 * Day 10 - OOP with Java
 * Concepts: Class, Object, Constructor, this keyword,
 *           static vs instance fields, access modifiers
 *
 * This class represents a bank account with basic banking operations.
 * It demonstrates:
 *   - Private instance fields (encapsulation)
 *   - Static fields shared across all objects
 *   - Constructor with 'this' keyword
 *   - Public methods for deposit, withdraw, statement
 *   - Access modifiers: private, public, static
 */
public class BankAccount {

    /*
     * Static fields — belong to the class, not to any single object.
     * Shared across all BankAccount instances.
     * totalAccounts  : tracks how many accounts have been created
     * nextAccountNumber : auto-increments for each new account
     */
    private static int totalAccounts     = 0;
    private static int nextAccountNumber = 1001;

    /*
     * Instance fields — each object has its own copy.
     * accountNumber  : unique ID assigned at creation
     * holder         : name of the account owner
     * balance        : current balance (can change over time)
     * transactionLog : array storing history of all transactions
     * logCount       : tracks how many log entries exist
     */
    private int      accountNumber;
    private String   holder;
    private double   balance;
    private String[] transactionLog;
    private int      logCount;

    /**
     * Constructor — BankAccount(String holder, double initialDeposit)
     *
     * Called when a new account is created.
     * Uses 'this' keyword to distinguish instance fields from parameters.
     * Auto-assigns a unique account number and increments the static counter.
     *
     * @param holder         Name of the account holder
     * @param initialDeposit Opening balance amount
     */
    public BankAccount(String holder, double initialDeposit) {
        this.accountNumber  = nextAccountNumber++;  // auto-assign and increment
        this.holder         = holder;
        this.balance        = initialDeposit;
        this.transactionLog = new String[20];
        this.logCount       = 0;
        totalAccounts++;                             // update class-level counter
        log("Account opened with Rs." + initialDeposit);
    }

    /**
     * deposit(double amount)
     *
     * Adds the given amount to the current balance.
     * Validates that the amount is positive before processing.
     * Logs the transaction with updated balance.
     *
     * @param amount The amount to deposit (must be > 0)
     */
    public void deposit(double amount) {
        if (amount <= 0) {
            System.out.println("  [ERROR] Invalid deposit amount: " + amount);
            return;
        }
        balance += amount;
        log("Deposited    Rs." + String.format("%.2f", amount)
                + "  | Balance: Rs." + String.format("%.2f", balance));
        System.out.println("  Deposited Rs." + amount
                + " into " + holder + "'s account.");
    }

    /**
     * withdraw(double amount)
     *
     * Deducts the given amount from the current balance.
     * Validates the amount is positive and sufficient balance exists.
     * Blocks the withdrawal and logs it if it would cause an overdraft.
     *
     * @param amount The amount to withdraw (must be > 0 and <= balance)
     */
    public void withdraw(double amount) {
        if (amount <= 0) {
            System.out.println("  [ERROR] Invalid withdrawal amount: " + amount);
            return;
        }
        if (amount > balance) {
            System.out.println("  [BLOCKED] Overdraft attempt of Rs." + amount
                    + " | Available: Rs." + String.format("%.2f", balance));
            log("OVERDRAFT BLOCKED Rs." + String.format("%.2f", amount)
                    + " | Balance unchanged: Rs." + String.format("%.2f", balance));
            return;
        }
        balance -= amount;
        log("Withdrawn    Rs." + String.format("%.2f", amount)
                + "  | Balance: Rs." + String.format("%.2f", balance));
        System.out.println("  Withdrawn Rs." + amount
                + " from " + holder + "'s account.");
    }

    /**
     * getStatement()
     *
     * Prints a formatted account statement to the console.
     * Displays account number, holder name, current balance,
     * and the full transaction history.
     */
    public void getStatement() {
        System.out.println("\n  ============================================");
        System.out.println("              ACCOUNT STATEMENT               ");
        System.out.println("  ============================================");
        System.out.println("  Account No  : " + accountNumber);
        System.out.println("  Holder      : " + holder);
        System.out.printf ("  Balance     : Rs. %.2f%n", balance);
        System.out.println("  --------------------------------------------");
        System.out.println("  Transaction History:");
        for (int i = 0; i < logCount; i++)
            System.out.println("    " + (i + 1) + ". " + transactionLog[i]);
        System.out.println("  ============================================");
    }

    /**
     * log(String entry)
     *
     * Private helper method to record a transaction into the log array.
     * Only accessible within this class — not part of the public API.
     * Silently ignores new entries if the log array is full.
     *
     * @param entry Description of the transaction to record
     */
    private void log(String entry) {
        if (logCount < transactionLog.length)
            transactionLog[logCount++] = entry;
    }

    /**
     * getTotalAccounts()
     *
     * Static method — called on the class, not on any object.
     * Returns the total number of BankAccount objects created so far.
     *
     * @return Total number of accounts created
     */
    public static int getTotalAccounts() {
        return totalAccounts;
    }

    /**
     * getBalance()
     *
     * Returns the current balance of this account.
     *
     * @return Current balance as a double
     */
    public double getBalance() {
        return balance;
    }

    /**
     * getHolder()
     *
     * Returns the name of the account holder.
     *
     * @return Holder name as a String
     */
    public String getHolder() {
        return holder;
    }
}                                                                                                                                                                                                   /**
 * BankSimulation.java
 *
 * Day 10 - OOP with Java
 * Concepts: Object creation, method calls, static vs instance usage,
 *           this keyword in action, access modifiers
 *
 * This is the main driver class for the Day 10 simulation.
 * It creates 3 BankAccount objects and runs 5 transactions each.
 *
 * What this demonstrates:
 *   - Creating objects using the 'new' keyword
 *   - Calling instance methods on objects (deposit, withdraw)
 *   - Calling static method on class (BankAccount.getTotalAccounts())
 *   - Overdraft protection in action
 *   - Using a separate utility class (TransactionLogger)
 *
 * How to run:
 *   javac BankAccount.java TransactionLogger.java BankSimulation.java
 *   java BankSimulation
 */
public class BankSimulation {

    /**
     * main(String[] args)
     *
     * Entry point of the program.
     * Creates 3 bank accounts for Ravi, Priya, and Ankit.
     * Runs 5 transactions on each account.
     * Prints individual statements and a final summary.
     *
     * @param args Command-line arguments (not used)
     */
    public static void main(String[] args) {

        TransactionLogger.printHeader();

        /*
         * Creating 3 BankAccount objects.
         * Each call to 'new BankAccount(...)' triggers the constructor,
         * increments totalAccounts, and assigns a unique account number.
         */
        BankAccount acc1 = new BankAccount("Ravi",  10000.00);
        BankAccount acc2 = new BankAccount("Priya", 25000.00);
        BankAccount acc3 = new BankAccount("Ankit",  5000.00);

        /*
         * Static method call — called on the class itself, not on any object.
         * BankAccount.getTotalAccounts() works because totalAccounts
         * is a static field updated in every constructor call.
         */
        System.out.println("\n  Total Accounts Opened So Far: "
                + BankAccount.getTotalAccounts());

        /* ── RAVI'S TRANSACTIONS ── */
        TransactionLogger.printSectionTitle("Ravi's Transactions");
        acc1.deposit(5000);       // valid deposit
        acc1.withdraw(3000);      // valid withdrawal
        acc1.deposit(2000);       // valid deposit
        acc1.withdraw(20000);     // OVERDRAFT — should be blocked
        acc1.withdraw(1000);      // valid withdrawal

        /* ── PRIYA'S TRANSACTIONS ── */
        TransactionLogger.printSectionTitle("Priya's Transactions");
        acc2.deposit(10000);      // valid deposit
        acc2.withdraw(8000);      // valid withdrawal
        acc2.deposit(3000);       // valid deposit
        acc2.withdraw(15000);     // valid withdrawal
        acc2.deposit(500);        // valid deposit

        /* ── ANKIT'S TRANSACTIONS ── */
        TransactionLogger.printSectionTitle("Ankit's Transactions");
        acc3.deposit(1000);       // valid deposit
        acc3.withdraw(4000);      // OVERDRAFT — should be blocked
        acc3.deposit(2000);       // valid deposit
        acc3.withdraw(500);       // valid withdrawal
        acc3.withdraw(3000);      // OVERDRAFT — should be blocked

        /*
         * Print full account statements for all 3 accounts.
         * Each statement shows the complete transaction log
         * and the final balance.
         */
        System.out.println("\n\n========== ACCOUNT STATEMENTS ==========");
        acc1.getStatement();
        acc2.getStatement();
        acc3.getStatement();

        /*
         * Print one-line summary for all accounts using
         * the TransactionLogger utility class.
         */
        System.out.println("\n========== FINAL SUMMARY ==========");
        TransactionLogger.printAccountSummary(acc1);
        TransactionLogger.printAccountSummary(acc2);
        TransactionLogger.printAccountSummary(acc3);

        TransactionLogger.printFooter(BankAccount.getTotalAccounts());
    }
}                                                                                                                                                                                                     /**
 * TransactionLogger.java
 *
 * Day 10 - OOP with Java
 * Concepts: Separate class responsibility, static utility methods,
 *           method design, access modifiers
 *
 * This class is a utility class responsible for printing
 * formatted transaction summaries and reports.
 *
 * It demonstrates:
 *   - Separation of concerns (printing logic separated from BankAccount)
 *   - Static utility methods (no object needed to call them)
 *   - Clean method design with single responsibility
 */
public class TransactionLogger {

    /**
     * printHeader()
     *
     * Prints the top header banner for the bank simulation report.
     * Called once at the beginning of the simulation.
     */
    public static void printHeader() {
        System.out.println("============================================");
        System.out.println("         BRIDGEBANK — TRANSACTION LOG       ");
        System.out.println("============================================");
    }

    /**
     * printSectionTitle(String title)
     *
     * Prints a formatted section title separator.
     * Used to visually separate each account's transaction block.
     *
     * @param title The section heading to display
     */
    public static void printSectionTitle(String title) {
        System.out.println("\n-- " + title + " --");
        System.out.println("--------------------------------------------");
    }

    /**
     * printAccountSummary(BankAccount account)
     *
     * Prints a one-line summary of an account's current state.
     * Shows holder name and final balance after all transactions.
     *
     * @param account The BankAccount object to summarize
     */
    public static void printAccountSummary(BankAccount account) {
        System.out.printf("  %-10s | Final Balance: Rs. %10.2f%n",
                account.getHolder(), account.getBalance());
    }

    /**
     * printFooter(int totalAccounts)
     *
     * Prints the closing footer with total accounts created.
     * Called at the end of the simulation.
     *
     * @param totalAccounts Total number of accounts opened
     */
    public static void printFooter(int totalAccounts) {
        System.out.println("\n============================================");
        System.out.println("  Total Accounts Opened : " + totalAccounts);
        System.out.println("  Simulation Complete.");
        System.out.println("============================================");
    }
}