# 💾 Module 2: Models & Serialization

> **Master data modeling, JSON serialization, and code generation in Flutter**

---

## 🎯 **Learning Objectives**

After completing this module, you will:
- ✅ Create immutable data models with proper structure
- ✅ Implement JSON serialization with code generation
- ✅ Use Freezed for immutable classes and unions
- ✅ Handle nested objects and lists in JSON
- ✅ Generate and manage code efficiently

---

## 📚 **Understanding Data Models**

### **What are Data Models?**

Data models represent the structure of data in your application. They serve as:
- **Data Transfer Objects (DTOs)**: Moving data between layers
- **Entities**: Representing business objects
- **API Response Models**: Parsing JSON from external APIs

### **Key Principles**
- ✅ **Immutable**: Cannot be changed after creation
- ✅ **Type-safe**: Compile-time error checking
- ✅ **Serializable**: Can convert to/from JSON
- ✅ **Testable**: Easy to create test instances

---

## 🔧 **Project Models Structure**

### **Article Model**

Let's examine our main data model:

```dart
// lib/articles_list/data/model/article.dart
@JsonSerializable()
class Article {
  Article(this.title, this.abstract, this.id, this.url, this.publishedData, this.media);

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  final int id;
  final String title, abstract, url;
  
  @JsonKey(name: 'published_date')
  final String? publishedData;
  
  final List<Media> media;
}
```

### **Nested Models**

```dart
@JsonSerializable()
class Media {
  Media(this.caption, this.metaData);

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  @JsonKey(name: 'caption', defaultValue: '')
  final String caption;

  @JsonKey(name: 'media-metadata', defaultValue: <MediaMetaData>[])
  final List<MediaMetaData> metaData;

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable()
class MediaMetaData {
  MediaMetaData(this.url, this.format);

  factory MediaMetaData.fromJson(Map<String, dynamic> json) => _$MediaMetaDataFromJson(json);

  @JsonKey(defaultValue: '')
  final String url;

  @JsonKey(defaultValue: '')
  final String format;

  Map<String, dynamic> toJson() => _$MediaMetaDataToJson(this);
}
```

### **Response Wrapper**

```dart
@JsonSerializable()
class MostPopularResponse {
  MostPopularResponse(this.status, this.copyright, this.articles);

  factory MostPopularResponse.fromJson(Map<String, dynamic> json) => 
      _$MostPopularResponseFromJson(json);

  final String status;
  final String copyright;
  
  @JsonKey(name: 'results')
  final List<Article> articles;

  Map<String, dynamic> toJson() => _$MostPopularResponseToJson(this);
}
```

---

## 🎨 **JSON Serialization Deep Dive**

### **Basic Annotations**

#### **@JsonSerializable()**
Marks a class for JSON code generation:
```dart
@JsonSerializable()
class Article {
  // Class implementation
}
```

#### **@JsonKey()**
Customizes field serialization:
```dart
class Article {
  @JsonKey(name: 'published_date')          // Map to different JSON key
  final String? publishedData;
  
  @JsonKey(defaultValue: '')                // Provide default value
  final String caption;
  
  @JsonKey(defaultValue: <MediaMetaData>[]) // Default for lists
  final List<MediaMetaData> metaData;
  
  @JsonKey(ignore: true)                    // Skip serialization
  final String internalField;
}
```

### **Generated Code Analysis**

When you run code generation, these files are created:

```dart
// article.g.dart (Generated - Do Not Edit)
Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      json['title'] as String,
      json['abstract'] as String,
      json['id'] as int,
      json['url'] as String,
      json['published_date'] as String?,
      (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'abstract': instance.abstract,
      'url': instance.url,
      'published_date': instance.publishedData,
      'media': instance.media,
    };
```

---

## ❄️ **Freezed for Advanced Models**

### **Why Freezed?**

Freezed provides:
- ✅ **Immutable classes** with `copyWith` methods
- ✅ **Union types** for different states
- ✅ **Pattern matching** with `when` and `map`
- ✅ **Equality and hashing** automatically implemented

### **Error Handling with Freezed**

```dart
// lib/core/error.dart
@freezed
class Error with _$Error {
  const factory Error.httpInternalServerError(String errorBody) = HttpInternalServerError;
  const factory Error.httpUnAuthorizedError() = HttpUnAuthorizedError;
  const factory Error.httpUnknownError(String message) = HttpUnknownError;
  const factory Error.networkError(String message) = NetworkError;
  const factory Error.timeoutError() = TimeoutError;
}
```

