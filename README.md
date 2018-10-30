## Containerized Tinode chat server

### How to use

First of all, Run `https://github.com/imikiani/docker-compose-tinode-rethinkdb.git`

Then go to the cloned repository:
`cd docker-compose-tinode-rethinkdb`


After that, you must follow 2 steps to have a containerized tinode server based on [docker](https://www.docker.com/):

1. Clone needed repositories to share them with docker containers.

2. Modify the cloned repositories

3. Run `docker-compose up`



##### Step 1:

Create directory `tinode` (Because We've shared `tinode` directory with the server container):

`mkdir tinode && cd tinode`


Then put both of "Server" and "Web client" repositories into `tinode` directory:

- Server

    Clone the server by:

    `git clone https://github.com/tinode/chat.git chat`


- Web client

    Pull the official React client for tinode by cloning the repository below:

    `git clone https://github.com/tinode/example-react-js.git`

    And Also follow the instruction mentiond [here](https://github.com/tinode/example-react-js). (You must use a SDK written in javascript which is described in that instruction)

 So the final structure would be like this:

     .
    |── Docker-compose.yml
    |── Dockerfile
    |── entrypoint.sh
    ├── tinode
    │   ├── chat
    │   └── example-react-js
    │
    └── ...



##### Step 2:

Replace `localhost:28015` with `db:28015` in both of `server/tinode.conf` and `tinode-db/tinode.conf` due to our service name `db` in the `docker-compose.yml` file.

##### Step 3:

Go back to the root of `docker-compose-tinode-rethinkdb` directory and run `docker-compose up`.

After a few minutes the server is running: [http://localhost:6060/x](http://localhost:6060/x)
