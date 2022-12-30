# Stat_comput_project2

Project which aims to compare a few packages of local polynomial regression in R; how are they implemented and which one is the best for which task.

The code is composed of 3 .rmd files and 1 .R file:
- __Main_pipeline.rmd__ : contains the framework to compute time and error for a vrious number of parameters : `degrees`, bandwidths `h_`, input data set size `Samples_sizes`, number of trials for each computation before averaging `n_trials_in`. It imports the function to be approximated and the noise induction functions from the file __functions.R__.
- __functions.R__ : Auxiliary R script that contains some functions usefull of the others files, as noise inductions and functions to be aproximated
- __update package timeline.rmd__ : Plotting the update times of the packages considered. Mainly hand written.
- __analysis.rmd__ : Importing the outcomes produced from the __Main_pipeline.rmd__ and use it to produce various plots. All the ones appearing in the report may not appear directly when running this, but should be quite easy to reproduce re-using the syntax implemented.
