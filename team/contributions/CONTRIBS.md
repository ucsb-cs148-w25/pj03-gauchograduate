**John Kim**:

What I worked on:

Scraping course data
cleaning course data
scraping prerequisite data
cleaning/ converting prerequisite data to json logic format
What the graph shows on github:

lower commits compared to other team members

Explanation of the graph on github:

Pair programming: Me and Kade frequently worked on parts of the project together in pair programming.

Trial and Error, Pivoting in data collection:

Instead of contributions shown in code, a lot of my time was spent researching web scraping tools, trial and error in OpenAI api prompting to get it to parse the prereq data correctly, and manually checking for incorrect OpenAI api responses. Additionally, we ran into issues where an initial batch of data from ucsbplat.com was not viable for parsing and then we had to pivot to ucsb GOLD. The unstructured problem of data scraping and cleaning led to less contributions shown on github but nonetheless the effort is shown in the data produced in the end.

Worked on displaying all required major courses on frontend

**Vala Bahrami**:

I built out the API functionality of the app, allowing for team members who were working on the frontend to communicate with the backend. I also set up the database schema for the app and configured our database provider, Supabase. I worked with other team members on the ideal storage format for the data, such as how we would represent a user's schedule and how we would represent a course requirement override. Beyond this, I worked on optimizing the frontend code, such as adding caching where possible to make the app load much faster, adding loading screens to make the app more responsive, and adding various frontend features like the "Saving" indicator, all contributing to responsive design. I also worked on resolving any bugs that popped up, such as bugs with the override implementation.

**Jaren Lowe**: 

The things I contributed / peer programmed with Taedon was primarily working on Google OAuth integration and establishing the connection between the frontend and backend. The contributions to linking the backend and frontend included implementing features that allowed users to select courses, populate their schedules, and input grades for completed courses. Additionally, I helped develop functionality for calculating and displaying students' grade point averages based on their entered grades. Much of this process involved creating new functions to handle fetch and get requests, ensuring that user data was properly updated and retrieved from the database. With the retrieved data, I also developed functions to dynamically update the frontend, enabling users to log in and out while preserving their previously entered information. Other contributions included implementing a redirect feature to guide new users to an update profile page.

**Chiran Arumugam**: 

In the first few sprints Selena and I worked on the design of the application and implementing the frontend with Tailwind CSS. I primarily worked on the frontend development for this project, pulling from the APIs in the backend to develop the application.

drag and drop functionality
course catalog searching and filtering
progress tracking and overriding
prerequisite mapping and display

**Selena Zeng**:

I first worked on designing the frontend through Figma by creating the branding (colors + hex codes) and a detailed wireframe of both the homepage (course catalog, four-year plan, and course progress) and the signin page, in both a laptop device size and a mobile device size. Then, I worked with Chiran to implement this in code -- I mainly worked on creating the Four-Year Plan section and the Course Progress section, implementing the progress bars and connecting it to the rest of the page so that courses get automatically checked off and units are automatically added to the progress once a course is dropped into the schedule. I then worked on fixing the UI for the signin page, making it more visually appealing. I created and designed our GauchoGraduate logo and added that to the navigation bar and the signin page. I worked on making the web application responsive and usable on all devices regardless of what size the screen is.

**Taedon Reth**:

The process of working with a sizeable team to bring a program to life through industry standards was completely new to me, so I mainly pair programmed with Jaren this entire quarter. Together, we were assigned a few overarching issues such as setting up authorization, saving students' schedules across logins, and updating the database to mimic what occurred on the front end. We mainly utilized API endpoints Vala set up to coordinate actions on the front end with data in the back end. In our pair programming sessions, Jaren and I worked on each task together; we would first focus on handling the logic for validating user authentication then work on ensuring that schedule data persisted correctly in the database. We regularly physically coding to make sure we both understood each part of the process and to maintain consistent progress. Beyond coding, I contributed to debugging sessions where we encountered mismatches between the frontend display and the backend data. This often required us to trace API calls and examine JSON payloads to find where updates were failing. Although I did not make as many direct commits as other team members like Vala or Chiran, many of my contributions were through collaborative work and refining shared code. For example, some of the commits under Jaren's name include code we worked on together while pair programming. Additionally, I helped lead a lot of the retros and stand ups, making sure we all understood what was due at the end of the week, and team dynamic checks.

**Kade Williams**:

In the first few sprints I worked with John to scrape/upload data into the backend database. Our program needs a database of every single class offered in every single quarter and the more information we can provide the better.

The first major tasks we worked on were:

using the UCSB API to get the data
turning the UCSB data into a format to store in our database
uploading the UCSB data into our Postgres database
More recently I have worked to get the pre-req data so that our web-app can warn users when class pre-reqs have not been met. This included:

Creating a selenium python script to scrape the data from GOLD
Using an OpenAI calls to parse the scraped JSON table into our custom logic format
Upload our custom logic format to the Postgres database
