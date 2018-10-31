# Lepton
v0.8.0
Companion tool to the [Drachma](https://github.com/nero777x/pr-cache-sim) simulator.

### Style
To the best of the author's ability, this project conforms to the "C++ Core Guidelines" found here <https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md>.  Any exceptions or additional rules may be located within the .styleguide file.

### To-do List
* Consider splitting mapper class into mapper/tracer classes or tracer/tracerHelper classes.
* Persuant to the previous, consider name changes for mapper and graphMapper classes.
* Replace fileReader class with propper file parsing library.
* Consider using JSON or something similar as the format for configuration files (research alternatives).
* Change the .t2d file along with corresponding data structures and logic.
 + Option 1: Latencies no longer on IP (simply list out IPs with no arguments)
        srX module Y: ipA base_latency upper_bound_jitter lower_bound_jitter
        rrX module Y: { ipA base_latency upper lower, ... }
 + Option 2: Change IP verbiage to "ipx base latency" and "ipx upper/lower bound jitter"
     
        srX module Y: ipA [base_latency_change [new_upper_bound_jitter [new_lower_bound_jitter]]]
        rrX module Y: { ipA [base_latency_change [new_upper [new_lower]]], ... }

  This would be a more accurate representation of possible real-life applications.
  
* Add ability to provide random seed within .t2d file.
* Implement least cost application execution.
