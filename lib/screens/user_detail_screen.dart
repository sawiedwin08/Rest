import 'package:flutter/material.dart';
import 'package:app_flutter_rest/models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard('General Information', [
              _buildInfoRow('Name', user.name),
              _buildInfoRow('ID', user.id.toString()),
              _buildInfoRow('Family', user.family),
              _buildInfoRow('Order', user.order),
              _buildInfoRow('Genus', user.genus),
            ]),
            const SizedBox(height: 16.0),
            _buildInfoCard('Nutritional Information', [
              _buildInfoRow('Calories', '${user.nutritions.calories} kcal'),
              _buildInfoRow('Fat', '${user.nutritions.fat} g'),
              _buildInfoRow('Sugar', '${user.nutritions.sugar} g'),
              _buildInfoRow('Carbohydrates', '${user.nutritions.carbohydrates} g'),
              _buildInfoRow('Protein', '${user.nutritions.protein} g'),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.0,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
