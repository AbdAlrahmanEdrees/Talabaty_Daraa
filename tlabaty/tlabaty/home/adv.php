<?php
include "../connect.php"; // ملف الاتصال بقاعدة البيانات

header('Content-Type: application/json; charset=utf-8');

try {
    // جلب كل الإعلانات من الجدول
    $stmt = $con->prepare("SELECT advertisements_title, advertisements_body FROM advertisements ORDER BY advertisements_id DESC");
    $stmt->execute();
    $ads = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if ($ads) {
        echo json_encode(array(
            "status" => "success",
            "message" => "تم جلب الإعلانات بنجاح",
            "data" => $ads
        ), JSON_UNESCAPED_UNICODE);
    } else {
        echo json_encode(array(
            "status" => "failure",
            "message" => "لا توجد إعلانات حالياً",
            "data" => []
        ), JSON_UNESCAPED_UNICODE);
    }
} catch (PDOException $e) {
    echo json_encode(array(
        "status" => "failure",
        "message" => "حدث خطأ: " . $e->getMessage(),
        "data" => []
    ), JSON_UNESCAPED_UNICODE);
}
?>
