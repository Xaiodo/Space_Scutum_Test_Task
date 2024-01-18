# Documentation for Space Scutum  Flutter test task 
## Project Setup:

Initialized a Flutter project via command `flutter create flutter_test_assignment`.
Added fonts and other assets for the app, configured theme in separate file.

## App structure
### lib/:

- #### bloc/:
Contains Business Logic Components (BLoC) for state management.

- #### database/:
Contains database-related files, including SQLite setup.

- #### models/:
Defines data models used in the application.
Example: building.dart, floor.dart.
presentation/:

- #### pages/:
Contains screen implementations.

- #### widgets/:
Contains reusable widgets used across different screens.

- #### notification
Implemented background notification for application.

- #### providers
Wrap application with provider widgets to efficiently manage the use of BLoCs and other dependencies throughout the entire app.

- #### repositories
Houses the data access layer of an application. 

- #### values 
Files in this folder hold various application-related constants and theme-related configurations.

## SqliteHelper 

**SqliteHelper** is an abstract class that provides methods for initializing and managing SQLite databases in a Flutter application. It includes functionality for creating tables and setting up the initial database structure.

### Database Schema:
Table name: Houses 

Columns:
- id: INTEGER (Primary Key, Autoincrement)
- name: TEXT
- floorCount: INTEGER
- selectedFloorNumber: INTEGER

### Public Methods:
- initDatabase():
Initializes the SQLite database.
Retrieves the path for storing databases on the device.
Opens the database using the openDatabase method from the sqflite package.
Calls the _onCreate method if the database is being created for the first time.
- _onCreate(Database db, int version):
A private method called during the creation of the database.
Executes a SQL query to create the houses table if it does not exist.
The houses table includes columns for id, name, floorCount, and selectedFloorNumber.

## House Cubit

**HouseCubit** is a Flutter Cubit that manages the state related to houses in an application. It encapsulates the business logic for fetching and adding houses.

### Class Structure

#### Constructor and parameters:
- repository: An instance of HouseRepository required for fetching and updating house data.
- In the constructor calls the getHouses method to fetch houses immediately upon cubit creation.
#### Public Methods:
- getHouses(): Fetches the list of houses from the repository and update the state.

## Lift Cubit

**LiftCubit** is a Flutter Cubit that manages the state and logic related to a lift within a house. It handles operations such as moving between floors, updating the lift's position in the last selected house, and scheduling background notifications.
### Class Structure

#### Constructor and parameters:
- repository: An instance of HouseRepository for managing house-related data.

- houseCubit: An instance of HouseCubit for communication with the house-related state.

- backgroundNotificationHandler: An instance of BackgroundNotificationHandler for scheduling background notifications.

- Calls the init method to set up the initial state.
#### Public Methods:

- init(): 
Initializes the state of the lift.
Sets the lift's position based on the selected house from _houseCubit.
- getFloorColor(int floor):
Returns the color of a floor based on the current state. Differentiates between the selected floor, the floor the lift is moving to, and transparent colors.
- moveBetweenFloors(int floor):
Moves the lift between floors.
Updates the state to reflect the lift's movement and schedules background notifications.
Calls _houseRepository to update the house's floor information.
Notifies _houseCubit of the updated house information.
scheduleNotification().
Calls _backgroundNotificationHandler to schedule a background notification.
Notifies the user that the lift has reached a specific floor.

## BackgroundNotificationHandler 

**BackgroundNotificationHandler** is a class responsible for interacting with the native platform to schedule background notifications in a Flutter application. It uses the MethodChannel to communicate with native code, specifically to invoke a method for scheduling notifications.

**platform**: A constant MethodChannel instance named after the method channel specified in AppConstants.methodChannelName.
Used for invoking native methods related to background notifications.

### Public Methods:
- showNotification(String title, String body) - 
Shows a background notification with the given title and body.
Invokes the native method named 'scheduleNotification' through the platform method channel.
Sends notification details as parameters, including title, body, and the scheduled time (1 minute from the current time). Background notification is implemented in Android side in Kotlin language.
