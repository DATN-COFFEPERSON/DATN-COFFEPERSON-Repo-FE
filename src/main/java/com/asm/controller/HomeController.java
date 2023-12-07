package com.asm.controller;

import com.asm.bean.Account;
import com.asm.bean.Role;
import com.asm.bean.RoleDetail;
import com.asm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {
    @Autowired
    BrandService bService;
    @Autowired
    CategoryService cService;
    @Autowired
    ProductService pService;
    @Autowired
    SessionService session;
    @Autowired
    AccountService aService;
    @Autowired
    MailerService mailer;

    @RequestMapping("/admin")
    public String admin() {
        return "admin/index";
    }

    @RequestMapping("/management")
    public String management() {
        return "management/index";
    }

    @RequestMapping("/")
    public String home(Model model) {
        // load ds product xep theo ngay tao
        model.addAttribute("db", pService.findProductByCreateDateDESC());
        return "home/index";
    }

    @RequestMapping("/contact")
    public String contact(Model model) {
        // load ds product xep theo ngay tao
        model.addAttribute("db", pService.findProductByCreateDateDESC());
        return "/contact";
    }

    @RequestMapping("/blog")
    public String blog(Model model) {
        // load ds product xep theo ngay tao
        model.addAttribute("db", pService.findProductByCreateDateDESC());
        return "/blog";
    }

    @GetMapping("/brand/list")
    public String brandList(Model model) {
        return "brand/list";
    }

    @GetMapping("/register")
    public String register(@ModelAttribute Account account) {
        return "register";
    }

    @PostMapping("/register")
    public String signup(Model model,
                         @ModelAttribute Account account) {
        if (aService.existsById(account.getUsername())) {
            model.addAttribute("error", "Đã tồn tại username " + account.getUsername());
            return "register";
        } else {
            account.setActivated(true);

            account.setPhoto("logo.jpg");

            Role r = new Role();
            r.setRole("user");
            RoleDetail rd = new RoleDetail();
            rd.setAccount(account);
            rd.setRole(r);

            aService.save(account);
            aService.saveRoleDetail(rd);
            return "redirect:/register/success";
        }
    }

    @RequestMapping("/register/success")
    public String registerSuccess(Model model) {
        model.addAttribute("message", "Đăng ký thành công");
        return "redirect:/";
    }

    @GetMapping("/login")
    public String formLogin(Model model, @RequestParam(value = "message", required = false) String message) {
        model.addAttribute("message", message);
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        Model model) {
        try {
            Account account = aService.findByUsername(username);
            if (!account.getPassword().equals(password)) {
                model.addAttribute("message", "Invalid password");
            } else {
                String uri = session.get("security-uri");
                if (uri != null) {
                    return "redirect:" + uri;
                } else {
                    session.set("user", account);
                    if (this.checkAdmin(account)) {
                        session.set("userAdmin", "admin");
                    }
                    model.addAttribute("message", "Đăng nhập thành công");
                }
                return "redirect:/#";
            }
        } catch (Exception e) {
            // TODO: handle exception
            model.addAttribute("message", "Sai thông tin tài khoản");
        }
        return "login";
    }

    public Boolean checkAdmin(Account account) {
        for (RoleDetail roleDetail : account.getRoleDetails()) {
            if (roleDetail.getRole().getRole().equals("staff") || roleDetail.getRole().getRole().equals("director")) {
                return true;
            }
        }
        return false;
    }

    @RequestMapping("/logout")
    public String logoutSuccess(Model model) {
        session.remove("user");
        session.remove("userAdmin");
        session.remove("security-uri");
        session.remove("uri");
        model.addAttribute("message", "Đăng xuất thành công");
        return "login";
    }

    @GetMapping("forgot-password")
    public String forgot() {
        return "forgot";
    }

    @PostMapping("forgot-password")
    public String forgot(@RequestParam("username") String username, Model model) {
        try {
            Account account = aService.findByUsername(username);
            String to = account.getEmail();
            String email = to.substring(0, 2);

            double randomDouble = Math.random();
            randomDouble = randomDouble * 1000000 + 1;
            int randomInt = (int) randomDouble;

            String subject = "Lấy lại mật khẩu";
            String body = "Mật khẩu của bạn là:" + randomInt;
            mailer.send(to, subject, body);

            account.setPassword(String.valueOf(randomInt));
            aService.save(account);

            model.addAttribute("message", "Mật khẩu mới đã được gửi đến mail " + email + "***");
        } catch (Exception e) {
            // TODO: handle exception
            model.addAttribute("message", "Tên người dùng không hợp lệ");
        }
        return "forgot";
    }
}
