the checkout stage basically checks out all content of the repo, that is, it clones
your repo's code into the runner environment(workspace) so that the rest of the workflow can access all codes and commands especially previous steps.
This is assuming that all jobs are running on the same runner.
It is less complex to use a single runner to run jobs that are serially dependent.
Consider using multiple runners only when time is of dia importance but must be careful to allign stages properly using special prompts(not needs)
