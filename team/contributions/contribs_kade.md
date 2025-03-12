In the first few sprints I worked with John to scrape/upload data into the backend database. Our program needs a database of every single class offered in every single quarter and the more information we can provide the better.

The first major tasks we worked on were:
- using the UCSB API to get the data
- turning the UCSB data into a format to store in our database
- uploading the UCSB data into our Postgres database

More recently I have worked to get the pre-req data so that our web-app can warn users when class pre-reqs have not been met.
This included:
- Creating a selenium python script to scrape the data from GOLD
- Using an OpenAI calls to parse the scraped JSON table into our custom logic format
- Upload our custom logic format to the Postgres database