### **Using Union Types**

```dart
// Pattern matching with error types
error.when(
  httpInternalServerError: (body) => 'Server error: $body',
  httpUnAuthorizedError: () => 'Please check your API key',
  httpUnknownError: (message) => 'Unknown error: $message',
  networkError: (message) => 'Network issue: $message',
  timeoutError: () => 'Request timed out',
);
```

### **State Management with Freezed**

```dart
@freezed
class ArticleListState with _$ArticleListState {
  const factory ArticleListState({
    @Default(false) bool isLoading,
    required Option<List<Article>> articles,
    Option<Error>? error,
  }) = _ArticleListState;

  factory ArticleListState.initial() => ArticleListState(articles: none());
}
```

---

## 🎯 **Hands-On Exercise**

### **Exercise 1: Create a User Model**

Create a new model for user data:

```dart
// TODO: Create lib/common/model/user.dart
@JsonSerializable()
class User {
  User(this.id, this.name, this.email, this.preferences);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String id;
  final String name;
  final String email;
  
  @JsonKey(name: 'user_preferences')
  final UserPreferences preferences;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserPreferences {
  UserPreferences(this.theme, this.categories, this.notifications);

  factory UserPreferences.fromJson(Map<String, dynamic> json) => 
      _$UserPreferencesFromJson(json);

  @JsonKey(defaultValue: 'light')
  final String theme;
  
  @JsonKey(defaultValue: <String>[])
  final List<String> categories;
  
  @JsonKey(defaultValue: true)
  final bool notifications;

  Map<String, dynamic> toJson() => _$UserPreferencesToJson(this);
}
```

### **Exercise 2: Add Fields to Article**

Extend the Article model with new fields:

```dart
// Add to Article class:
final String? author;
final String section;
final int wordCount;
final List<String> keywords;

// Update constructor and JSON mapping
```

### **Exercise 3: Create Freezed State Model**

Create a search state using Freezed:

```dart
@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = Initial;
  const factory SearchState.loading() = Loading;
  const factory SearchState.loaded(List<Article> articles, String query) = Loaded;
  const factory SearchState.error(String message) = SearchError;
  const factory SearchState.empty(String query) = Empty;
}
```

---

## 🔧 **Code Generation Workflow**

### **Development Workflow**

1. **Create/Modify Models**:
   ```dart
   @JsonSerializable()
   class NewModel {
     // Define your model
   }
   ```

2. **Run Code Generation**:
   ```bash
   # One-time generation
   flutter pub run build_runner build --delete-conflicting-outputs
   
   # Watch for changes (development)
   flutter pub run build_runner watch --delete-conflicting-outputs
   ```

3. **Import Generated Files**:
   ```dart
   part 'new_model.g.dart';  // For JSON serialization
   part 'new_model.freezed.dart';  // For Freezed models
   ```

### **Generated Files Overview**

| File Extension | Purpose | Generated By |
|----------------|---------|--------------|
| `*.g.dart` | JSON serialization | json_serializable |
| `*.freezed.dart` | Immutable classes | freezed |
| `*.config.dart` | DI configuration | injectable |
| `*.mocks.dart` | Test mocks | mockito |

---

## 🧪 **Testing Models**

### **Model Testing Strategy**

```dart
// test/unit-tests/models/article_test.dart
group('Article Model', () {
  test('should serialize to JSON correctly', () {
    // Arrange
    final article = Article(
      'Test Title',
      'Test Abstract',
      123,
      'https://example.com',
      '2023-01-01',
      <Media>[],
    );

    // Act
    final json = article.toJson();

    // Assert
    expect(json['title'], 'Test Title');
    expect(json['id'], 123);
    expect(json['published_date'], '2023-01-01');
  });

  test('should deserialize from JSON correctly', () {
    // Arrange
    final json = {
      'title': 'Test Title',
      'abstract': 'Test Abstract',
      'id': 123,
      'url': 'https://example.com',
      'published_date': '2023-01-01',
      'media': <Map<String, dynamic>>[],
    };

    // Act
    final article = Article.fromJson(json);

    // Assert
    expect(article.title, 'Test Title');
    expect(article.id, 123);
    expect(article.publishedData, '2023-01-01');
  });

  test('should handle null values gracefully', () {
    // Arrange
    final json = {
      'title': 'Test Title',
      'abstract': 'Test Abstract',
      'id': 123,
      'url': 'https://example.com',
      'published_date': null,  // Null value
      'media': <Map<String, dynamic>>[],
    };

    // Act
    final article = Article.fromJson(json);

    // Assert
    expect(article.publishedData, null);
  });
});
```

