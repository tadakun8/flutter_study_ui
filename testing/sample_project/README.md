# sample_project

A project for myself to learn about testing in Flutter.

## Apps Feature

- It is based on the counter application that is created when you hit the `flutter create XXX` command.
- After pressing the button five times, the album list page will appear.
- The album information is acquired from the following API
  - https://jsonplaceholder.typicode.com/albums/

## Demo

![sample_project_for_testing](https://user-images.githubusercontent.com/64715484/141603435-b1513839-291c-4165-afa1-15c046f74c5a.gif)

## Unit Test

Tested that the intended output comes out when given arbitrary input.

Unit testing in flutter is no different than any other programming language.

## Widget Test

I struggled to understand Widget Test. In particular, what aspects to test.

From my experience with this project, here are some perspectives that I think should be tested.

### Four aspects of the Widget test

#### The Widget should be built correctly

- This perspective is the most important perspective.
- However, you don't need to be aware of this, because it is always checked by `pumpWidget()` in Widget Test.

#### The intended value should be displayed in the widget

- The text should be displayed correctly when initially displayed
- Also test if, for example, the widget changes the content of the text when the button is pressed

#### The page should transition correctly under certain conditions

- For widgets that perform page transitions, perform a page transition (e.g., press a button) to see if the target Page Widget is displayed.

#### When a Widget is nested, the lower Widget should be displayed

- For example, let's consider a test for an PageWidget
- PageWidget uses ComponentWidget as a component.
- This means that the ComponentWidget is the lower widget
- In this case, one of the test aspects of PageWidget is to make sure that the Component Widget is displayed.
  - Personally, I don't think it is necessary to test the value displayed in ComponentWidget in Widget Test for Page
  Widget.
  - Because I believe that is the scope of the Widget Test for ComponentWidget.

