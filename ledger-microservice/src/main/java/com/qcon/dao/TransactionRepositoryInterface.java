package com.qcon.dao;

import com.qcon.model.Transaction;

import java.util.List;

public interface TransactionRepositoryInterface {
    List<Transaction> findAll();
    Transaction findById(Long id);
    void save(Transaction transaction);
    void update(Transaction transaction);
    void delete(Long id);
    List<Transaction> getLatestTransactions();
}