### **Freezed Model Testing**

```dart
group('Error Model', () {
  test('should create different error types', () {
    final networkError = Error.networkError('No connection');
    final serverError = Error.httpInternalServerError('Server down');

    expect(networkError, isA<NetworkError>());
    expect(serverError, isA<HttpInternalServerError>());
  });

  test('should pattern match correctly', () {
    final error = Error.networkError('No connection');
    
    final message = error.when(
      networkError: (msg) => 'Network: $msg',
      httpInternalServerError: (body) => 'Server: $body',
      httpUnAuthorizedError: () => 'Unauthorized',
      httpUnknownError: (msg) => 'Unknown: $msg',
      timeoutError: () => 'Timeout',
    );

    expect(message, 'Network: No connection');
  });
});
```

---

## 💡 **Best Practices**

### **Model Design Principles**

#### **✅ Do:**
```dart
// Immutable fields
class Article {
  final String title;
  final int id;
}

// Descriptive names
@JsonKey(name: 'published_date')
final String? publishedDate;

// Default values for optional fields
@JsonKey(defaultValue: <String>[])
final List<String> tags;

// Proper null safety
final String? optionalField;
final String requiredField;
```

#### **❌ Don't:**
```dart
// Mutable fields
class Article {
  String title;  // Should be final
  int id;       // Should be final
}

// Unclear field names
@JsonKey(name: 'pub_dt')
final String? pd;  // Unclear abbreviation

// Missing null safety
final String maybeNullField;  // Should be String?
```

### **JSON Handling Best Practices**

#### **Handle Missing Fields**:
```dart
@JsonKey(defaultValue: '')
final String description;

@JsonKey(defaultValue: <String>[])
final List<String> categories;
```

#### **Type Safety**:
```dart
// Use specific types instead of dynamic
final List<Article> articles;  // Not List<dynamic>
final Map<String, String> metadata;  // Not Map<dynamic, dynamic>
```

#### **Validation**:
```dart
@JsonSerializable()
class Article {
  Article(this.title, this.id) {
    if (title.isEmpty) throw ArgumentError('Title cannot be empty');
    if (id <= 0) throw ArgumentError('ID must be positive');
  }
  
  final String title;
  final int id;
}
```

---

## 🔍 **Debugging Models**

### **Common Issues and Solutions**

#### **Issue: Generation Fails**
```bash
# Error: Could not find a file named "lib/model/article.g.dart"
```
**Solution**: Run code generation:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

#### **Issue: JSON Parsing Error**
```dart
// Error: type 'String' is not a subtype of type 'int'
```
**Solution**: Check JSON structure and add proper type handling:
```dart
@JsonKey(fromJson: _parseId)
final int id;

static int _parseId(dynamic value) {
  if (value is String) return int.parse(value);
  if (value is int) return value;
  throw ArgumentError('Invalid ID format');
}
```

#### **Issue: Null Safety Violations**
```dart
// Error: A value of type 'Null' can't be assigned to a variable of type 'String'
```
**Solution**: Make fields nullable or provide defaults:
```dart
final String? optionalField;  // Nullable
@JsonKey(defaultValue: '') final String requiredField;  // Default value
```

---

## 🎓 **Knowledge Check**

### **Questions**:

1. **What's the difference between `@JsonSerializable()` and `@freezed`?**
2. **When should you use `@JsonKey(ignore: true)`?**
3. **How do you handle nested objects in JSON?**
4. **What files should never be edited manually?**

### **Practical Exercise**:

Create a complete model for a news comment system:
- Comment model with user, content, timestamp
- Reply model extending Comment
- Proper JSON serialization
- Freezed state for comment loading
- Unit tests for all models

---

## 🔗 **What's Next?**

Now that you understand data modeling, let's explore how to fetch this data from APIs:

**Next Module**: [Module 3: Networking & Data Sources](05-networking-data-sources.md)

---

## 📚 **Additional Resources**

- [JSON Serialization in Flutter](https://docs.flutter.dev/development/data-and-backend/json)
- [Freezed Package Documentation](https://pub.dev/packages/freezed)
- [JSON to Dart Converter](https://javiercbk.github.io/json_to_dart/)
- [Build Runner Documentation](https://pub.dev/packages/build_runner)

---

**Excellent!** You've mastered data modeling and serialization. Ready to fetch some data? 🚀 