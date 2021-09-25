#  Alberto's - Restaurant Menu

Development of Alberto's ordering app as described in the book 
[Test-Driven Development in Swift](https://tddinswift.com) by Gio Lodi.

## Building the Menu

The menu is to be displayed as a number of dishes (which will be referred to as 
items) in a list which is grouped by different categories (such as starters, 
pastas, drinks and desserts).

### Menu Grouping Requirements

Given a collection of menu items, we pass these to a method that will return 
this as a collecton of categories, with each category containing a collection 
of items.

It is a matter of preference, but I prefer to state the requirements for each 
test as the message parameter of the assertion. For the three initial tests, 
these can be stated as:

* Menu grouping for a menu with no items _**shall**_ have no groups.
* Menu grouping for a menu with items in one category _**shall**_ have one 
group.
* Menu grouping for a menu with items in several categories _**shall**_ shall 
return items grouped by those categories. 
