import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:day7_bloc/features/employee/data/models/employee.dart';
import 'package:day7_bloc/features/employee/data/repositories/employee_repository.dart';
import 'package:equatable/equatable.dart';
part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _employeeRepository;
  EmployeeBloc(this._employeeRepository) : super(EmployeeLoadingState()) {
    on<LooadEmployeeEvent>(loadEmployee);
  }

  FutureOr<void> loadEmployee(LooadEmployeeEvent  event, Emitter<EmployeeState> emit) async {
    emit(EmployeeLoadingState());
    await _employeeRepository.getEmployees().then((employees) {
      emit(EmployeeLoadedState(employees));
    }).catchError((error) {
      emit(EmployeeFailedState(error.toString()));
    });
  }
}
