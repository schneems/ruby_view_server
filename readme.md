# Pure Ruby HTML Generator

## What?

Part of my [UT on Rails course](http://schneems.com/ut-rails). Use pure ruby and standard libraries to perform a few basic functions to generate useful html pages using as little code as possible.

We gradually increase the complexity of the code as we add more functionality and make development simpler.

All code that starts with a `$` indicates it is running in the terminal. You should not copy the `$`.


## Git homework

There is homework associated with this demo, after each section you will need to complete the homework and then commit the results to git. Before you begin you will need a github account. Once you've got that come back to []() and click the "fork" button. That will create a fork of this code. Clone the code to your laptop by going to your fork copying in the git address and the in the command line running `git clone` like this:

    $ git clone https://github.com/.../... .git # replace the https... section with your own url (ends in .git)

Then go to the directory

    $ cd ruby_view_server

And open up this project in your favorite text editor. Follow along with instructions.


## Committing to GIT

Use this section as a reference to GIT.

To make commit changes go to the directory then run

    $ git add .

This will add your changes to the git repository, once you're happy with the changes commit it to the local repository with:

    $ git commit -m "homework section 1 completed"

To push your local changes to github you can run:

    $ git push origin master

Origin refers to the place where you cloned the code from (github) and master refers to the branch you're on.

Once you're done with the homework and it has been committed to your laptop, push it to your fork on Github. Then open a pull request. Your assignment will be graded from this pull request.


## Erb

ERB stands for Embedded RuBy. It is useful to use for embedding ruby code in html. Ruby goes inside of tags that look like this `<%= %>`. Here is an example you can run through in irb

    $ irb
    require 'erb'

    name = 'richard'
    erb_string = "<h2><%= name.upcase %></h2>"

    template = ERB.new(erb_string)
    puts template.result(binding)
    # => <h2>RICHARD</h2>


The flow for generating ruby powered html generally works like this. First we generate a document that is written in a html that has erb in it. These files typically have the extension `.html.erb`. We then read in the document, parse the erb and then we have fully valid html. We can do whatever we like with that such as write it to a static file or serve it dynamically with a server.

Erb blocks without the equals will not print out `<% %>` but will still be evaluated. You can use these for doing work such as math in your erb template.


## 1) Using ERB

In the terminal you can run

    $ ruby erb_example.rb

Homework:

Open the file in your favorite text editor to modify the file, and re-run it using ruby. Add at least 3 more lines and 3 more erb blocks with different types of contents, consider using strings, arrays, hashes, or integers.

Try modifying the data in the erb blocks using concatenation or other methods.

If you get errors try re-running the generator and reading the error messages. You can add debugging `puts` statements in your view or the script to help you figure out what is going on

Commit the results to git

## 2) Generate HTML with Ruby

In the terminal you can run

    $ ruby page_generator.rb

This will loop through all the files in the `views` directory, parse their erb and write the contents to the `public` directory.

Run the generator and drag a page from the `public` directory to your browser, it should render.

homework:

Add another file to the `/views` directory with your name. Add some personalized content directly to the file. Pretend this is geocities and you're making a home-page. Try using different tags such as `<div>`, `<p>`, `<span>`, or look up tags to use on w3c.

Use an array `[]` and the `each` method to output some content on your page in list items. For example:

    <ul>
      <% ['apples', 'oranges', 'bananas'].each do |fruit| %>
        <li>I like to eat <%= fruit %></li>
      <% end %>
    </ul>

After each change, you can run the generator and open this page in your browser.

If you get errors try re-running the generator and reading the error messages. You can add debugging `puts` statements in your view or the script to help you figure out what is going on.

Commit the results to git

## 3) Use a Layout to Add Content to All Pages

If you want to add some content to all the pages such as a header containing a global navigation or a footer containing copyright information it would be tedious to add this to each page. Such a task would not be very DRY (don't repeat yourself) since modifying one file would mean you need to modify many.

Instead we could have a header erb file and a footer erb file that we could join with the contents in our 'views` directory. This would make modifications simple.

Even better we can use a layout file. Here we've provided one in `layouts` with the name `application.html.erb`. This file provides an easy way to modify the page before or after the page content, and is very easy to edit since it is all in one place.

We are using the concept of **yielding** to a block with ruby, to insert our page contents into the middle of the layout file. If you look in the application file you will see `<%= yield %>` this is where the content for your pages goes. Blocks will be covered later, or you can look up some examples and see the code in `block_example.rb` if you're interested.


In the terminal you can run:

    $ ruby page_generator_with_layout.rb

This should take the contents of the files you modified in section #2 and output them again to the `public` directory, only now they have a layout. Drag one of them the browser.


Homework:

Modify the default layout. Add links to some websites in the header & footer. A link in html looks like this

    <a href="http://google.com">This is a link to google</a>

Re-run the `page_generator_with_layout.rb` file and then refresh your page. You should now see links and be able to click on them.

Now that you've got some working links, lets define a ruby method to help us make links in the future. Open up your layout (`application.html.erb`) and declare a function at the top of the file.


      <%
        def link_to(name, url)
            return "<a href='#{url}'>#{name}</a>"
         end
        %>

This function is named `link_to` and takes in a two parameters, the first is the name of the link and the last is the url you want to go to. You can replace the link to google above using `link_to` like this.


      <%= link_to('This is a link to google', 'http://google.com') %>

Add some links to your template using the link_to function you added to the template

If you get errors try re-running the generator and reading the error messages. You can add debugging `puts` statements in your view or the script to help you figure out what is going on.

Commit the results to git

## 4) Simple server

If we wanted to let other people see our web pages we would have to provide a way to get our html to their browser.
Since other computers will not have access to your file system we must make our content available, the easiest way to do this is to use a web server and provide content via a port. If that sounds hard don't worry, it isn't.  Ruby standard library comes with a  server called webrick. We can use this server to serve our html without providing direct access to our file system.

In the terminal you can run:

    $ ruby server_simple.rb

You should see an output that looks something like this:

    [2012-06-15 16:05:28] INFO  WEBrick 1.3.1
    [2012-06-15 16:05:28] INFO  ruby 1.9.3 (2012-04-20) [x86_64-darwin11.4.0]
    [2012-06-15 16:05:28] INFO  WEBrick::HTTPServer#start: pid=85507 port=8000

That means our server has started and is listening on port 8000. You can open up a new browser tab and go to [http://localhost:8000/index.html](http://localhost:8000/index.html) and you will see the contents of `public/html/index.html.erb` rendered in your browser. Open `server_simple.rb` in a text editor and take a look at the contents.


Homework:

To restart your server: you can use `CTL + C` to kill your server then restart it by pressing up and hitting enter)

1)
Try modifying a file in your `views` directory, are there any changes? If not, ask why. Try running the generator script again

    $ ruby page_generator_with_layout.rb

 Then refreshing your web page. Do you see your changes? Why were some of these steps necessary, were all of them needed?

 Any new changes to files in /public will be picked up by the server but if you change something in your /views (html.erb files) you will need to re-run the generator. After this homework, in next section we will automate this task.

2)
Rather than reading static files you can output any content you generate in ruby. Add this to `server_simple.rb` before the `server.start` line


    server.mount_proc '/' do |req, res|
      res.body = 'Hello, world!'
    end

