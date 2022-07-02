//For widgets to be able to read providers, we need to wrap the entire
// application in a "ProviderScope" widget.
// This is where the state of our providers will be stored.

//A provider is an object that encapsulates a piece of state and allows listening to that state.

//Providers should always be final.

//PROVIDER TYPES        THE RETURN FUNCTION           USE CASES
// Provider             Returns any type	            A service class / computed property (filtered list).
// StateProvider	      Returns any type	            A filter condition / simple state object.
// FutureProvider	      Returns a Future of any type	A result from an API call.
// StreamProvider	      Returns a Stream of any type	A stream of results from an API.
//StateNotifierProvider 	Returns a subclass of StateNotifier	  A complex state object that is immutable except through an interface
//ChangeNotifierProvider	Returns a subclass of ChangeNotifier	A complex state object that requires mutability.

// ChangeNotifierProviders are not recommended for scalable applications, because of issues with mutable state. It exists in the flutter_riverpod package to provide an easy migration path from package:provider, and allows for some flutter specific use-cases such as integration with some Navigator 2 packages.

//PROVIDER MODIFIERS
//1. autoDispose, which will make the provider automatically destroy its state when it is no longer being listened to.
//reasons for using autoDispose
//- When using Firebase, to close the connection and avoid unnecessary cost.
// - To reset the state when the user leaves a screen and re-enters it.
//ref.keepAlive
// Marking a provider with autoDispose also adds an extra method on ref: keepAlive


//2. family, which allows creating a provider from external parameters.
//Family UseCases
//- we can combine family with FutureProvider to fetch a Message from its ID
//Parameter restrictions
//- For families to work correctly, it is critical for the parameter passed to a provider to have a consistent hashCode and ==.
//- Ideally, the parameter should either be a primitive (bool/int/double/String), a constant (providers), or an immutable object that overrides == and hashCode.
//PREFER using autoDispose when the parameter is not constant


// "ref" object: This object is what allows us to interact with providers, be it from a widget or another provider.

//The most common way to obtain a ref in the widget tree is to replace StatelessWidget with ConsumerWidget, StatefulHookConsumerWidget, Hookconsumerwidget/HookConsumer(at a widget tree level).

// USES OF REF
//1.ref.watch: obtaining the value of a provider and listening to changes, such that when this value changes, this will rebuild the widget or provider that subscribed to the value.
//2.ref.read: obtaining the value of a provider while ignoring changes. This is useful when we need the value of a provider in an event such as "on click".
//3.ref.listen: adding a listener on a provider, to execute an action such as navigating to a new page or showing a modal whenever that provider changes.
//NoTe: whenever possible prefer ref.watch over the rest, helps your code be more maintainable.

//CAUTION(REF.WATCH)
// The .watch method should not be called asynchronously, like inside an onPressed of an ElevatedButton. Nor should it be used inside initState and other State life-cycles.
// In those cases, consider using ref.read instead.

// REF.LISTEN: That can be useful for performing actions when a certain change happens, such as showing a snackbar when an error happens.
//CAUTION
// The listen method should not be called asynchronously, like inside an onPressed of an ElevatedButton. Nor should it be used inside initState and other State life-cycles.

//REF.READ: a way to obtain the state of a provider without listening to it, It is commonly used inside functions triggered by user interactions.
//CAUTION
//DON'T use ref.read inside the build method

//Using "select" to filter rebuilds

//DON'T CALL READ INSIDE THE BODY OF A PROVIDER

//My provider updates too often, what can I do?
//The solution to this problem is to create a separate provider that exposes only what you need. PREFER using select when you only need a single property of an object:

//Provider Observer: listens to the changes of a ProviderContainer.To use it, extend the class ProviderObserver and override the method you want to use.
//ProviderObserver has three methods :
//- didAddProvider is called every time a provider was initialized, and the value exposed is value.
//- didDisposeProvider is called every time a provider was disposed.
//- didUpdateProvider is called every time by providers when they emit a notification.

