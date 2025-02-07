## MVP Follow Up
We got a lot of cool feedback from classmates about our team's project. Here's an overview:

### Feedback Grouped and Sorted
Common Themes in App Purpose:
1. The vast majority of users correctly understood that this is a 4-year course planner for UCSB students
2. Users consistently recognized the graduation tracking functionality
3. Many understood it's specifically aimed at helping students graduate on time

Most Appreciated Features:
1. Drag and Drop Implementation
   - This was consistently mentioned as a favorite feature
   - Users found it intuitive and user-friendly

2. UI/Dashboard Design
   - The interface received widespread praise for being clean and polished
   - Many appreciated the visual layout of quarters

3. Graduation Progress Tracking
   - The progress circle/percentage display was frequently highlighted
   - Users liked the real-time updates as courses are added

Common Suggestions/Areas for Improvement:

1. Course Availability Features
   - Add information about which quarters specific courses are typically offered
   - Include historical data about course availability
   - Show likelihood of courses being offered in specific quarters

2. Integration and Automation
   - Connect with GOLD for automatic progress tracking
   - Import completed courses automatically
   - Pull graduation requirements directly from GEAR

3. Major/Minor Specific Features
   - Add support for double majors
   - Include minor tracking
   - Provide major-specific course suggestions
   - Add preset templates based on major requirements

4. Additional Planning Features
   - Include prerequisite tracking
   - Add alternative course suggestions if classes fill up
   - Include professor information and teaching schedules
   - Add GPA calculation features

Overall Sentiment:
The feedback is predominantly positive, with users seeing clear value in the application. The UI and core functionality (drag-and-drop, progress tracking) are working well. The main suggestions focus on adding more automated features and making the planner more comprehensive in terms of major requirements and course availability information.

### Response Actions
1. Major-Specific Templates/Presets
- Multiple users suggested having default course plans based on GEAR requirements
- This would reduce initial setup time for students
- Could include:
  - Core course requirements automatically populated
  - Common course sequences for each major
  - Required GE courses pre-mapped
  - Suggested elective paths
- This would give students a starting point they can then customize

2. Course Availability Data
- Strong user desire for historical course offering patterns
- Users want to know:
  - Which quarters specific courses are typically offered
  - Historical likelihood of course availability
  - Traditional teaching patterns (which professor teaches when)
- Could help students make more realistic plans
- Would prevent planning for courses in quarters they're never offered

3. GOLD Integration
- Users want automatic synchronization with their GOLD data
- Integration possibilities:
  - Import completed courses and grades
  - Pull current progress toward degree
  - Sync major/minor requirements
  - Show real-time course availability
- Would reduce manual data entry and keep plans current

4. Multiple Major/Minor Support
- Need to accommodate more complex degree paths
- Features needed:
  - Tracking progress for multiple majors simultaneously
  - Showing overlap between major requirements
  - Separate progress tracking for each major/minor
  - Different graduation requirement sets
- Important for students pursuing multiple degrees or adding minors

5. Detailed Requirement Tracking
- Users want more granular progress tracking
- Should include:
  - Prerequisite checking and warnings
  - GE requirement tracking by category
  - Unit counting by requirement type
  - Major-specific course requirements
  - Clear indication of which requirements each course fulfills
- Would help students ensure they're meeting all graduation requirements

Each of these improvements would make the planner more comprehensive and useful for a wider range of student needs. The feedback suggests that while the current UI and basic functionality are strong, adding these features would make the tool more practical for real-world use cases.

### Next Steps
Here's some next sprints we brainstormed for the rest of the quarter:

1. Data Model Enhancement (Sprint 1)
   - Expand course model to include offering patterns and prerequisites
   - Design major requirement templates structure
   - Create parsers for GEAR requirements

2. Major Template System (Sprint 2)
   - Build default 4-year plans for each major
   - Implement template selection and customization
   - Add bulk course planning from templates

3. Multi-Major Support (Sprint 3)
   - Extend user profiles for multiple majors/minors
   - Create requirement tracking for multiple degree paths
   - Implement requirement overlap detection

4. Course Availability Features (Sprint 4)
   - Add historical offering pattern display
   - Implement quarter availability warnings
   - Create professor teaching history view

5. GOLD Integration Research (Sprint 5)
   - Investigate API capabilities
   - Design sync architecture
   - Plan data transformation approach

Each sprint should include documentation updates, testing, and code review. Priority should be maintaining current UI performance while adding these features.