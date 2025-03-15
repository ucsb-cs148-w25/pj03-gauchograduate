# Project
GauchoGraduate 

## Deployment
View the current state of the app at https://gauchograduate.vercel.app

## Description
UCSB course planner for graduation.

### Group Members
| Name            | GitHub ID       |
| --------------- | --------------- | 
| John Kim        | JohnKim04       | 
| Jaren Lowe      | JLowe32         |
| Kade Williams   | kadew           |
| Chiran Arumugam | ChiranArumugam  | 
| Selena Zeng     | selenazeng1     |
| Tadeon Reth     | taedonreth      |
| Vala Bahrami    | Va1a            | 

## Installation
### Prereqs
This webapp is built using Next.js on Typescript.
Install Node (v23.6.0) and NPM (v10.9.2) first.

### Dependencies
```
├── @auth/prisma-adapter@2.7.4 - The Prisma ORM is how we interface with our Postgres DB.
├── @emotion/react@11.14.0  - Used for some of our components, allows for styling with JS.
├── @emotion/styled@11.14.0 - Is a way to create React components that have styles attached to them.
├── @eslint/eslintrc@3.2.0 - ESLint linter to ensure TS best practicies.
├── @mui/icons-material@6.4.2 - Icons we use in the webapp.
├── @mui/material@6.4.2 - More styles/icons we use in the webapp.
├── @prisma/client@6.2.1 - The Prisma client is part of the Prisma ORM.
├── @tanstack/react-query@5.66.0 - Used for caching key information on the client, like course lists.
├── @types/node@20.17.14 - Typescript types for Node.js
├── @types/react-dom@19.0.3 - Typescript types for react
├── @types/react@19.0.7 - Ditto
├── eslint-config-next@15.1.6 - The eslint config for Next.js projects.
├── eslint@9.18.0 - The ESLint linter.
├── next-auth@4.24.11 - NextAuth, our OAuth framework for Google OAuth.
├── next@15.1.6 - Next.js , our webapp framework.
├── postcss@8.5.1 - Similar to Emotion, another CSS/JS integrated styling tool.
├── prisma@6.2.1 - Once again, Prisma is our ORM.
├── react-circular-progressbar@2.1.0 - A component we use for the stylish progress bar.
├── react-to-print@3.0.5 - The library we use to generate printable planners.
├── react-dom@19.0.0 - React, our frontend framework.
├── react@19.0.0 - Ditto.
├── tailwindcss@3.4.17 - Tailwind, our styling framework.
└── typescript@5.7.3 - Typescript, the language the app is written in.
```
Note that these are only layer 0 dependencies, that is dependencies directly installed by us. For all the necessary packages, you must use `npm ci` to install the complete list of dependencies from the package.json file.

### Installation Steps
Install all dependencies by running `npm ci` in the `gauchograduate/` directory. This will use the package.json file to install all dependencies. If there are issues with `npm ci`, you may use `npm install --legacy-peer-deps` to fix broken dependencies.

### Functionality
To use the app, navigate to https://gauchograduate.vercel.app , and sign in with your UCSB account. You can now drag and drop courses into the course planner and see your graduation progress. Select the year you would like to drop courses into in the planner section to see all four years of your University journey. You can also update your profile to edit personal details such as your major.

### Known Problems
- Specific major course overrides are not recognized as completed prerequisites.

### License
Our license is in the LICENSE.md file, it is the GNU General Public License v3.0

#### App Type 
Web App

###### Tech Stack
React, Next, Postgres, UCSB API, Google OAuth

###### Expanded Description
Easier to use alternative compared to gold, so that students can plan their 4 year graduation course load. Gold's current feature only allow for planning one quarter in advance once the registration opens. Our app aims to allow students to have easier course planning in future quarters and make it easier to follow with more straightforward features. Students can put in their major and create a personal 4 year plan making sure it follows the requirements. Should be easier and quicker to use compared to GOLD.

###### User Roles
- GauchoGraduate will have two types of users: Students, that are able to create their course plan. Faculty, that are able to edit and review the students course plan.

###### Roles and Permission
- Restricting the user base to @ucsb.edu. Allows us to reach only our target audience, which is UCSB students.
- Goals for Faculty : Review Course Proposals and long-term student schedules in one place. Provide better academic advice by visualizing progress toward degree completion.
- Goals for Student : Create 4 year plan scheduling. Have an easy and simple time when creating schedule.

  




