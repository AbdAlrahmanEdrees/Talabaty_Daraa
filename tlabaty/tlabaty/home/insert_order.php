<?php
include "../connect.php";

// فلترة المدخلات
$email = filterRequest('email');          
$orders_text = filterRequest('orders_text');  
$address_id = filterRequest('address_id');  

// تحقق من وجود البيانات
if (empty($email) || empty($orders_text) || empty($address_id)) {
    echo json_encode(array(
        "status" => "failure",
        "message" => "يرجى إدخال كل الحقول المطلوبة"
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

// التحقق من وجود طلبيات سارية (0 = جديد, 1 = مقبول)
$stmtCheck = $con->prepare("SELECT orders_id FROM orders WHERE orders_users = :user_id AND orders_state IN (0, 1) LIMIT 1");
$stmtCheck->bindValue(':user_id', $user['users_id']);
$stmtCheck->execute();
$activeOrder = $stmtCheck->fetch(PDO::FETCH_ASSOC);

if ($activeOrder) {
    echo json_encode(array(
        "status" => "failure",
        "message" => "لا يمكنك إنشاء طلبية جديدة قبل انتهاء الطلبية الحالية"
    ));
    exit;
}

// بيانات الإدخال للطلبية الجديدة
$data = array(
    "orders_users" => $user['users_id'],
    "orders_state" => "0", 
    "orders_createdate" => date("Y-m-d H:i:s"),
    "orders_editdate" => null,
    "orders_text" => $orders_text,
    "address_id" => $address_id
);

// إدخال الطلبية
$count = insertData("orders", $data, false);

if ($count > 0) {
    echo json_encode(array(
        "status" => "success",
        "message" => "تم إنشاء الطلبية بنجاح"
    ));
} else {
    echo json_encode(array(
        "status" => "failure",
        "message" => "حدث خطأ أثناء إضافة الطلبية"
    ));
}
?>
