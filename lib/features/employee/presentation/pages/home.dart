import 'package:day7_bloc/features/employee/presentation/bloc/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<EmployeeBloc>().add(LooadEmployeeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee List',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.deepOrangeAccent),
        ),
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(builder: (context, state) {
        if (state is EmployeeLoadingState) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.deepOrangeAccent,
          ));
        }
        if (state is EmployeeLoadedState) {
          return ListView.builder(
            itemCount: state.employee.length,
            itemBuilder: (context, index) => ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.employee[index].name?.first ?? 'No Name',
                    style: const TextStyle(color: Colors.indigo, fontSize: 16),
                  ),
                  Text(
                    state.employee[index].gender ?? 'Not defined',
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
              ),
              subtitle: Text(state.employee[index].email ?? 'No Email'),
            ),
          );
        }
        if (state is EmployeeFailedState) {
          return Center(
            child: Text(
              'Error: ${state.error}',
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
