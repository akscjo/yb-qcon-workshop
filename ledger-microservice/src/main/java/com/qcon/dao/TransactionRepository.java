package com.qcon.dao;

import com.qcon.model.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
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
        String sql = "SELECT * FROM transactions limit 10000";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Transaction.class));
    }

    @Override
    public Transaction findById(Long id) {
        String sql = "SELECT * FROM transactions WHERE transaction_id = ?";
        RowMapper<Transaction> rowMapper = new BeanPropertyRowMapper<>(Transaction.class);

        List<Transaction> transactions = jdbcTemplate.query(sql, rowMapper, id);

        // Check if any results were returned
        if (!transactions.isEmpty()) {
            return transactions.get(0);
        } else {
            return null; // or throw an exception, depending on your use case
        }
    }

    @Override
    public void save(Transaction transaction) {
        String sql = "INSERT INTO transactions (from_acct, to_acct, from_route, to_route, amount) " +
                "VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(
                sql,
                transaction.getFromAcct(),
                transaction.getToAcct(),
                transaction.getFromRoute(),
                transaction.getToRoute(),
                transaction.getAmount()
        );
    }

    @Override
    public void update(Transaction transaction) {
        String sql = "UPDATE transactions SET from_acct = ?, to_acct = ?, from_route = ?, to_route = ?, amount = ?, timestamp = ? " +
                "WHERE transaction_id = ?";
        jdbcTemplate.update(
                sql,
                transaction.getFromAcct(),
                transaction.getToAcct(),
                transaction.getFromRoute(),
                transaction.getToRoute(),
                transaction.getAmount(),
                transaction.getTimestamp(),
                transaction.getTransactionId()
        );
    }

    @Override
    public void delete(Long id) {
        String sql = "DELETE FROM transactions WHERE transaction_id = ?";
        int code = jdbcTemplate.update(sql, id);
        System.out.println("Delete transaction code: " + code);
    }

    @Override
    public List<Transaction> getLatestTransactions() {
        String sql = "SELECT * FROM transactions order by transaction_id desc limit 100";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Transaction.class));
    }

    @Override
    public List<Transaction> findTop10FromAccounts(LocalDateTime timestamp) {
        String sql = "SELECT *\n" +
                        "FROM transactions\n" +
                        "WHERE \"timestamp\" >= ? \n" +
                        "ORDER BY \"amount\" DESC\n" +
                        "LIMIT 10;";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Transaction.class), Timestamp.valueOf(timestamp));
    }

    @Override
    public Map<String, Integer> getTransactions(LocalDateTime timestamp) {
        int numSeconds = 60;
        String sql = "SELECT COUNT(*) AS total_transactions " +
                "FROM transactions " +
                "WHERE \"timestamp\" >= ?";

        Timestamp timestampParam = Timestamp.valueOf(timestamp.minusSeconds(numSeconds)); // Calculate 60 seconds ago

        int totalTransactions = jdbcTemplate.queryForObject(sql, Integer.class, timestampParam);

        Map<String, Integer> response = new HashMap<>();
        response.put("total_transactions", totalTransactions);

        return response;
    }






}
