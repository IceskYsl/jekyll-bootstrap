--- 
layout: post
comments: true
title: delete & not exists in Mysql
date: 2010-10-4
link: false
categories: life
---
This works

<em>select *  from tb_patient p where not exists (select col_patient_id from tb_payment   where  col_patient_id = p.col_unid);</em>

However, this does <span style="color: #ff0000;">NOT</span> work

<em>delete  from tb_patient p where not exists (select col_patient_id from tb_payment  where col_patient_id = p.col_unid);</em>

why? Because of the alias p!!! Table alias is not allowed in not exists subquery!! Instead, you have to use the full table name~~~~ faint!

<strong>Correct code</strong>
<em> delete  from tb_patient where not exists (select col_patient_id from tb_payment  where col_patient_id = tb_patient.col_unid);</em>
