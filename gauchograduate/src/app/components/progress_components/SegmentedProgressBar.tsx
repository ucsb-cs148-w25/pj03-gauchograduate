// SegmentedProgressBar.tsx
import React from "react";

export interface SegmentedProgressBarProps {
  geUnits: number;
  majorUnits: number;
  extraUnits: number;
  externalUnits: number;
  total: number;
}

const SegmentedProgressBar: React.FC<SegmentedProgressBarProps> = ({
  geUnits,
  majorUnits,
  extraUnits,
  externalUnits,
  total,
}) => {
  const radius = 50;
  const circumference = 2 * Math.PI * radius;

  const fraction = (units: number) => Math.min(units / total, 1);
  const p_ge = fraction(geUnits);
  const p_major = fraction(majorUnits);
  const p_extra = fraction(extraUnits);
  const p_external = fraction(externalUnits);

  const L_ge = circumference * p_ge;
  const L_major = circumference * p_major;
  const L_extra = circumference * p_extra;
  const L_external = circumference * p_external;

  // Offsets drawn in order: GE, then major, then extra, then external.
  const offset_ge = 0;
  const offset_major = offset_ge - L_ge;
  const offset_extra = offset_major - L_major;
  const offset_external = offset_extra - L_extra;

  return (
    <svg width="100%" height="100%" viewBox="0 0 120 120">
      {/* Background circle now white */}
      <circle
        cx="60"
        cy="60"
        r={radius}
        fill="none"
        stroke="#ffffff"
        strokeWidth="10"
      />
      {/* GE segment (pale pink) */}
      <circle
        cx="60"
        cy="60"
        r={radius}
        fill="none"
        stroke="#ffb6c1"
        strokeWidth="10"
        strokeDasharray={`${L_ge} ${circumference}`}
        strokeDashoffset={offset_ge}
        transform="rotate(-90 60 60)"
        style={{ transition: "stroke-dashoffset 0.5s" }}
      />
      {/* Major segment (pale orange) */}
      <circle
        cx="60"
        cy="60"
        r={radius}
        fill="none"
        stroke="#ffcc99"
        strokeWidth="10"
        strokeDasharray={`${L_major} ${circumference}`}
        strokeDashoffset={offset_major}
        transform="rotate(-90 60 60)"
        style={{ transition: "stroke-dashoffset 0.5s" }}
      />
      {/* Extra segment (pale blue) */}
      <circle
        cx="60"
        cy="60"
        r={radius}
        fill="none"
        stroke="#add8e6"
        strokeWidth="10"
        strokeDasharray={`${L_extra} ${circumference}`}
        strokeDashoffset={offset_extra}
        transform="rotate(-90 60 60)"
        style={{ transition: "stroke-dashoffset 0.5s" }}
      />
      {/* External units segment (gray) */}
      <circle
        cx="60"
        cy="60"
        r={radius}
        fill="none"
        stroke="#d3d3d3"
        strokeWidth="10"
        strokeDasharray={`${L_external} ${circumference}`}
        strokeDashoffset={offset_external}
        transform="rotate(-90 60 60)"
        style={{ transition: "stroke-dashoffset 0.5s" }}
      />
      {/* Center text */}
      <text
        x="50%"
        y="50%"
        dominantBaseline="central"
        textAnchor="middle"
        fontSize="18"
      >
        {Math.round(((geUnits + majorUnits + extraUnits + externalUnits) / total) * 100)}%
      </text>
    </svg>
  );
};

export default SegmentedProgressBar;
