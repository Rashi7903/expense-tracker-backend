package com.expensetracker.backend.controller;

import org.springframework.web.bind.annotation.*;
import java.util.*;
import org.springframework.http.ResponseEntity;

@RestController
@RequestMapping("/api/transactions")
@CrossOrigin(origins = "https://expense-tracker-fu0sndxt9-rashi7903s-projects.vercel.app")
public class TransactionController {

    private List<Map<String, Object>> transactions = new ArrayList<>();

    // ✅ GET all transactions
    @GetMapping
    public List<Map<String, Object>> getTransactions() {
        return transactions;
    }

    // ✅ POST add new transaction
    @PostMapping
    public ResponseEntity<Map<String, Object>> addTransaction(@RequestBody Map<String, Object> transaction) {
        transaction.put("id", UUID.randomUUID().toString());
        transactions.add(transaction);
        return ResponseEntity.ok(transaction);
    }

    // ✅ DELETE a transaction by ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTransaction(@PathVariable String id) {
        transactions.removeIf(t -> t.get("id").equals(id));
        return ResponseEntity.noContent().build();
    }
}
