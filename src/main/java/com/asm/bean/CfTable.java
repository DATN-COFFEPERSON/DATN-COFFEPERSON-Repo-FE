package com.asm.bean;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@javax.persistence.Table(name = "Cf_Tables")
public class CfTable implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @Temporal(TemporalType.DATE)
    @Column(name = "createdate")
    private Date createDate = new Date();

    // -1: deleted, 0: bàn trống, 1: đã có người ngồi
    private Integer status = 0;

    private String description;

    @JsonIgnore
    @OneToMany(mappedBy = "cfTable")
    List<Order> orders;
}
