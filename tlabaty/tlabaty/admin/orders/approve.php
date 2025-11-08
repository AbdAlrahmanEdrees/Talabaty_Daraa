<?php

include "../../connect.php";

$orderid = filterRequest("ordersid");

$userid = filterRequest("usersid");

$data = array(
    "orders_state" => 1
);

updateData("orders", $data, "orders_id = $orderid AND orders_state = 0");

$result = sendGCM("success", "The Order Has been Approved", "users$userid", "none", "refreshorderpending");
if (!$result) {
    error_log("Failed to send GCM notification.");
}


// insertNotify("success", "The Order Has been Approved", $userid, "users$userid", "none",  "refreshorderpending");
