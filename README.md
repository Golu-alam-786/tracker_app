
1. **Inactivity Handling:**
The app includes an InActivityController that handles user inactivity.
It starts a timer when the user becomes inactive, and if no activity is detected within one minute,
a countdown of 30 seconds begins. If the countdown reaches zero, the user is automatically logged out.
User activity is reset whenever the user interacts with the screen, such as tapping or scrolling.

2. **State Management:**
The HomeScreen and LoginScreen are stateful widgets that manage user interactions.
The HomeScreen uses the InActivityController to control inactivity and logout behavior.

3. **Navigation:**
Navigation between screens uses the screenPushReplacement method from a custom AppWidgets class
to replace the current screen with the target screen. This approach prevents users from 
navigating back to the previous screen using the back button.

4. **Validation:**
The LoginScreen uses a form with basic validation to ensure the user inputs a valid username
before proceeding to the HomeScreen. The username is passed to the HomeScreen to personalize the experience.

5. **Custom Widgets:**
The AppWidgets class is utilized to centralize the creation of common UI components like text fields and buttons,
6. promoting code reusability and cleaner UI code.