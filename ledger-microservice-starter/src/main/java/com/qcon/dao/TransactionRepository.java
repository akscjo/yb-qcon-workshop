package com.qcon.dao;

import com.qcon.model.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Repository
public class TransactionRepository implements TransactionRepositoryInterface{
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public TransactionRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Transaction> findAll() {
        //TODO: Implement me
        return null;
    }

    @Override
    public Transaction findById(Long id) {
        // TODO: Implement me
        return null;
    }

    @Override
    public void save(Transaction transaction) {
        // TODO: Implement me
    }

    @Override
    public void update(Transaction transaction) {
        // TODO: Implement me
    }

    @Override
    public void delete(Long id) {
        // TODO: Implement me
    }

    @Override
    public List<Transaction> getLatestTransactions() {
        // TODO: Implement me
        return null;
    }

    @Override
    public List<Transaction> findTop10FromAccounts(LocalDateTime timestamp) {
        // TODO: Implement me
        return null;
    }

    @Override
    public Map<String, Integer> getTransactions(LocalDateTime timestamp) {
        //TODO: Implement me
        return null;
    }






}
