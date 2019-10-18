use strict

/* getMaxSubSum([-1, 2, 3, -9]) = 5	<= 2 + 3
 * getMaxSubSum([2, -1, 2, 3, -9]) = 6	<= 2 + -1 + 2 + 3
 * getMaxSubSum([-1, 2, 3, -9, 11]) = 11
 * getMaxSubSum([-1, -2, 1, 2]) = 3	<= 1 + 2
 * getMaxSubSum([100, -9, 2, -3, 5]) = 100
 * getMaxSubSum([1, 2, 3]) = 6		<= 1 + 2 + 3
 * getMaxSubSum([-1, -2, -3]) = 0	<= for all negative numbers
 */

function getMaxSubSum(array) {
    let maxSum = 0;
    let partialSum = 0;
    for(let item of array) {
	partialSum += item;
	maxSum = Math.max(maxSum, partialSum);
	if (partialSum < 0) partialSum = 0;
    }

    return maxSum;
}

