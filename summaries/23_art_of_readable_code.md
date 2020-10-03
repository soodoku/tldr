## The Art of Readable Code

Objective: code should be easy to understand.
GS addition: By other reasonably competent programmers coming fresh to the code.

### Traditional Virtues of Code

1. Compactness
2. Efficiency
3. Well 'architected'
4. Easy to test

### Surface-level improvements

* **Picking good names**

  * **Be specific:**
    * size() for binarytree vs. n_nodes() or height() or mem_bytes()
    * in PHP, there is explode() and split() --- can't tell what is diff. and why
      - split uses regex while explode a string delimiter but badly named

    * **Don't use generic temp placeholders**
      * don't use tmp, retval, foo, df1, df2, ...

    * attach imp. attributes to names:
      * password -> plaintext_password, encrypted_password, ...
      * html -> html_utf8
      * appending unit of measurement, for instance, ```_ms```

    * **Lose unneeded words:**
      * ConvertToString() -> ToString()

    * **Don't use ambiguous words:**
      * filter() -> exclude or include filter(cust_id > 100) means .... select() or exclude() are clearer
      * clip(text, length) -> removes x from the end or truncates to x_char
        * try truncate(text, max_char) (because even length is ambiguous)
      * cart_too_big_limit = 10 (is 10 inclusive or is it less than 10)
        * use max and min for inclusive limits
      * for iterating over inclusive ranges, rather than start/stop (stop can be ambiguous), use first, last

     * **Naming Booleans: What is being evaluated**
          * read_password as Bool is tricky.
            * replace w/ need_password and user_is_authenticated bools
          * bool_names: is, has, can, should make bools clearer
          * spaceleft() vs. hasspaceleft()

    * **Don't Violate expectations**:
        * programmers expect size() etc. to run efficiently. don't use the name for an expensive function.
        * don't use i, j, etc. for other than loop iteration
          * when possible don't iterate loops w/ i, j, k and use something more specific: user_i, accounts_j

    * **project-specific abbreviations are usually a bad idea**
      * e.g., BEManager for BackendManager, etc.

  * **General Notes:**
    * variable name is like a tiny comment
    * long names w/ auto-complete are possible
      *  shorter names ok for shorter scope
    * Having different formats for different entities is like a form of syntax highlighting — it helps you read the code more easily. e.g., using CamelCase for class names, and using lower_separated for variable names.

* **Aesthetics:**
  * consistent formatting
    * use helper methods to clean up formatting issues
    * column alignment
    * benefit = mistakes easier to see when things lined up

  * pick a consistent order in which you handle things
    * say you will get arguments in alphabetical order or input field or most_imp to least_imp

  * group related lines into blocks
    * var. declarations for db_helpers separated from handlers like viewprofile etc.

  * SQL style guide: https://gist.github.com/fredbenenson/7bb92718e19138c20591
  * R style guide: http://adv-r.had.co.nz/Style.html
  * Python style guides: https://www.python.org/dev/peps/pep-0008/ or https://google.github.io/styleguide/pyguide.html

* **Writing good comments**

  * **When not to comment:**
    * Don't comment on facts that can be derived quickly from the code itself.
    * Don't comment bad names. Fix the names.

  * **Useful Comments:**

    * **Director's commentary: why you chose X**
      * BinTree was 40% faster than hash table.
      * Also has the virtue of 'Anticipate questions' --- an important reason for commenting

    * **Flaws**
      * This heuristic may miss some cases but it is ok

    * **Notes for the Future**
      * this is messy.

    * **How the code shouldn't be used**

    * **Big picture comments:**
        * This looks complicated but it is a smart cache. It doesn't know anything about the rest of the system.
        * Here's a more convenient interface to our file system

    * **Summarizing the logic of a big chunk**
      * Depending on the need, comment the why, how, and the what

    * **Create a Typology:**
      * FIXME, TODO, HACK, XXX (major problem), etc.

    * **General Notes**
      * Be precise in describing the functionality, don't use ambiguous pronouns
        * count lines vs. count newline bytes
      * State the intent of the code with code as redundancy check

### Simplifying Loops and Logic

  * **Making Control Flow Easy to Read**

    * **order of arguments in conditionals**
      * left = variable whose value is more in 'flux'
      * right = variable whose value is more constant
      * ```bytes_received < bytes_expected```

    * **avoid do statements; do/while loops.**
      * logical conditions generally above the code they 'guard' but not with do/while

    * **avoid goto statements**
      * ideally we want a single exit point so that code at the bottom is called
      * use ```try finally``` or ```with```

    * **reduce nesting**
      * by returning early

  * **Break down giant expressions**
    * use variables to capture diff. part of the expression
    * use de morgan's laws to make boolean expressions more readable
      ```
      if (!(file_exists && !is_protected)) Error("Sorry, could not read file.");
      It can be rewritten to:
      if (!file_exists || is_protected) Error("Sorry, could not read file.");
      ```
    * don't abuse short circuit logic:
      * in most prg. lang. if (a || b) won't evaluate b if a is TRUE. don't use it to pad b.
      ```
      assert((!(bucket = FindBucket(key))) || !bucket->IsOccupied());
      ```

  * **Variables and Readability**
    * Hard to keep track of a lot of variables
      * Reduce the number of variables
        * Don't have intermediate variables.
        * Shrink the scope of variables
        * static methods
        * smaller classes within larger classes

    * Prefer write-once variables

### Reorganizing Your Code

* Extract unrelated sub-problems and put them in separate files (utils.py) or other functions
  * What is the high-level goal of a function? Is each line solving that or belongs to an unrelated subproblem. If enough lines solving an unrelated subproblem, create a  function.

* If interface isn't clean, build a clean wrapper

* Describe your code in simple words first and then use it to write the solution

* Remove unused code

* Familiarize yourself with libraries so that you aren't duplicating

### Make Tests Easy to Read and Maintain

* Make error messages readable
  * rather than assert() which gives cryptic error message, use better assert statements like assertEqual() for build your own
* Keep input values 'simple'--simplest to get the job done
  * if aim is large negative int, rather than -9997, use -10000
* Naming test functions
  * test_whatfunctionisbeingtested_situationitisbeingtestedin
  * test_softandfilterdocs_basicsorting
* Testable code:
  - doesn't use too  many global variables (as hard to understand impact on various functions)
  - decoupled classes
  - classes/functions do one thing
  - well defined interfaces
