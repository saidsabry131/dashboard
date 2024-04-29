class UserModel {
    // Fields to store user data
    final int id;
    final String name;
    final int age;
    final String grade;

    // Constructor for UserModel
    UserModel({
        required this.id,
        required this.name,
        required this.age,
        required this.grade,
    });

    // Method to convert UserModel to a map (e.g., for database insertion)
    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'name': name,
            'age': age,
            'grade': grade,
        };
    }

    
       // Method to create a UserModel from a map (e.g., for database retrieval)
    factory UserModel.fromMap(Map<String, dynamic> map) {
        return UserModel(
            id: map['id'],
            name: map['name'],
            age: map['age'],
            grade: map['grade'],
        );
    }
}
