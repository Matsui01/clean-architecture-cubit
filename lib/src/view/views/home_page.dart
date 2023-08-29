import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/order.dart';
import '../cubits/order/order_state.dart';
import '../cubits/order/orders_cubit.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<OrdersCubit>().getOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App")),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Pedido'),
        icon: const Icon(Icons.add),
        onPressed: () {
          context.read<OrdersCubit>().saveOrder(
                order: const Order(description: 'Pedido'),
              );
        },
      ),
      body: BlocBuilder<OrdersCubit, OrderState>(
        builder: (BuildContext context, OrderState state) {
          switch (state.runtimeType) {
            case StateSuccess:
              return _buildOrders((state as StateSuccess).orders);
            case StateLoading:
              return const Center(child: CircularProgressIndicator());
            case StateFailed:
              return const Center(child: Icon(Icons.refresh));
            default:
              return const Center(child: Text('Empty Page 😥'));
          }
        },
      ),
    );
  }

  Widget _buildOrders(List<Order> orders) {
    return RefreshIndicator(
      onRefresh: () => context.read<OrdersCubit>().getOrders(),
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${orders[index].description ?? ''} ${orders[index].id} 😀'),
            onTap: () {},
            leading: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => context.read<OrdersCubit>().removeOrder(order: orders[index]),
            ),
          );
        },
      ),
    );
  }
}
