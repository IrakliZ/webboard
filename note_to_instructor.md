## Firstly:

We were unable to get the real time collaboration working so we decided to make it so that our application is
an online "editor" where you can use simple drawings to brainstorm.

## Secondly:

After finishing the project, we pushed it to heroku, upon testing the site on heroku, we realized that heroku
does not allow large strings (more than something around 300 characters, which is ridiculous because that is
not a large string!) to be posted to the database with a free account, it takes less than a second to post 
something around 200 characters, but once it goes over some limit, the ajax does not succeed, it just throws 
an error. Only things that can be saved on heroku is really tiny line on the board, otherwise it times out.
Everything else works, the drawing, etc, it is just the saving that fails. Everything works like a charm on 
a local machine though, no timouts. I sent you an email about this issue in case you wanted a bit more info.
