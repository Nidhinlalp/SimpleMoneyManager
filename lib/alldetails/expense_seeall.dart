import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseSeeAll extends StatelessWidget {
  const ExpenseSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(
        20.0,
      ),
      itemBuilder: (ctx, index) {
        return Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
                flex: 2,
                onPressed: (context) => (context) {},
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
                onPressed: (context) => (context) {},
                backgroundColor: const Color(
                  0xFF0392CF,
                ),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),
          child: Card(
            elevation: 10.0,
            shadowColor: Colors.grey.withOpacity(
              0.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15.0,
              ),
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(
                  255,
                  131,
                  21,
                  127,
                ),
                radius: 50,
                child: Text(
                  '12\n Dec',
                  textAlign: TextAlign.center,
                ),
              ),
              title: Text(
                '₹ 2000',
              ),
              subtitle: Text(
                'Food',
              ),
            ),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 5,
    );
  }
}
