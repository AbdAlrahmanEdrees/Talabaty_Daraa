<?php 

include '../connect.php';

$table = "address";

// نأخذ القيم القادمة من Flutter
$email      = filterRequest("email");
$name       = filterRequest("name");
$city       = filterRequest("city");
$street     = filterRequest("street");
$lat        = filterRequest("lat");
$long       = filterRequest("long");

// ✅ الخطوة 1: جلب user_id بناءً على البريد الإلكتروني
$stmt = $con->prepare("SELECT users_id FROM users WHERE users_email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// إذا لم يتم العثور على المستخدم
if (!$user) {
    echo json_encode(array("status" => "failure", "message" => "User not found"));
    exit;
}

$usersid = $user['users_id'];

// ✅ الخطوة 2: إنشاء مصفوفة البيانات لإدخال العنوان
$data = array(  
    "address_city"   => $city,
    "address_usersid" => $usersid,
    "address_name"   => $name,
    "address_street" => $street,
    "address_lat"    => $lat,
    "address_long"   => $long,
);

// ✅ الخطوة 3: إدخال البيانات في قاعدة البيانات
insertData($table, $data);
