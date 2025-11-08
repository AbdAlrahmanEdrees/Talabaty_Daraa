<?php
include "../connect.php";

// فلترة المدخلات
$email = filterRequest('email');          

// تحقق من وجود البريد الإلكتروني
if (empty($email)) {
    echo json_encode(array(
        "status" => "failure",
        "message" => "يرجى إدخال البريد الإلكتروني"
    ));
    exit;
}

// جلب user_id من جدول users عن طريق البريد الإلكتروني
$stmt = $con->prepare("SELECT users_id FROM users WHERE users_email = :email");
$stmt->bindValue(':email', $email);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user) {
    echo json_encode(array(
        "status" => "failure",
        "message" => "البريد الإلكتروني غير موجود"
    ));
    exit;
}

// جلب كل الطلبيات الخاصة بالمستخدم
$stmtOrders = $con->prepare("SELECT orders_id, orders_state, orders_text, orders_createdate, orders_editdate 
                             FROM orders 
                             WHERE orders_users = :user_id 
                             ORDER BY orders_createdate DESC");
$stmtOrders->bindValue(':user_id', $user['users_id']);
$stmtOrders->execute();
$orders = $stmtOrders->fetchAll(PDO::FETCH_ASSOC);

if ($orders) {
    echo json_encode(array(
        "status" => "success",
        "message" => "تم جلب الطلبيات بنجاح",
        "data" => $orders
    ));
} else {
    echo json_encode(array(
        "status" => "failure",
        "message" => "لا توجد طلبيات لهذا الزبون"
    ));
}
?>
