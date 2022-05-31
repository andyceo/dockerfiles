<?php
$servers = new Datastore();
$servers->newServer('ldap_pla');
$servers->setValue('server','host','127.0.0.1');
$servers->setValue('server','port',389);
$servers->setValue('server','name','My LDAP Server');
$servers->setValue('server','base',array(''));
$servers->setValue('login','auth_type','session');
$servers->setValue('login','bind_id','');
