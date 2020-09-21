## The Art of Readable Code

### Surface-level improvements

* Picking good names
  * specificity:
    * appending unit, for instance, ```_ms```
    * Many security exploits come from not realizing that some data your program receives is not yet in a safe state. For this, you might
      want to use ```untrustedUrl``` or ```unsafeMessageBody```
  * General Notes:
    * project-specific abbreviations are usually a bad idea
    * long names w/ auto-complete are possible
    * Having different formats for different entities is like a form of syntax highlighting — it helps you read the code more easily. Most of the formatting in this example is pretty common — using CamelCase for class names, and using lower_separated for variable names.




* Writing good comments

* Formatting code
