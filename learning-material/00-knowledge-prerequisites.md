# 🧠 Knowledge Prerequisites

> **Essential OOP concepts and Dart-specific features for Flutter development mastery**

---

## 🎯 **Learning Objectives**

Before diving into Flutter Clean Architecture, you should be comfortable with these fundamental concepts:
- ✅ Object-Oriented Programming principles
- ✅ Dart language-specific features
- ✅ Modern programming patterns
- ✅ Type safety and generics
- ✅ Functional programming concepts

---

## 📚 **Core OOP Concepts in Flutter Context**

In Flutter (and Dart, the language behind Flutter), you'll lean heavily on the following core OOP concepts and Dart‑specific extensions:

### **1. Classes & Objects**

Every widget you build is a Dart class extending either `StatelessWidget` or `StatefulWidget`.

```dart
class MyButton extends StatelessWidget {
  final String label;           // encapsulated data
  final VoidCallback? onPressed;
  
  const MyButton({
    super.key,
    required this.label,
    this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

// Usage
final button = MyButton(
  label: 'Click Me',
  onPressed: () => print('Button clicked!'),
);
```

**Key Points:**
- Classes define the blueprint for objects
- Objects are instances of classes
- Every Flutter widget is an object
- Constructor parameters define object properties

---

### **2. Encapsulation**

You keep a widget's internal state or helper methods private by prefixing them with an underscore (`_`).

```dart
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});
  
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;               // private field
  
  void _increment() {           // private method
    setState(() => _count++);
  }
  
  void _decrement() {           // private method
    if (_count > 0) {
      setState(() => _count--);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_count'),
        Row(
          children: [
            ElevatedButton(
              onPressed: _increment,
              child: const Text('+'),
            ),
            ElevatedButton(
              onPressed: _decrement,
              child: const Text('-'),
            ),
          ],
        ),
      ],
    );
  }
}
```

**Benefits:**
- Hides internal implementation details
- Prevents external code from directly modifying internal state
- Provides controlled access through public methods

---

### **3. Inheritance & Method Overriding**

Flutter's widget hierarchy is a classic example of specialization by inheritance.

```dart
// Base widget class
abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
  
  // Template method pattern
  Widget buildAppBar(BuildContext context);
  Widget buildBody(BuildContext context);
  Widget? buildFloatingActionButton(BuildContext context) => null;
}

// Concrete implementation
class ArticleListScreen extends BaseScreen {
  const ArticleListScreen({super.key});
  
  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  @override
  void initState() {
    super.initState();           // Always call super
    // Custom initialization
    _loadArticles();
  }
  
  @override
  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Articles'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: _showSearch,
        ),
      ],
    );
  }
  
  @override
  Widget buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) => ArticleItem(article: articles[index]),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }
  
  void _loadArticles() {
    // Load articles logic
  }
  
  void _showSearch() {
    // Show search logic
  }
}
```

**Key Concepts:**
- `extends` creates an inheritance relationship
- `@override` annotation indicates method overriding
- Always call `super()` when overriding methods
- Template method pattern for consistent structure

---

### **4. Abstraction & Interfaces**

Dart doesn't have a separate interface keyword—instead you use abstract classes to define contracts.

```dart
// Abstract class defining contract
abstract class DataSource {
  Future<List<Article>> fetchArticles();
  Future<Article> getArticle(int id);
  Future<void> saveArticle(Article article);
}

// Remote implementation
class ApiDataSource implements DataSource {
  final Dio _dio;
  
  ApiDataSource(this._dio);
  
  @override
  Future<List<Article>> fetchArticles() async {
    final response = await _dio.get('/articles');
    return (response.data as List)
        .map((json) => Article.fromJson(json))
        .toList();
  }
  
  @override
  Future<Article> getArticle(int id) async {
    final response = await _dio.get('/articles/$id');
    return Article.fromJson(response.data);
  }
  
  @override
  Future<void> saveArticle(Article article) async {
    await _dio.post('/articles', data: article.toJson());
  }
}

// Local implementation
class LocalDataSource implements DataSource {
  final Database _database;
  
  LocalDataSource(this._database);
  
  @override
  Future<List<Article>> fetchArticles() async {
    final results = await _database.query('articles');
    return results.map((row) => Article.fromJson(row)).toList();
  }
  
  @override
  Future<Article> getArticle(int id) async {
    final results = await _database.query(
      'articles',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Article.fromJson(results.first);
  }
  
  @override
  Future<void> saveArticle(Article article) async {
    await _database.insert('articles', article.toJson());
  }
}
```

