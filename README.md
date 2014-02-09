Summary
-------
The [Smarty](http://www.smarty.net/) purl parameter plugins are
used to handle GET URL parameters. They give
you an easy way for managing parameters for hyperlinks in the smarty template
files. The simplest scenario when working with GET parameters is when calling
a different php-script with the same parameters than the current URL, or 
slightly modifying the current parameters.

Here are two plugins to handle that situation. If you want to have a link to a
different document, with the exact same parameters than the current page, do:

	{ppurl path="other.php"}

That's all. So if the current URL was for example:

	main.php?sid=658474679697&print=1

the resulting URL of the above line is:

	other.php?sid=658474679697&print=1

Other things you can do are: substitute/delete/add keys, values, the path and add a prefix


Installation
------------
Drop all .php files into the Smarty plugin directory.

Demo / test case
----------------
To show off some the functionality, here is a [demo of smarty purl plugin](https://paul.spurious.biz/smarty-purl-plugin-demo/)

The two plugins require a common file with shared code.
The shared code was originally written by the author of Eclipse,
a PHP library with several really nice classes. I added support for []-style arrays in GET-strings and modified it slightly to fit into Smarty.


License
-------
shared.url_parameters.php: LGPL
the rest: MIT license

Author
------
Paul Kremer (pkremer !At! spurious !DOT! biz)
