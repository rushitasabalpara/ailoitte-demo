abstract class DrinkEvent{}

class InitialEvent extends DrinkEvent{

}

class GetDataEvent extends DrinkEvent{

}

class SearchEvent extends DrinkEvent{
  final String? value;
SearchEvent({this.value});
}