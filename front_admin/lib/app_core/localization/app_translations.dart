import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      // Login
      'login_title': 'Sign In',
      'email_phone': 'Email or Phone Number',
      'password': 'Password',
      'forgot_password': 'Forgot password?',
      'login_button': 'Log In',
      // Login Auth:
      'error_during_login': 'Error during login ⚠️',
      // Common
      'error': 'Error❌',
      'empty_fields': 'Please fill all fields',
      'success': 'Success✅',
      'login_success': 'Logged in successfully!',
      'resitting_password': 'Resetting Password',
      'resitting_password_message':
          'a link is sent to your email to reset your password',
      //HomePage:
      'homepage_title': 'Home Page',
      'requests': 'Requests',
      'users': 'Users',

      // Users Page
      'search_hint': 'Search by name or ID...',
      'users_load_failed': 'Failed to load users.',
      'no_users_found': 'No users found.',
      'no_name': 'No name',
      'id_label': 'ID',
      'email_label': 'Email',
      'add_user': 'Add User',
      'add_new_user': 'Add New User',
      'name': 'Name',
      'email': 'Email',
      'phone': 'Phone',
      'role': 'Role',
      'admin': 'Admin',
      'customer': 'Customer',
      'cancel': 'Cancel',
      'ban_user': 'Ban User',
      'ban_user_confirm': 'Are you sure you want to ban this user?',
      'confirm': 'Confirm',

      
      // Orders Page
      'orders': 'Orders',
      'pending': 'Pending',
      'ongoing': 'Ongoing',
      'completed': 'Completed',
      'status': 'Status',
      'total': 'Total',
    },
    'ar': {
      // Login
      'login_title': 'تسجيل الدخول',
      'email_phone': 'البريد الإلكتروني أو رقم الهاتف',
      'password': 'كلمة المرور',
      'forgot_password': 'نسيت كلمة المرور؟',
      'login_button': 'تسجيل الدخول',
      // Login Auth:
      'error_during_login': 'خطأ أثناء تسجيل الدخول ⚠️',

      // Common
      'error': 'خطأ❌',
      'empty_fields': 'يرجى ملء جميع الحقول',
      'success': 'تم✅',
      'login_success': 'تم تسجيل الدخول بنجاح!',
      'resitting_password': 'إعادة تعيين كلمة المرور',
      'resitting_password_message':
          'سيتم إرسال رابط إلى بريدك الإلكتروني لإعادة تعيين كلمة المرور',

      //HomePage:
      'homepage_title': 'الصفحة الرئيسية',
      'requests': 'الطلبات',
      'users': 'المستخدمون',

      // Users Page
      'search_hint': 'ابحث بالاسم أو رقم التعريف أو البريد الإلكتروني...',
      'users_load_failed': 'فشل في تحميل المستخدمين.',
      'no_users_found': 'لم يتم العثور على مستخدمين.',
      'no_name': 'بدون اسم',
      'id_label': 'المعرف',
      'email_label': 'البريد الإلكتروني',
      'add_user': 'إضافة مستخدم',
      'add_new_user': 'إضافة مستخدم جديد',
      'name': 'الاسم',
      'email': 'البريد الإلكتروني',
      'phone': 'الهاتف',
      'role': 'الدور',
      'admin': 'مدير',
      'customer': 'عميل',
      'cancel': 'إلغاء',
      'ban_user': 'حظر المستخدم',
      'ban_user_confirm': 'هل أنت متأكد أنك تريد حظر هذا المستخدم؟',
      'confirm': 'تأكيد',

      
      // Orders Page
      'orders': 'الطلبات',
      'pending': 'قيد الانتظار',
      'ongoing': 'قيد التوصيل',
      'completed': 'مكتملة',
      'status': 'الحالة',
      'total': 'الإجمالي',
    },
  };
}