**Benefits:**
- Defines contracts without implementation
- Enables dependency inversion
- Supports multiple implementations
- Facilitates testing with mocks

---

### **5. Mixins**

Mixins let you "mix in" reusable behavior without multiple inheritance.

```dart
// Logging mixin
mixin Logger {
  void log(String message, [LogLevel level = LogLevel.info]) {
    final timestamp = DateTime.now().toIso8601String();
    debugPrint('[$timestamp] [${level.name}] $message');
  }
  
  void logError(String message, [Object? error, StackTrace? stackTrace]) {
    log('ERROR: $message', LogLevel.error);
    if (error != null) debugPrint('Error: $error');
    if (stackTrace != null) debugPrint('StackTrace: $stackTrace');
  }
}

// Disposable mixin
mixin Disposable {
  final List<StreamSubscription> _subscriptions = [];
  final List<Timer> _timers = [];
  
  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }
  
  void addTimer(Timer timer) {
    _timers.add(timer);
  }
  
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    for (final timer in _timers) {
      timer.cancel();
    }
    _subscriptions.clear();
    _timers.clear();
  }
}

// Usage in BLoC
class ArticleBloc extends Bloc<ArticleEvent, ArticleState> 
    with Logger, Disposable {
  
  ArticleBloc() : super(ArticleState.initial()) {
    on<LoadArticles>(_onLoadArticles);
    
    // Add subscription for automatic disposal
    addSubscription(
      stream.listen((state) => log('State changed: $state')),
    );
  }
  
  Future<void> _onLoadArticles(
    LoadArticles event,
    Emitter<ArticleState> emit,
  ) async {
    try {
      log('Loading articles...');
      emit(state.copyWith(isLoading: true));
      
      final articles = await _repository.getArticles();
      emit(state.copyWith(
        isLoading: false,
        articles: articles,
      ));
      
      log('Articles loaded successfully: ${articles.length}');
    } catch (error, stackTrace) {
      logError('Failed to load articles', error, stackTrace);
      emit(state.copyWith(
        isLoading: false,
        error: error.toString(),
      ));
    }
  }
  
  @override
  Future<void> close() {
    dispose(); // Clean up resources
    return super.close();
  }
}

enum LogLevel { debug, info, warning, error }
```

**Advantages:**
- Code reuse without inheritance
- Multiple mixins can be combined
- Shared behavior across unrelated classes
- Composition over inheritance

---

### **6. Polymorphism**

Through interfaces/abstract classes (or common superclasses), you can treat many concrete classes uniformly.

```dart
// Base repository interface
abstract class Repository<T> {
  Future<List<T>> getAll();
  Future<T> getById(int id);
  Future<void> save(T item);
  Future<void> delete(int id);
}

// Concrete implementations
class ArticleRepository implements Repository<Article> {
  final DataSource _dataSource;
  
  ArticleRepository(this._dataSource);
  
  @override
  Future<List<Article>> getAll() => _dataSource.fetchArticles();
  
  @override
  Future<Article> getById(int id) => _dataSource.getArticle(id);
  
  @override
  Future<void> save(Article item) => _dataSource.saveArticle(item);
  
  @override
  Future<void> delete(int id) async {
    // Implementation for deletion
  }
}

class UserRepository implements Repository<User> {
  final UserDataSource _dataSource;
  
  UserRepository(this._dataSource);
  
  @override
  Future<List<User>> getAll() => _dataSource.fetchUsers();
  
  @override
  Future<User> getById(int id) => _dataSource.getUser(id);
  
  @override
  Future<void> save(User item) => _dataSource.saveUser(item);
  
  @override
  Future<void> delete(int id) => _dataSource.deleteUser(id);
}

// Polymorphic usage
class DataManager {
  final List<Repository> _repositories;
  
  DataManager(this._repositories);
  
  Future<void> refreshAllData() async {
    for (final repository in _repositories) {
      try {
        final data = await repository.getAll();
        print('Refreshed ${data.length} items from ${repository.runtimeType}');
      } catch (error) {
        print('Failed to refresh ${repository.runtimeType}: $error');
      }
    }
  }
}

// Usage
final dataManager = DataManager([
  ArticleRepository(apiDataSource),
  UserRepository(userDataSource),
]);
await dataManager.refreshAllData();
```

