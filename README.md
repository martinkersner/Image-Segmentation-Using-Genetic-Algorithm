# Image Segmentation Using Genetic Algorithm

Project is inspired by [paper](http://www.worldcomp-proceedings.com/proc/p2011/IPC8346.pdf) ([summary](http://breadthsearch.blogspot.cz/2014/11/multi-thresholding-image-segmentation.html)).
Image segmentation can be pursued by many different ways.
One of them is called multi-thresholding.
Since we want to segment image to more than two segments (more than one threshold) we need to determine at least two thresholds.
If we want to segment gray level image with 256 levels to three segments we are likely supposed to examine 256*255 = 65280 different threshold combinations.
This brute force approach would end up with optimal solution, however computing time would be definitely high.
Genetic algorithm searches space containing all possible solutions and obtain the best solution among all examined in much less time than brute force algorithm.

![Cameraman](https://cloud.githubusercontent.com/assets/2312761/5238428/766e35a4-78ba-11e4-93bf-c085e850b569.png "Source image")
![One threshold](https://cloud.githubusercontent.com/assets/2312761/5238425/5abd2aea-78ba-11e4-9459-c76782c3c8e6.png "Image segmented by one threshold")

*The result of segmentation by genetic algorithm with population size 20 and number of iterations 30.*

## Implementation
Genetic algorithm was implemented in GNU Octave. 
This language was selected due to its fast prototyping.
The speed of algorithm is not the matter of interest.

#### Initialization
This part of code is found at *ga_segmentation.m*.
There are few settings which can affect the result of algorithm.
* **n_population:**
  size of population; contains different solutions
* **n_iterations:**
  number of iterations; algorithm terminates after all iterations are done
* **n_thresholds:**
  number of desired thresholds; n_thresholds = (number of segments - 1)
  
The next three settings are related to each other.
They are ratios of selection (**n_selection**), crossover (**n_crossover**) and mutation (**n_mutation**).
The sum of all these parameters has to be equal to 1.
This condition guarantees the size of population does not change between iterations.

Single chromose is implemented as vector of binary numbers. 
The length of vector is *L* * *n*, where *L* denotes *log*(number of gray levels) and *n* is the number of desired thresholds.
Population is represented a matrix, where each row is single chromosome and number of rows corresponds to size of population.
An initial population was randomly generated.

#### Evaluation of fitness
According to paper, which was mentioned above, evaluation of fitness should be performed with ratio between between inter-object variance and intra-object variance.
We have decided for sligthly easier evaluation based on sum of intra-object variance.
The solution with the lowest sum is the most accurate.

*fitness.m*, *fitness_one.m*

#### Selection
Current solution selects to new generation only the best solutions.
The number of forwarded solution depends on ratio **n_selection**.

*first_best.m*

#### Crossover
Chromosomes, which are supposed to crossover, are chosen from two vectors containing radomly permutated indexes (numbers of row) of chromosomes.
The number chromosomes, which crossover, depends on ratio **n_crossover**.
One-point crossover is employed in current solution.
The point of crossover is randomly generated with uniform distribution.

*crossover.m*, *crossover_one.m*

#### Mutation
Indexes (number of rows) of chromosomes are randomly permutated and the very first of them are more likely to be chosen.
The number of chromosomes, which happens to be chosen for mutation, depends on ratio **n_mutation**.
Current solution allows to mutate only one gene of chromosome.

*mutation.m*, *mutate_one.m*

## Experiments

## Conclusion
(roulette wheel)