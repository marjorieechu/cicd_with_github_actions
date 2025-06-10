so after checkout.
we build the three images from all 3 dockerfile.

The project basically sets up github action runners that in turn used to build images, push to dockerhub and run containers using docker compose.
A 3 tier application is eventually built.
Steps include

1. Set up runners using a
2. Write dockerfiles for all tiers
3. Write CI to build images
4. Write CI to push to ECR
5. Include in CI to run containers via docker compose
