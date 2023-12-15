package com.asm.bean;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Orders")
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Temporal(TemporalType.DATE)
    @Column(name = "createdate")
    private Date createDate = new Date();
    private String address;

    @ManyToOne
//    @JsonIgnore
    @JoinColumn(name = "username")
    private Account account;

    @ManyToOne
    @JoinColumn(name = "cf_table")
    private CfTable cfTable;

    @JsonIgnore
    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderDetails;

    private boolean usingTable = false;
    /// 0: unpaid, 1: paid, -1: cancel
    private int status = 0;
}
