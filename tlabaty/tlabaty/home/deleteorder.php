<?php
include "../connect.php";

// فلترة المدخلات
$order_id = filterRequest('order_id');
$email = filterRequest('email');

// تحقق من وجود المدخلات
if (empty($order_id) || empty($email)) {
    echo json_encode(array(
        "status" => "failure",
        "message" => "يرجى إدخال البريد الإلكتروني ورقم الطلب"
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

// تحقق أن الطلبية تخص المستخدم
$stmtCheck = $con->prepare("SELECT * FROM orders WHERE orders_id = :order_id AND orders_users = :user_id");
$stmtCheck->bindValue(':order_id', $order_id);
$stmtCheck->bindValue(':user_id', $user['users_id']);
$stmtCheck->execute();
$order = $stmtCheck->fetch(PDO::FETCH_ASSOC);

if (!$order) {
    echo json_encode(array(
        "status" => "failure",
        "message" => "الطلبية غير موجودة أو لا تخص هذا المستخدم"
    ));
    exit;
}

// حذف الطلبية
$stmtDelete = $con->prepare("DELETE FROM orders WHERE orders_id = :order_id");
$stmtDelete->bindValue(':order_id', $order_id);
if ($stmtDelete->execute()) {
    echo json_encode(array(
        "status" => "success",
        "message" => "تم حذف الطلبية بنجاح"
    ));
} else {
    echo json_encode(array(
        "status" => "failure",
        "message" => "حدث خطأ أثناء حذف الطلبية"
    ));
}
?>
