///@function merge_sort(a, compare_function)
///@description Sorts the passed in array using the compare_function
///@params {array} a - an array of values to be sorted

// Warning: ~4000 elements is where the GM stack seems to fail
// Sorting arrays can be expensive so avoid calling merge_sort every step
// This is a pure function and does not mutate the passed in array

function merge_sort(a, compare_function) {
	var n = array_length(a);

	// An array of 1 element is considered sorted so return
	if (n == 1) return a;

	var middle = n / 2;

	// Create a left and right temp array by splitting the passed in array
	var left = array_create(middle);
	var left_len = array_length(left);
	var right_len = n - array_length(left);
	var right = array_create(right_len);

	// Populate the left array
	var i = 0;
	repeat(left_len) {
		left[i] = a[i];
		i++;
	};

	// Populate the right array
	var j = 0;
	repeat(right_len) {
		right[j] = a[j + left_len];
		j++;
	};

	// Recursively sort the left array
	left = merge_sort(left, compare_function);
	// Recursively sort the right array
	right = merge_sort(right, compare_function);
	// Merge those arrays together
	return merge(left, right, compare_function);
}

// Do not use this function directly.
function merge(a, b, compare_function) {
	var n1 = array_length(a);
	var n2 = array_length(b);

	// Create temporary array to merge to while sorting
	var c = array_create(n1 + n2);

    // Initial index of "a" array
    var i = 0,
	// Initial index of "b" array
	var j = 0;
    // Initial index of "c" array
    var k = 0;
    while (i < n1 && j < n2) {
		// Execute our compare_function
		// If the compare_function returns true copy the value from "a" to "c"
		// Else copy the value from "b" to "c"
		if (compare_function(a[i], b[j])) {
            c[k] = a[i];
            i++;
        }
        else {
            c[k] = b[j];
            j++;
        }
        k++;
    }

    // Copy remaining elements of a[]
	// Handles when arrays are of unequal length
    while (i < n1) {
        c[k] = a[i];
        i++;
        k++;
    }

    // Copy remaining elements of b[]
	// Handles when arrays are of unequal length
    while (j < n2) {
        c[k] = b[j];
        j++;
        k++;
    }

	return c;
}

// Example compare functions
// Anything below this is only for example and can be deleted

// Example compare_function
// Sort numbers in ascending order
function compare_numbers_asc(a, b) {
	return a <= b;
}

// Example compare_function
// Sort numbers in descending order
function compare_numbers_desc(a, b) {
	return a >= b;
}

// Basic compare using Structs
// Character with higher agi gets sorted first
// {
//	  stats: {
//		agi: 50
//	  }
// }
function compare_agi(a, b) {
	return a.stats.agi >= b.stats.agi;
}

// More complicated example sort using Structs
// {
//	  actor_type: Actor_Type.Player,
//	  stats: {
//		agi: 50
//	  }
// }
function compare_agi_complex(a, b) {
	// If a has higher agility it goes first
	if (a.stats.agi > b.stats.agi) {
		return true;
	// If b has higher agility it goes first
	} else if (a.stats.agi < b.stats.agi) {
		return false;
	// Else if a and b have equal agility favor the player
	} else {
		if (a.actor_type == "player") {
			return a;
		} else if (b.actor_type == "player") {
			return b;
		} else {
			return a;
		}
	}
}
