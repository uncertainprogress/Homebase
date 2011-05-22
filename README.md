Homebase
===========

Homebase provides the ability to store, retrieve, and delete files in the user's home directory. Everything's stored in a hidden folder titled <.appname>.

Features
--------

* Allows you to create, access, and delete files stored in a hidden folder in the user's home directory

Examples
--------

    require 'homebase'
		
		Homebase.set_app("your_app_name") #creates the directory if it doesn't exist
		Homebase.create_file('newfile')
		Homebase.create_file('newfile')
		filepath = Homebase.get_file_path('newfile')
		Homebase.delete_file('newfile')
		
		Homebase.delete_app('your_app_name')

Requirements
------------

None

Install
-------

gem install homebase

Author
------

Original author: Jeremy Witmer

License
-------

The MIT License

Copyright (c) 2011 Jeremy Witmer

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
