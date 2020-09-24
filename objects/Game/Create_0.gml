// Sort and logs the sorted array

// Example usage of merge_sort
var example_array = [4,7,2,1,3,7];
// Time before the sort
var before = get_timer();
var sorted_array = merge_sort(example_array, compare_numbers_asc);
// Time after the sort
var after = get_timer();
var time_taken_to_sort = after - before;
show_debug_message("Time taken to sort: " + string(time_taken_to_sort) + " microseconds");

show_debug_message("Sorted Array Values");
var i = 0;
repeat(array_length(sorted_array)) {
	show_debug_message(sorted_array[i]);
	i++;
}
