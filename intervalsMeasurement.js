//helper function that converts range to array
function range(start, stop, step){
  var a=[start], b=start;
  while(b<stop){b+=step; a.push(b)}
  return a;
};

//Takes in a list of intervals and returns the amount of 
//space the intervals take without counting overlaps.  

//For example, sumIntervals([[1,2], [2,5], [4,6]]) would
//return 5.   

function sumIntervals(intervals){
  var uniqResults = {};
  var intervalLength = 0;
  intervals.forEach(function(interval){
    var intervalArray = range(interval[0], interval[1]-1, 1);
    intervalArray.forEach(function(el){
      if (uniqResults.hasOwnProperty(el) == false){
        uniqResults[el] = 1;
        intervalLength++;
      }
    })
  })
  return intervalLength;
};