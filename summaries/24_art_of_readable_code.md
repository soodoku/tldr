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

  * be specific
    * size() for binarytree vs. n_nodes() or height() or mem_bytes()
    * in PHP, there is explode() and split()
      - split uses regex while explode a string delimiter but badly named
    * don't use tmp, retval, foo, df1, df2, ...
    * don't use i, j, etc. for other than loop iteration
    * when possible don't iterate loops w/ i, j, k and use something more specific: user_i, accounts_j

    * attach imp. attributes to names:
      * password -> plaintext_password, encrypted_password, ...
      * html -> html_utf8
      * appending unit of measurement, for instance, ```_ms```

    * Lose unneeded words: ConvertToString() -> ToString()

    * Don't use ambiguous words:
      * filter() -> exclude or include filter(cust_id > 100) means .... select() or exclude() are clearer
      * clip(text, length) -> removes x from the end or truncates to x_char
        * try truncate(text, max_char) (because even length is ambiguous)
      * cart_too_big_limit = 10 (is 10 inclusive or is it less than 10)
        * use max and min for inclusive limits
      * for iterating over inclusive ranges, rather than start/stop (stop can be ambiguous), use first, last

      * read_password as Bool is tricky. replace w/ need_password and user_is_authenticated bools
          * bool_names: is, has, can, should make bools clearer
          * spaceleft() vs. hasspaceleft()

      * programmers expect size() etc. to run efficiently. don't use the name for an expensive function.

  * General Notes:
    * variable name is like a tiny comment
    * project-specific abbreviations are usually a bad idea, e.g., BEManager for BackendManager, etc.
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

  * When not to comment:
    * Don't comment on facts that can be derived quickly from the code itself.
    * Don't comment bad names. Fix the names

  * Useful comments:
    * Director's commentary: why you chose this vs. that.
      * BinTree was 40% faster than hash table.
      * Also has the virtue of 'Anticipate questions' --- an important reason for commenting
    * Flaws:
      * This heuristic may miss some cases but it is ok
    * Note for the Future:
      * this is messy. idea = use Y to fix it
    * Typology:
      * FIXME, TODO, HACK, XXX (major problem), etc.
    * How the code shouldn't be used
    * Big picture comments:
      * This looks complicated but it is a smart cache. It doesn't know anything about the rest of the system.
      * Here's a more convenient interface to our file system
    * Summarizing the logic of a big chunk
    * Depending on the need, comment the why, how, and the what
    * **Imp.** Be precise in describing the functionality, don't use ambiguous pronouns
      * count lines vs. count newline bytes
    * State the intent of the code with code as redundancy check

* **Simplifying Loops and Logic:**
  * order of arguments in conditionals
    * left = variable whose value is more in 'flux'
    * right = variable whose value is more constant
    * bytes_received < bytes_expected

  * for ifelse:
    * deal with +ve cases first than negative
    * simpler before more complex
