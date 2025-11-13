class Order {
  final int? id;
  final String customer;
  final String state;
  final DateTime? createDate;
  final DateTime? editDate;
  final String text;

  Order({
    this.id,
    required this.customer,
    required this.state,
    this.createDate,
    this.editDate,
    required this.text,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customer: json['customer'],
      state: json['status'],
      createDate: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      editDate: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      text: json['text'] ?? '',
    );
  }
  

  Map<String, dynamic> toJson() {
    return {
      'orders_id': id,
      'orders_users': customer,
      'orders_state': state,
      'orders_createdate': createDate?.toIso8601String(),
      'orders_editdate': editDate?.toIso8601String(),
      'orders_text': text,
    };
  }
}
