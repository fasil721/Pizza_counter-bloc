import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_counter_app/models/pizza.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaLoading()) {
    on<LoadPizzaCounter>(_onLoadPizzaCounter);
    on<AddPizzaEvent>(_onAddPizza);
    on<RemovePizzaEvent>(_onRemovePizza);
  }

  Future<void> _onLoadPizzaCounter(
    LoadPizzaCounter event,
    Emitter<PizzaState> emit,
  )  async {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(const PizzaLoaded(pizzas: <Pizza>[]));
  }

  void _onAddPizza(
    AddPizzaEvent event,
    Emitter<PizzaState> emit,
  ) {
    if (state is PizzaLoaded) {
      final state = this.state as PizzaLoaded;
      emit(
        PizzaLoaded(
          pizzas: List.from(state.pizzas)..add(event.pizza),
        ),
      );
    }
  }

  void _onRemovePizza(
    RemovePizzaEvent event,
    Emitter<PizzaState> emit,
  ) {
    if (state is PizzaLoaded) {
      final state = this.state as PizzaLoaded;
      emit(
        PizzaLoaded(
          pizzas: List.from(state.pizzas)..remove(event.pizza),
        ),
      );
    }
  }
}
