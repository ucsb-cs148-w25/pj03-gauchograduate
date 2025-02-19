
UPDATE "Course"
SET prerequisites = '{
"and": [
    {"class" : [{"goldId": "CHEM_1A",
      "Required_Grade" : "Na",
      "Taken_Concurrently" : "False"
    }]},
    {"and" : [{"class": [{"goldId": "U",
      "Required_Grade" : "Na",
      "Taken_Concurrently" : "False"
    }, {"goldId": "CHEM_1B",
      "Required_Grade" : "Na",
      "Taken_Concurrently" : "True"
    }]}]},
    {"or" : [{"class": [{"goldId": "CMPCS_16",
      "Required_Grade" : "C-",
      "Taken_Concurrently" : "True"
    }, {"goldId": "CMPCS_9",
      "Required_Grade" : "Na",
      "Taken_Concurrently" : "False"
    }]}]},
    {"and" : [{"class": [{"goldId": "MATH_4A",
      "Required_Grade" : "B+",
      "Taken_Concurrently" : "False"
    }, {"goldId": "MATH_6A",
      "Required_Grade" : "B",
      "Taken_Concurrently" : "True"
    }]}]}
   ]
}
';
