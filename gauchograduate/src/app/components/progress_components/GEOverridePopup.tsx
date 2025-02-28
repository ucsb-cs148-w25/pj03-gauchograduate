import React, { useState } from 'react';

interface GEOverridePopupProps {
  area: string;
  onClose: () => void;
  onConfirm: (area: string, creditType: string, units: number) => void;
}

const GEOverridePopup: React.FC<GEOverridePopupProps> = ({ area, onClose, onConfirm }) => {
  const [selectedCredit, setSelectedCredit] = useState<string>('');
  const [units, setUnits] = useState<number>(4); // Default to 4 units
  
  const creditOptions = [
    'AP Credit',
    'Community College Credit',
    'A-Level Credit',
    'IB Credit'
  ];

  const handleConfirm = () => {
    if (selectedCredit) {
      onConfirm(area, selectedCredit, units);
    }
  };

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" onClick={onClose}>
      <div className="bg-white p-6 rounded-lg shadow-xl max-w-md w-full m-4" onClick={e => e.stopPropagation()}>
        <h3 className="text-xl font-bold mb-4">Override {area} Requirement</h3>
        <p className="mb-4">If you&apos;ve already completed this requirement through other means, select the type of credit:</p>
        
        <div className="space-y-2 mb-4">
          {creditOptions.map((credit) => (
            <div key={credit} className="flex items-center">
              <input
                type="radio"
                id={credit}
                name="creditType"
                value={credit}
                checked={selectedCredit === credit}
                onChange={() => setSelectedCredit(credit)}
                className="mr-2"
              />
              <label htmlFor={credit}>{credit}</label>
            </div>
          ))}
        </div>
        
        <div className="mb-4">
          <label htmlFor="units" className="block text-sm font-medium text-gray-700 mb-1">
            Units
          </label>
          <input
            type="number"
            id="units"
            min="1"
            max="12"
            value={units}
            onChange={(e) => setUnits(Number(e.target.value))}
            className="w-full p-2 border border-gray-300 rounded"
          />
        </div>
        
        <div className="flex justify-end space-x-3">
          <button
            onClick={onClose}
            className="px-4 py-2 border border-gray-300 rounded hover:bg-gray-100 transition-colors"
          >
            Cancel
          </button>
          <button
            onClick={handleConfirm}
            disabled={!selectedCredit}
            className={`px-4 py-2 rounded text-white ${
              selectedCredit ? 'bg-blue-500 hover:bg-blue-600' : 'bg-gray-400 cursor-not-allowed'
            } transition-colors`}
          >
            Confirm
          </button>
        </div>
      </div>
    </div>
  );
};

export default GEOverridePopup;
