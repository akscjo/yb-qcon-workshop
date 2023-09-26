package com.qcon.controller;

import com.qcon.dao.TransactionRepository;
import com.qcon.model.Transaction;
import com.qcon.util.GeneralUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/transactions")
public class TransactionController {
    private final TransactionRepository transactionRepository;

    @Autowired
    public TransactionController(TransactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }

    @GetMapping
    public List<Transaction> getAllTransactions() {
        return transactionRepository.findAll();
    }

    @GetMapping("/{id}")
    public Transaction getTransactionById(@PathVariable Long id) {
        return transactionRepository.findById(id);
    }

    @PostMapping("/create")
    public void createTransaction(@RequestBody Transaction transaction) {
        transactionRepository.save(transaction);
    }

    @PutMapping("/update/{id}")
    public void updateTransaction(@PathVariable Long id, @RequestBody Transaction transaction) {
        transaction.setTransactionId(id);
        transactionRepository.update(transaction);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteTransaction(@PathVariable Long id) {
        System.out.println("Deleting transaction with id: " + id);
        transactionRepository.delete(id);
        System.out.println("Transaction deleted");
    }

    @GetMapping("/latest")
    public List<Transaction> getLatestTransactions() {
        // Retrieve the latest transactions from your database
        return transactionRepository.getLatestTransactions();
    }

    @GetMapping ("/create-random-transaction")
    public void createRandomTransaction() {
        transactionRepository.save(GeneralUtility.getRandomTransaction());
    }


}
