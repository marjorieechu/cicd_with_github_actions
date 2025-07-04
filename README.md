# GitHub-Actions

# Goal: To understand your Github Actions ci file and how to use it for deployement and other devops processes.

So after checkout.
we build the three images from all 3 dockerfile.

The project basically sets up github action runners that in turn used to build images, push to dockerhub and run containers using docker compose.
A 3 tier application is eventually built.
Steps include

1. Set up runners using a
2. Write dockerfiles for all tiers
3. Write CI to build images
4. Write CI to push to ECR (DTR: Docker Trusted Registry = VM)
5. Include in CI to run containers via docker compose

Line 56 of ci.yml reads
sed -i "s|API_IMAGE|$API_IMAGE|g" docker-compose.yml and means
Replaces all occurrences of API_IMAGE with the value of the $API_IMAGE environment variable.
also on line 59 of ci.yml 
sed -i "s|POSTGRES_USER_S9|${{ vars.POSTGRES_USER_S9 }}|g" docker-compose.yml which means
Replaces POSTGRES_USER_S9 with the value stored in GitHub Actions environment variable named POSTGRES_USER_S9.

Line 70 - docker compose down -v || true
Means Stops and removes all containers defined in your docker-compose.yml including named and anonymous volumes and still run succesfully even they do not exist.
Line 71 - docker compose down --volumes --remove-orphans
Means Stops containers, removes them + volumes + removes orphan containers.
It ensures no leftovers break your fresh start.