**Benefits:**
- Same interface, different implementations
- Flexible and extensible code
- Runtime behavior selection
- Easier testing and mocking

---

### **7. Composition Over Inheritance**

Rather than piling up widget subclasses, Flutter encourages composing small widgets together.

```dart
// Instead of deep inheritance, use composition
class ArticleCard extends StatelessWidget {
  final Article article;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final bool isFavorite;
  
  const ArticleCard({
    super.key,
    required this.article,
    this.onTap,
    this.onFavorite,
    this.isFavorite = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildImage(),
            _buildContent(),
            _buildActions(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              article.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FavoriteButton(
            isFavorite: isFavorite,
            onPressed: onFavorite,
          ),
        ],
      ),
    );
  }
  
  Widget _buildImage() {
    return ArticleImage(
      imageUrl: article.imageUrl,
      height: 200,
    );
  }
  
  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ArticlePreview(
        abstract: article.abstract,
        maxLines: 3,
      ),
    );
  }
  
  Widget _buildActions() {
    return ArticleActions(
      article: article,
      showShare: true,
      showBookmark: true,
    );
  }
}

// Composed widgets
class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onPressed;
  
  const FavoriteButton({
    super.key,
    required this.isFavorite,
    this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
      onPressed: onPressed,
    );
  }
}

class ArticleImage extends StatelessWidget {
  final String? imageUrl;
  final double height;
  
  const ArticleImage({
    super.key,
    this.imageUrl,
    required this.height,
  });
  
  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        height: height,
        color: Colors.grey[300],
        child: const Icon(Icons.image_not_supported),
      );
    }
    
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      height: height,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
```

**Advantages:**
- More flexible than inheritance
- Easier to test individual components
- Promotes reusability
- Simpler to understand and maintain

---

### **8. Generics**

Dart generics help you write type‑safe, reusable code (e.g. `Future<T>`, `List<T>`).

```dart
// Generic repository pattern
abstract class Repository<T> {
  Future<List<T>> getAll();
  Future<T?> getById(String id);
  Future<void> save(T item);
  Future<void> delete(String id);
}

// Generic result wrapper
class Result<T> {
  final T? data;
  final String? error;
  final bool isLoading;
  
  const Result._({
    this.data,
    this.error,
    this.isLoading = false,
  });
  
  factory Result.loading() => const Result._(isLoading: true);
  factory Result.success(T data) => Result._(data: data);
  factory Result.error(String error) => Result._(error: error);
  
  bool get isSuccess => data != null && error == null;
  bool get isError => error != null;
  
  // Transform result data
  Result<R> map<R>(R Function(T data) transform) {
    if (isSuccess) {
      return Result.success(transform(data!));
    } else if (isError) {
      return Result.error(error!);
    } else {
      return Result.loading();
    }
  }
  
  // Chain operations
  Future<Result<R>> then<R>(Future<Result<R>> Function(T data) operation) async {
    if (isSuccess) {
      return await operation(data!);
    } else if (isError) {
      return Result.error(error!);
    } else {
      return Result.loading();
    }
  }
}

// Generic cache implementation
class Cache<T> {
  final Map<String, CacheEntry<T>> _cache = {};
  final Duration _defaultTtl;
  
  Cache({Duration? defaultTtl}) 
      : _defaultTtl = defaultTtl ?? const Duration(hours: 1);
  
  void set(String key, T value, {Duration? ttl}) {
    _cache[key] = CacheEntry(
      value: value,
      expiry: DateTime.now().add(ttl ?? _defaultTtl),
    );
  }
  
  T? get(String key) {
    final entry = _cache[key];
    if (entry == null || entry.isExpired) {
      _cache.remove(key);
      return null;
    }
    return entry.value;
  }
  
  void clear() => _cache.clear();
  
  bool containsKey(String key) {
    final entry = _cache[key];
    return entry != null && !entry.isExpired;
  }
}

class CacheEntry<T> {
  final T value;
  final DateTime expiry;
  
  CacheEntry({required this.value, required this.expiry});
  
  bool get isExpired => DateTime.now().isAfter(expiry);
}

// Usage with specific types
final articleCache = Cache<Article>();
final userCache = Cache<User>(defaultTtl: const Duration(minutes: 30));

// Type-safe operations
articleCache.set('article_1', article);
final cachedArticle = articleCache.get('article_1'); // Returns Article?
```

