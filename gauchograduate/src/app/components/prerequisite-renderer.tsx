// PrerequisiteRenderer.tsx

import React from 'react';
import { PrerequisiteNode } from './coursetypes';

interface Props {
  node: PrerequisiteNode;
  depth?: number; // used to indent nested requirements
}

const INDENT_PER_LEVEL = 12;

export const PrerequisiteRenderer: React.FC<Props> = ({ node, depth = 0 }) => {
  // Add debug logging
  console.log(`PrerequisiteRenderer at depth ${depth}:`, node);

  // helper style for nested indentation
  const style = { marginLeft: depth * INDENT_PER_LEVEL };

  if (!node || typeof node !== 'object') {
    console.log("Invalid node:", node);
    return null;
  }

  switch (node.type) {
    case 'course': {
      // Render a single course requirement
      return (
        <li style={style}>
          <span className="font-medium">{node.id}</span>
          {node.minGrade && node.minGrade !== 'Na' && (
            <span className="text-sm ml-1">(Min grade: {node.minGrade})</span>
          )}
          {node.canTakeConcurrently && (
            <span className="text-sm ml-1 text-blue-600">
              (Can be taken concurrently)
            </span>
          )}
        </li>
      );
    }

    case 'specialRequirement': {
      // Render a special requirement (like AP exam scores)
      return (
        <li style={style}>
          <span className="font-medium text-purple-600">{node.requirement}</span>
        </li>
      );
    }

    case 'and': {
      // All requirements must be met
      return (
        <div style={style} className="border-l-2 border-blue-300 pl-3 my-2">
          <div className="font-semibold mb-1">AND - All of these must be met:</div>
          <ul className="list-disc pl-5">
            {node.requirements && node.requirements.map((req, idx) => (
              <PrerequisiteRenderer key={idx} node={req} depth={depth + 1} />
            ))}
          </ul>
        </div>
      );
    }

    case 'or': {
      // Any one of the subrequirements is enough
      return (
        <div style={style} className="border-l-2 border-orange-300 pl-3 my-2">
          <div className="font-semibold mb-1">OR - One of these must be met:</div>
          <ul className="list-disc pl-5">
            {node.requirements && node.requirements.map((req, idx) => (
              <PrerequisiteRenderer key={idx} node={req} depth={depth + 1} />
            ))}
          </ul>
        </div>
      );
    }

    default:
      console.log("Unknown node type:", node);
      return (
        <div className="text-red-500">
          Unknown prerequisite type: {String((node as Record<string, unknown>).type || 'undefined')}
        </div>
      );
  }
};
