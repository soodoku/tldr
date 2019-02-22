## How to Write Documentation for People that Don't Read

People don't read on the Internet but scan. They scan for:

1. Beginnings of paragraphs
2. Bulleted lists
3. Variation in fonts, e.g., bold, italics, color, etc.
4. Code snippets

And they ignore stuff:

1. that looks like an ad
2. is above/below a code snippet. (People would rather copy and paste the code, try, and fail.)

When writing documentation, address how people scan documentation. Do the following:
1. Break up text often
2. Pay special attention to the first 3--5 words
3. Stick with 65--90 chars per line so that people don't have too many 'fixations' per line
4. Write code snippets with information about issues people may face---how to install stuff, etc.

This covers writing. But that's not all. You also need to pay attention to how people search. Users are bad at searching. People use specific words and don't know how to rephrase. And they are not always able to find the solution if the problem is phrased in a different way. (Some of the barriers to search may have been made moot by word2vec, but not all.) Read through support queries, Google Analytics search logs, etc. to see what terms are being used. Create multiple pages that different ways people describe the problem and link to the same solution. (Stackoverflow does that apparently.)

The third rule is to reach people where they are. If StackOverflow is where people go, provide questions and answers there. 

The fourth rule is to use SEO. Tweak your site so that you 'win' searches for how to solve issues with your product. Do not put documents behind a login page or a paywall. Do not put documents in a pdf. And where possible, use the Google Guide to optimize further.

Lastly, try to reduce the number of searches for errors in the first place. Write thoughtful warnings that clearly explain the underlying issue and provide a way to fix them. Monitor errors being searched for, optimize the warnings and code in response to that.
