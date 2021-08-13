# Use the official Rust image.
# https://hub.docker.com/_/rust
FROM rust:1

# Copy local code to the container image.
WORKDIR /usr/src/app
COPY . .

# Install production dependencies and build a release artifact.
# RUN cargo install --path .
RUN cargo install --git https://github.com/projectsophon/darkforest-rs --bin mimc-fast --force --branch=main

# Run the web service on container startup.
CMD ["RUST_LOG=info mimc-fast"]
