import 'package:eduqhub_test/app/modules/user/domain/model/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User user;
  final double height;
  final void Function()? onTap;

  const UserTile({
    super.key,
    this.height = 180,
    this.onTap,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Ink(
        height: height,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: CircleAvatar(
                    radius: 50,
                    child: Text("Oi"),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${user.firstName} ${user.lastName} ",
                        style: const TextStyle(fontSize: 24)),
                    const SizedBox(height: 4),
                    Text(user.email, style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 4),
                    Text("${user.birthDate}",
                        style: const TextStyle(fontSize: 12)),
                  ],
                ))
              ],
            ),
            const SizedBox(height: 4),
            const Divider(),
            Row(
              children: [
                Text("${user.city} - ${user.state} "),
                const Spacer(),
                Text(user.brief),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Row(
//   children: [
//     const CircleAvatar(
//       child: Text("Oi"),
//     ),
//     const Spacer(),
//     Text(
//       "Status",
//       style: theme.textTheme.bodySmall?.copyWith(
//         fontWeight: FontWeight.bold,
//         color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
//       ),
//     ),
//   ],
// ),
// const Spacer(),
// Text(
//   "Status",
//   style: theme.textTheme.titleLarge?.copyWith(
//     fontWeight: FontWeight.bold,
//   ),
// ),
// const SizedBox(height: 8),