**Benefits:**
- Type safety at compile time
- Code reusability
- Better IDE support and autocomplete
- Eliminates need for type casting

---

### **9. Extension Methods**

Add functionality to existing classes without subclassing:

```dart
// String extensions
extension StringExtensions on String {
  bool get isEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }
  
  String get capitalized {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
  
  String truncate(int length, {String suffix = '...'}) {
    if (this.length <= length) return this;
    return '${substring(0, length)}$suffix';
  }
}

// Widget extensions
extension WidgetExtensions on Widget {
  Widget padded([double padding = 8.0]) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
  
  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }
  
  Widget centered() {
    return Center(child: this);
  }
  
  Widget expanded([int flex = 1]) {
    return Expanded(flex: flex, child: this);
  }
}

// DateTime extensions
extension DateTimeExtensions on DateTime {
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);
    
    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} year${difference.inDays >= 730 ? 's' : ''} ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} month${difference.inDays >= 60 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
  
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}

// List extensions
extension ListExtensions<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
  T? get lastOrNull => isEmpty ? null : last;
  
  List<T> separated(T separator) {
    if (length <= 1) return this;
    
    final result = <T>[];
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i < length - 1) {
        result.add(separator);
      }
    }
    return result;
  }
  
  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) {
    final map = <K, List<T>>{};
    for (final item in this) {
      final key = keyFunction(item);
      map.putIfAbsent(key, () => []).add(item);
    }
    return map;
  }
}

// Usage examples
void examples() {
  // String extensions
  final email = 'user@example.com';
  print(email.isEmail); // true
  print('hello world'.capitalized); // Hello world
  print('Long text here'.truncate(8)); // Long tex...
  
  // Widget extensions
  Widget buildUI() {
    return Column(
      children: [
        Text('Title').padded(16),
        Text('Content').paddingOnly(left: 20, right: 20),
        Icon(Icons.star).centered(),
        Text('Footer').expanded(),
      ],
    );
  }
  
  // DateTime extensions
  final articleDate = DateTime.now().subtract(const Duration(hours: 2));
  print(articleDate.timeAgo); // 2 hours ago
  print(DateTime.now().isToday); // true
  
  // List extensions
  final numbers = [1, 2, 3, 4, 5];
  print(numbers.firstOrNull); // 1
  final articles = <Article>[];
  print(articles.firstOrNull); // null
  
  final words = ['apple', 'banana', 'apricot', 'blueberry'];
  final grouped = words.groupBy((word) => word[0]);
  // {'a': ['apple', 'apricot'], 'b': ['banana', 'blueberry']}
}
```

**Benefits:**
- Extend existing classes without inheritance
- Clean, readable code
- Method chaining support
- IDE autocompletion

---

### **10. Factory Constructors & Singletons**

Factories let you control instance creation (caching, conditional logic).

