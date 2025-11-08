<?php
include "../connect.php";

// فلترة المدخلات
$order_id = filterRequest('order_id');
$email = filterRequest('email');
$new_text = filterRequest('orders_text');

// تحقق من وجود المدخلات
if (empty($order_id) || empty($email) || empty($new_text)) {
    echo json_encode(array(
        "status" => "failure",
        "message" => "يرجى إدخال البريد الإلكتروني ورقم الطلب والنص الجديد"
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

// تحقق أن الطلبية تخص المستخدم وأنها جديدة فقط
$stmtCheck = $con->prepare("SELECT * FROM orders WHERE orders_id = :order_id AND orders_users = :user_id AND orders_state = 0");
$stmtCheck->bindValue(':order_id', $order_id);
$stmtCheck->bindValue(':user_id', $user['users_id']);
$stmtCheck->execute();
$order = $stmtCheck->fetch(PDO::FETCH_ASSOC);

if (!$order) {
    echo json_encode(array(
        "status" => "failure",
        "message" => "الطلبية غير موجودة أو لا يمكن تعديلها"
    ));
    exit;
}

// تحديث محتوى الطلبية
$stmtUpdate = $con->prepare("UPDATE orders SET orders_text = :new_text, orders_editdate = NOW() WHERE orders_id = :order_id");
$stmtUpdate->bindValue(':new_text', $new_text);
$stmtUpdate->bindValue(':order_id', $order_id);

if ($stmtUpdate->execute()) {
    echo json_encode(array(
        "status" => "success",
        "message" => "تم تعديل الطلبية بنجاح"
    ));
} else {
    echo json_encode(array(
        "status" => "failure",
        "message" => "حدث خطأ أثناء تعديل الطلبية"
    ));
}
?>
