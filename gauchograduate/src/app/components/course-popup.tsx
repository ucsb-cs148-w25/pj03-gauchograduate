import { CoursePopupProps } from './coursetypes';

export default function CoursePopup({ course, term, onClose, onDelete }: CoursePopupProps) {
  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" onClick={onClose}>
      <div className="bg-white p-6 rounded-lg shadow-xl max-w-md w-full m-4" onClick={e => e.stopPropagation()}>
        <h3 className="text-xl font-bold mb-4">{course.course_id}</h3>
        <div className="space-y-3">
          <p className="text-lg">{course.title}</p>
          <p className="text-gray-600">{course.units} units</p>
          <p className="text-sm text-gray-500">Term: {term}</p>
          {course.generalEd.length > 0 && (
            <div className="text-sm text-gray-500">
              <p>General Education Requirements:</p>
              <ul className="list-disc pl-5">
                {course.generalEd.map((ge, index) => (
                  <li key={index}>{ge.geCode} ({ge.geCollege})</li>
                ))}
              </ul>
            </div>
          )}
        </div>
        <div className="mt-6 flex justify-end">
          <button
            onClick={onDelete}
            className="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition-colors"
          >
            Delete Course
          </button>
        </div>
      </div>
    </div>
  );
}
