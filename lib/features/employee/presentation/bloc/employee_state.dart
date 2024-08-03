part of 'employee_bloc.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();
  @override
  List<Object> get props => [];
}

class EmployeeLoadingState extends EmployeeState {}

class EmployeeLoadedState extends EmployeeState {
  final List<Employee> employee;

  const EmployeeLoadedState(this.employee);
}

class EmployeeFailedState extends EmployeeState {
  final String error;

  EmployeeFailedState(this.error);
}
