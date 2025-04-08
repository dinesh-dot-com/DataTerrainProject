import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomSidebar extends StatelessWidget {
  final VoidCallback? onClose;
  final String userName;
  final String userRole;
  final String? userImageUrl;

  const CustomSidebar({
    Key? key,
    this.onClose,
    this.userName = "John Doe",
    this.userRole = "Mentor",
    this.userImageUrl,
  }) : super(key: key);

  bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    final bool tablet = isTablet(context);


    final double avatarSize = tablet ? 80 : 100;
    final double iconSize = tablet ? 26 : 24;
    final double titleFontSize = tablet ? 18 : 16;
    final double nameFontSize = tablet ? 20 : 18;
    final double roleFontSize = tablet ? 16 : 14;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Admin",
                    style: TextStyle(
                      fontSize: tablet ? 24 : 22,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF246BFD),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: onClose,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildUserProfileSection(tablet, avatarSize, nameFontSize, roleFontSize),
            const Divider(),
            _buildNavigationItems(context, iconSize, titleFontSize, tablet),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfileSection(bool tablet, double avatarSize, double nameFontSize, double roleFontSize) {
    return Column(
      children: [
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF246BFD),
              width: 3,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(avatarSize / 2),
            child: userImageUrl != null
                ? Image.network(
                    userImageUrl!,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      size: avatarSize / 2,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          userName,
          style: TextStyle(
            fontSize: nameFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          userRole,
          style: TextStyle(
            fontSize: roleFontSize,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildNavigationItems(BuildContext context, double iconSize, double fontSize, bool tablet) {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.calendar_month_outlined, 'label': 'Scheduler'},
      {'icon': Icons.access_time_outlined, 'label': 'Timesheet'},
      {'icon': Icons.people_outline, 'label': 'Discussions'},
      {'icon': Icons.description_outlined, 'label': 'Reports'},
      {'icon': Icons.chat_outlined, 'label': 'Feedback'},
      {'icon': Icons.card_membership_outlined, 'label': 'Certificates'},
    ];

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: tablet ? 12 : 8),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return ListTile(
            leading: Icon(
              item['icon'],
              color: Colors.black87,
              size: iconSize,
            ),
            title: Text(
              item['label'],
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              if (onClose != null) {
                onClose!();
              } else {
                Navigator.pop(context);
              }
              context.go('/coming-soon');
            },
          );
        },
      ),
    );
  }
}