If you restart your server and go to [http://localhost:8000](http://localhost:8000) you should see the contents `Hello, World!`.

Commit the results to git


## 5) Advanced Server

We started off reading in erb to generate static html, then we served static html using a server. In your homework you saw how we could serve content directly from ruby without need to write to a static html file. The next logical step would be to wire up the server to read in the erb template, parse it, and render the html dynamically without having to write to disk.

In the terminal you can run:

    $ ruby server_advanced.rb

This script looks in your `views` directory and reads in all the names of files, it then maps those names to urls you can reach by going to [http://localhost:8000/your_file_name_here](http://localhost:8000/your_file_name_here) such as [http://localhost:8000/index](http://localhost:8000/index). Once the server is running you can add some dynamic content such as

    <%= Time.now %>

This will display the current time. If you refresh your page your time should change.


## 6) Talking to your Server

You've been sending your server data and you didn't even know it. Whey you visit http://localhost:8000/index in the browser the server gets the url that you typed in and sees that you're looking for the `/index` path. What if we wanted our server to do something more interesting, send it more data, like a facebook status update...how do we do that?


### Methods of sending data to servers

You can use two methods of sending data to servers, links and forms. You can use simple buttons, but these are just forms with no  elements in them.

Forms have [many different field types](http://www.w3schools.com/html/html_forms.asp): text fields, password fields, radio buttons, checkboxes, and submit buttons just to name a few. While there are more complex inputs available like a google maps viewer, these either are built using simple form elements as a baseline or are crafted from scratch with javascript. 90% of the time you'll want to use standard elements and if you need some customization you can add it on top of the element using CSS or javascript. Think back to the facebook status update example, at it's core it's just a text area input and a button.

In this section we will add a simple text box and button asking visitors to enter their name we can then pull that data from the "request" object from the server and render a message to the user.

Since we're building the html from the server we have access to the request (req) local variable inside of our erb. If you look at the class of the req object you'll see it is a WEBrick::HTTPRequest, and if you search for WEBrick::HTTPRequest docs you will find the [WEBrick::HTTPRequest documentationn](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/webrick/rdoc/WEBrick/HTTPRequest.html). Here we see that if we call `query` on this object wee will get the query returned as a hash. In your layout add this somewhere:

        <%= @request.query.inspect %>

Now refresh the page, what do you see? Probably an empty hash `{}` try adding a query string on to the end of your url like [http://localhost:8000/index?cat=meow](http://localhost:8000/index?cat=meow). a query string is the stuff after the `?` at the end of a url, when you do a search on google this is how google gets the info.

You should now see `{"cat" => "meow"}` where you put you `@request.query.inspect`. When you see the data in a query string `?` it means the data was transfered by a GET request. You can even see that it was a GET request in the server log

        localhost - - [16/Jun/2012:16:47:03 CDT] "GET /index?cat=meow HTTP/1.1" 200 444

If you wanted to send data without exposing that via a query string you can do so using a POST request with a form. Add this to your layout:


        <form method='post' action="<%= @request.path %>">
            First name: <input type="text" name="first_name" placeholder='first name'/><br />
            <input type="submit" value="Submit" />
        </form>


Refresh the page, and enter your name, and hit 'submit'. This will send your name in a field called 'first_name' to the server, the server will then parse the erb, call `@request.query` and convert your query to a hash such as ` {"first_name"=>"richard"}` it will then convert the erb to html and server it back to your browser. You should now see your name in the view like this:

         {"first_name"=>"bar"}

Note, you will no longer be able to run the generator scripts or the simple server with <% req %> in your files.

Homework:

People like to feel welcomed when they visit a new web page, but they don't like random `{}` characters. Write some logic that if `@request.query['first_name'] && @request.query['first_name'].empty?` then don't show the query hash, otherwise show a welcome message that says their name, for example "Hello Richard". For example you could add this:


      <% if @request.query['first_name'] && !@request.query['first_name'].empty? %>
        Hello there <%= @request.query['first_name'] %>
      <% else %>
        Enter thy name
      <% end %>


In ruby only `nil` and `false` will evaluate as false see the data in `boolean_logic_cheatsheet.rb` in this project


Now add another field from [HTML Forms and Input](http://www.w3schools.com/html/html_forms.asp) such as radio button text area, or checkbox to your form. Now display this information to the users of your page.

Commit the results.

# Done

What did we just do? We started off turning erb (the ruby code) into html. We modified our files with ruby code and even had arrays (.each) generate lists for us. How cool is that! We got lazy and added a simple way to add a layout (application.html.erb) to our website. Then we learned how to serve static html pages with a simple server. Finally we saw how to generate truly dynamic content using the advanced server. It read in the erb files, generated html and returned that html directly to browsers without having to write it to a static file first. The advanced server even understands query strings in urls `?cat=meow` and how to manipulate html based on a `first_name` form.


You are an incredible person. Way to go! Understanding how to manipulate views in the context of a server is a large part of what Rails developers do every day.

Don't forget to push your changes back to your fork.