```dart
// Singleton pattern with factory constructor
class AppConfig {
  static AppConfig? _instance;
  
  final String apiUrl;
  final String apiKey;
  final bool isDebugMode;
  
  AppConfig._internal({
    required this.apiUrl,
    required this.apiKey,
    required this.isDebugMode,
  });
  
  factory AppConfig({
    required String apiUrl,
    required String apiKey,
    required bool isDebugMode,
  }) {
    _instance ??= AppConfig._internal(
      apiUrl: apiUrl,
      apiKey: apiKey,
      isDebugMode: isDebugMode,
    );
    return _instance!;
  }
  
  // Convenient factory constructors for different environments
  factory AppConfig.development() {
    return AppConfig(
      apiUrl: 'https://api-dev.example.com',
      apiKey: 'dev-key-123',
      isDebugMode: true,
    );
  }
  
  factory AppConfig.production() {
    return AppConfig(
      apiUrl: 'https://api.example.com',
      apiKey: 'prod-key-456',
      isDebugMode: false,
    );
  }
  
  static AppConfig get instance {
    if (_instance == null) {
      throw StateError('AppConfig must be initialized first');
    }
    return _instance!;
  }
}

// Factory pattern for different implementations
abstract class Logger {
  void log(String message);
  void error(String message, [Object? error]);
  
  factory Logger.console() = ConsoleLogger;
  factory Logger.file(String filePath) = FileLogger;
  factory Logger.remote(String endpoint) = RemoteLogger;
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print('[LOG] $message');
  }
  
  @override
  void error(String message, [Object? error]) {
    print('[ERROR] $message${error != null ? ': $error' : ''}');
  }
}

class FileLogger implements Logger {
  final String filePath;
  
  FileLogger(this.filePath);
  
  @override
  void log(String message) {
    // Write to file
  }
  
  @override
  void error(String message, [Object? error]) {
    // Write error to file
  }
}

class RemoteLogger implements Logger {
  final String endpoint;
  
  RemoteLogger(this.endpoint);
  
  @override
  void log(String message) {
    // Send to remote endpoint
  }
  
  @override
  void error(String message, [Object? error]) {
    // Send error to remote endpoint
  }
}

// Factory with caching
class HttpClient {
  static final Map<String, HttpClient> _cache = {};
  
  final String baseUrl;
  final Dio _dio;
  
  HttpClient._internal(this.baseUrl) : _dio = Dio(BaseOptions(baseUrl: baseUrl));
  
  factory HttpClient.forUrl(String baseUrl) {
    return _cache.putIfAbsent(baseUrl, () => HttpClient._internal(baseUrl));
  }
  
  Future<Response> get(String path) => _dio.get(path);
  Future<Response> post(String path, {dynamic data}) => _dio.post(path, data: data);
}

// Usage examples
void factoryExamples() {
  // Singleton usage
  final config1 = AppConfig.development();
  final config2 = AppConfig.development();
  print(identical(config1, config2)); // true - same instance
  
  // Factory pattern
  final logger = Logger.console();
  logger.log('Application started');
  
  // Cached factory
  final client1 = HttpClient.forUrl('https://api.example.com');
  final client2 = HttpClient.forUrl('https://api.example.com');
  print(identical(client1, client2)); // true - cached instance
}
```

**Use Cases:**
- Singleton pattern implementation
- Conditional object creation
- Instance caching and reuse
- Different configurations/environments

---

## 🔗 **Putting It All Together**

Flutter's architecture layers—widgets, render objects, elements—are themselves classes tied together via inheritance, composition, mixins, and abstraction. As you build apps, you'll naturally apply:

- **Encapsulation**: Private state management in widgets
- **Inheritance**: Custom widgets extending base classes  
- **Polymorphism**: State management APIs, repository interfaces
- **Mixins**: Logging, disposable resources, validation
- **Generics**: Streams, futures, type-safe collections
- **Composition**: Building complex UIs from simple widgets

### **Example: Complete Feature Implementation**

