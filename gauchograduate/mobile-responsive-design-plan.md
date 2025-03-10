# Mobile Responsive Design Implementation Plan

## Current State Analysis
The current implementation has a three-panel layout (Course Catalog, Four Year Plan, Progress Tracker) that works well on desktop but doesn't adapt well to mobile screens.

## Implementation Plan

### 1. Create Mobile-Specific State Variables

Add state variables to track mobile-specific UI state:
```typescript
// Mobile-specific state
const [isMobile, setIsMobile] = useState<boolean>(false);
const [mobileView, setMobileView] = useState<'catalog' | 'plan' | 'tracker'>('plan');
```

### 2. Add Window Size Detection

```typescript
useEffect(() => {
  const checkIfMobile = () => {
    const isMobileView = window.innerWidth < 768;
    setIsMobile(isMobileView);
  };
  
  // Initial check
  checkIfMobile();
  
  // Add event listener for window resize
  window.addEventListener('resize', checkIfMobile);
  
  // Cleanup
  return () => window.removeEventListener('resize', checkIfMobile);
}, []);
```

### 3. Create Separate Desktop and Mobile Layouts

Modify the main JSX to conditionally render different layouts:

```jsx
return (
  <div className="h-screen flex flex-col">
    <Navbar />
    
    {/* Desktop Layout - unchanged from original */}
    <div className="hidden md:flex flex-1 flex-row overflow-hidden">
      {/* Original desktop layout code - unchanged */}
      {/* ... */}
    </div>
    
    {/* Mobile Layout - only visible on small screens */}
    <div className="flex md:hidden flex-1 flex-col overflow-hidden">
      {/* Mobile-specific layout */}
      {/* ... */}
    </div>
  </div>
);
```

### 4. Implement Mobile Navigation Buttons

Add fixed-position buttons for mobile navigation:

```jsx
{/* Mobile Layout */}
<div className="flex md:hidden flex-1 flex-col overflow-hidden">
  {/* Left Navigation Button (Course Catalog) */}
  <div className="fixed top-36 left-0 z-50">
    <button 
      onClick={() => setMobileView(mobileView === 'catalog' ? 'plan' : 'catalog')}
      className="h-auto py-3 w-10 bg-white border-r border-t border-b border-gray-300 rounded-r-md flex flex-col items-center justify-center shadow-sm"
      aria-label={mobileView === 'catalog' ? "Go to Four Year Plan" : "Go to Course Catalog"}
    >
      {mobileView === 'catalog' ? (
        <>
          <svg>/* Four Year Plan icon */</svg>
        </>
      ) : (
        <>
          <svg>/* Course Catalog icon */</svg>
        </>
      )}
    </button>
  </div>

  {/* Right Navigation Button (Progress Tracker) - only visible when not in catalog view */}
  {mobileView !== 'catalog' && (
    <div className="fixed top-36 right-0 z-50">
      <button 
        onClick={() => setMobileView(mobileView === 'tracker' ? 'plan' : 'tracker')}
        className="h-auto py-3 w-10 bg-white border-l border-t border-b border-gray-300 rounded-l-md flex flex-col items-center justify-center shadow-sm"
        aria-label={mobileView === 'tracker' ? "Go to Four Year Plan" : "Go to Progress Tracker"}
      >
        {mobileView === 'tracker' ? (
          <>
            <svg>/* Four Year Plan icon */</svg>
          </>
        ) : (
          <>
            <svg>/* Progress Tracker icon */</svg>
          </>
        )}
      </button>
    </div>
  )}
</div>
```

### 5. Implement Mobile Content Panels

Add conditional rendering for the three main panels based on the current mobile view:

```jsx
{/* Mobile Content Panels */}
{mobileView === 'catalog' && (
  <div className="w-full h-full bg-[var(--off-white)] overflow-y-auto">
    <div className="p-4">
      <CourseCatalog
        courses={courses}
        selectedTerm={selectedTerm}
        setSelectedTerm={setSelectedTerm}
        studentSchedule={studentSchedule}
      />
    </div>
  </div>
)}

{mobileView === 'plan' && (
  <div className="w-full h-full bg-white p-4 overflow-y-auto">
    <FourYearPlan
      selectedYear={selectedYear}
      setSelectedYear={setSelectedYear}
      studentSchedule={studentSchedule}
      addCourse={addCourse}
      removeCourse={removeCourse}
      reorderCourse={reorderCourse}
      updateCourseGrade={updateCourseGrade}
      isDataLoading={isLoading}
      saveStatus={saveStatus}
      setSaveStatus={setSaveStatus}
      showSummerByDefault={true}
    />
  </div>
)}

{mobileView === 'tracker' && (
  <div className="w-full h-full bg-[var(--off-white)] overflow-y-auto">
    <div className="p-4">
      <ProgressTracker
        studentSchedule={studentSchedule}
        college={majorData?.major?.college}
        saveStatus={saveStatus}
        setSaveStatus={setSaveStatus}
      />
    </div>
  </div>
)}
```

### 6. Update CSS for Mobile Optimization

Add mobile-specific CSS to globals.css:

```css
@media (max-width: 768px) {
  .writing-mode-vertical {
    writing-mode: horizontal-tb;
    transform: none;
  }
  
  /* Ensure mobile navigation buttons are always visible */
  .fixed.top-36.left-0,
  .fixed.top-36.right-0 {
    display: flex !important;
    opacity: 1 !important;
    visibility: visible !important;
    z-index: 50 !important;
  }
}
```

### 7. Ensure Proper Overflow Handling

Change `overflow-y-scroll` to `overflow-y-auto` for better mobile behavior:

```jsx
<div className="w-full h-full bg-white p-4 overflow-y-auto">
  {/* Component content */}
</div>
```

### 8. Add Debug Information (Optional)

For development purposes, add a small debug indicator:

```jsx
<div className="debug-info text-xs text-gray-400 mb-2 md:hidden">
  Mobile View: {mobileView}
</div>
```

## Testing Strategy

1. Test on various mobile devices and screen sizes
2. Verify that desktop layout remains unchanged
3. Test navigation between the three views on mobile
4. Ensure content is properly scrollable in each view
5. Verify that the navigation buttons are always visible
