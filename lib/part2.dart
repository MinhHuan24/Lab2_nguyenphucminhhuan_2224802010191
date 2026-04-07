import 'package:flutter/material.dart';

class Part2Screen extends StatelessWidget {
  const Part2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin kích thước màn hình hiện tại
    final size = MediaQuery.of(context).size;
    
    // Xác định Breakpoint (điểm neo)
    // Nếu chiều rộng >= 600 thì coi như là màn hình Desktop/Tablet
    final isDesktop = size.width >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Layout'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        
        // THÊM NÚT TRỞ VỀ MENU 
        actions: [
          IconButton(
            icon: const Icon(Icons.home), // Icon ngôi nhà
            tooltip: 'Trở về Menu chính', // Hiển thị chữ khi di chuột vào (trên web/desktop)
            onPressed: () {
              // Lệnh giúp đóng màn hình hiện tại và quay về màn hình trước đó
              Navigator.pop(context);
            },
          ),
        ],
      ),
      
      // Logic hiển thị Drawer (Menu)
      // Nếu KHÔNG phải desktop (!isDesktop) -> dùng drawer ẩn (phải bấm nút mới ra)
      // Nếu LÀ desktop -> gán null (vì ta sẽ vẽ drawer cố định ở Body)
      drawer: !isDesktop ? buildDrawer(context) : null, // Truyền thêm context vào đây để dùng cho nút Home trong Drawer
      
      // 4. Logic hiển thị Body
      body: Row(
        children: [
          // Nếu là màn hình rộng, hiển thị Drawer cố định bên trái chiếm 250 pixels
          if (isDesktop)
            SizedBox(
              width: 250,
              child: buildDrawer(context), // Truyền context
            ),
            
          // Phần nội dung chính (Expanded giúp chiếm phần không gian còn lại)
          Expanded(
            child: buildContent(size),
          ),
        ],
      ),
    );
  }

  // Hàm phụ: Tạo giao diện cho Drawer (Menu)
  // Nhận thêm biến BuildContext để có thể gọi hàm chuyển trang
  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Back to Main Menu'),
            onTap: () {
              // Bấm vào "Back to Main Menu" trong Drawer sẽ thoát về Menu chính
              Navigator.pop(context); // Đóng Drawer (nếu đang ở mobile)
              Navigator.pop(context); // Thoát về Main Menu
            },
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
          ),
        ],
      ),
    );
  }

  // Hàm phụ: Tạo phần hiển thị nội dung chính giữa màn hình
  Widget buildContent(Size size) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.devices, size: 80, color: Colors.blue),
          const SizedBox(height: 20),
          const Text(
            'Responsive Layout',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Hiển thị kích thước màn hình thực tế để bạn theo dõi
          Text(
            'Screen width: ${size.width.toStringAsFixed(1)}',
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            'Screen height: ${size.height.toStringAsFixed(1)}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}