```dart
// Domain layer with abstraction
abstract class ArticleRepository {
  Future<Result<List<Article>>> getArticles();
  Future<Result<Article>> getArticle(int id);
}

// Data layer with inheritance and mixins
class NetworkArticleRepository 
    with Logger, Disposable 
    implements ArticleRepository {
    
  final HttpClient _client;
  final Cache<List<Article>> _cache;
  
  NetworkArticleRepository(this._client, this._cache);
  
  @override
  Future<Result<List<Article>>> getArticles() async {
    try {
      log('Fetching articles from network');
      
      // Check cache first (composition)
      final cached = _cache.get('articles');
      if (cached != null) {
        log('Returning cached articles');
        return Result.success(cached);
      }
      
      // Fetch from network (polymorphism)
      final response = await _client.get('/articles');
      final articles = (response.data as List)
          .map((json) => Article.fromJson(json)) // Generics
          .toList();
      
      // Cache result (encapsulation)
      _cache.set('articles', articles);
      
      log('Successfully fetched ${articles.length} articles');
      return Result.success(articles);
      
    } catch (error, stackTrace) {
      logError('Failed to fetch articles', error, stackTrace);
      return Result.error(error.toString());
    }
  }
}

// Presentation layer with state management
class ArticleBloc extends Bloc<ArticleEvent, ArticleState> 
    with Logger { // Mixin for logging
    
  final ArticleRepository _repository; // Abstraction
  
  ArticleBloc(this._repository) : super(ArticleState.initial()) {
    on<LoadArticles>(_onLoadArticles);
  }
  
  Future<void> _onLoadArticles(
    LoadArticles event,
    Emitter<ArticleState> emit,
  ) async {
    emit(state.copyWith(isLoading: true)); // Encapsulation
    
    final result = await _repository.getArticles(); // Polymorphism
    
    result.when( // Pattern matching
      success: (articles) {
        log('Loaded ${articles.length} articles');
        emit(state.copyWith(
          isLoading: false,
          articles: articles,
        ));
      },
      error: (error) {
        logError('Failed to load articles', error);
        emit(state.copyWith(
          isLoading: false,
          error: error,
        ));
      },
      loading: () {}, // Already handled above
    );
  }
}

// UI layer with composition
class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Articles'.text().centered()), // Extension methods
      body: BlocBuilder<ArticleBloc, ArticleState>( // Composition
        builder: (context, state) {
          if (state.isLoading) {
            return const CircularProgressIndicator().centered(); // Extension
          }
          
          if (state.error != null) {
            return ErrorWidget(
              error: state.error!,
              onRetry: () => context.read<ArticleBloc>().add(LoadArticles()),
            ).padded(); // Extension method
          }
          
          return ListView.builder( // Composition
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              return ArticleCard( // Composition
                article: state.articles[index],
                onTap: () => _navigateToDetail(state.articles[index]),
              ).padded(8); // Extension method
            },
          );
        },
      ),
    );
  }
  
  void _navigateToDetail(Article article) {
    // Navigation logic
  }
}
```

This example demonstrates all the OOP concepts working together in a typical Flutter application following Clean Architecture principles.

---

## 🎓 **Self-Assessment**

Before proceeding to the main modules, ensure you're comfortable with:

### **✅ Basic Concepts**
- [ ] Classes and objects
- [ ] Inheritance and method overriding
- [ ] Encapsulation and access modifiers
- [ ] Abstract classes and interfaces

### **✅ Advanced Concepts**
- [ ] Mixins and composition
- [ ] Generics and type safety
- [ ] Extension methods
- [ ] Factory constructors

### **✅ Practical Application**
- [ ] Can create custom widgets
- [ ] Understand widget composition
- [ ] Can implement interfaces
- [ ] Can use mixins effectively

### **✅ Dart-Specific Features**
- [ ] Understanding of `late` keyword
- [ ] Null safety concepts
- [ ] Future and Stream handling
- [ ] Pattern matching basics

---

## 🔗 **What's Next?**

Now that you have the foundation, let's set up your development environment:

**Next Module**: [Prerequisites & Setup](01-prerequisites-setup.md)

---

## 📚 **Additional Resources**

- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)
- [Object-Oriented Programming in Dart](https://dart.dev/guides/language/language-tour#classes)

---

**Ready?** With these fundamentals in place, you're prepared to tackle Flutter Clean Architecture! 🚀 