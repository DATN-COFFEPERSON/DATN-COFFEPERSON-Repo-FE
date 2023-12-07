package com.asm.controller.rest;

import com.asm.bean.Account;
import com.asm.bean.RoleDetail;
import com.asm.service.AccountService;
import com.asm.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/admin/rest/accounts")
public class UserRestController {
    @Autowired
    AccountService aService;
    @Autowired
    UploadService uService;

    @GetMapping("")
    public List<Account> getAllAccount() {
        return aService.findAll();
    }

    @GetMapping("/{username}")
    public ResponseEntity<Account> getAccount(@PathVariable("username") String username) {
        if (!aService.existsById(username)) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(aService.findByUsername(username));
        }
    }

    @GetMapping("/authorities")
    public Map<String, Object> getAuthority() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("accounts", aService.findAll());
        map.put("roles", aService.findAllRole());
        map.put("authorities", aService.findAllAuthorities());
        return map;
    }

    @GetMapping("/search")
    public List<Account> searchAccount(@RequestParam("kw") Optional<String> kw) {
        String keyword = kw.orElse(null);
        if (keyword != null) {
            return aService.findByFullname("%" + keyword + "%");
        } else {
            return this.getAllAccount();
        }
    }

    @GetMapping("/authorities/search")
    public List<Account> searchAccountByUsername(@RequestParam("kw") Optional<String> kw) {
        String keyword = kw.orElse(null);
        if (keyword != null) {
            return aService.findByUsernameLike("%" + keyword + "%");
        } else {
            return this.getAllAccount();
        }
    }

    @PostMapping("")
    public ResponseEntity<Account> postAccount(@RequestBody Account Account) {
        if (aService.existsById(Account.getUsername())) {
            return ResponseEntity.badRequest().build();
        } else {
            return ResponseEntity.ok(aService.save(Account));
        }
    }

    @PostMapping("/authorities")
    public RoleDetail postAuthorities(@RequestBody RoleDetail authority) {
        return aService.saveRoleDetail(authority);
    }

    @PutMapping("/{username}")
    public ResponseEntity<Account> putAccount(@PathVariable("username") String username, @RequestBody Account Account) {
        if (!aService.existsById(username)) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(aService.save(Account));
        }
    }

    @DeleteMapping("/{username}")
    public ResponseEntity<Void> deleteAccount(@PathVariable("username") String username) {
        if (!aService.existsById(username)) {
            return ResponseEntity.notFound().build();
        } else {
            Account Account = aService.findByUsername(username);
            String filename = Account.getPhoto();
            System.out.println(filename);
            if (!filename.equalsIgnoreCase("logo.jpg")) {
                uService.delete("account", filename);
            }
            aService.deleteByUsername(username);
            return ResponseEntity.ok().build();
        }
    }

    @DeleteMapping("/authorities/{id}")
    public void deleteAuthorities(@PathVariable("id") Long id) {
        aService.deleteRoleDetail(id);
    }

}

