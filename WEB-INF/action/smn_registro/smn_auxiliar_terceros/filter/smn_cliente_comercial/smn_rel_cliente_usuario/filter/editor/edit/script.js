setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
document.form1.id.value='${fld:smn_rel_cliente_usuario_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

document.form1.userlogin.value='${fld:userlogin@js}';
document.form1.lname.value='${fld:lname@js}';
document.form1.fname.value='${fld:fname@js}';
document.form1.passwd.value='${fld:passwd@js}'
document.form1.confirm.value='${fld:confirm@js}';
document.form1.email.value='${fld:email@js}';

 

