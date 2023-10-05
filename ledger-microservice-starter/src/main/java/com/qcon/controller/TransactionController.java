package com.qcon.controller;

import com.qcon.dao.TransactionRepository;
import com.qcon.model.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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
        // TODO: Implement me
        return null;
    }

    @GetMapping("/{id}")
    public Transaction getTransactionById(@PathVariable Long id) {
        // TODO: Implement me
        return null;
    }

    @PostMapping("/create")
    public void createTransaction(@RequestBody Transaction transaction) {
       // TODO: Implement me
    }

    @PutMapping("/update/{id}")
    public void updateTransaction(@PathVariable Long id, @RequestBody Transaction transaction) {
        // TODO: Implement me

    }

    @DeleteMapping("/delete/{id}")
    public void deleteTransaction(@PathVariable Long id) {
        // TODO: Implement me
    }

    @GetMapping("/latest")
    public List<Transaction> getLatestTransactions() {
        // Retrieve the latest transactions from your database
        // TODO: Implement me
        return null;
    }

    @GetMapping ("/create-random-transaction")
    public ResponseEntity<String> createRandomTransaction() {
        // TODO: Implement me
        return null;

    }

    @GetMapping("/top-10-from-accts")
    public List<Transaction> getTop10FromAccounts() {
        // TODO: Implement me
        return null;

    }

    @GetMapping("/avg-transactions")
    public Map<String, Integer> getTop10HighValueAccounts() {
        // Define a timestamp for 1 minutes ago
        // TODO: Implement me
        return null;
    }
}
