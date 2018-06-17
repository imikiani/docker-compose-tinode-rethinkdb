#!/bin/bash

echo "\nWaiting for building and setting up the Tinode server...\nIt may take a few minutes.\n"

# Install tinode server from mounted directory
go get -tags rethinkdb ./github.com/tinode/chat/server

# Install tinode-db from mounted direcrory
go get -tags rethinkdb ./github.com/tinode/chat/tinode-db

# Initiate database
/go/bin/tinode-db -config=/go/src/github.com/tinode/chat/tinode-db/tinode.conf -data=/go/src/github.com/tinode/chat/tinode-db/data.json

echo "\nThe Tinode server is starting...\n"

# Run the server
/go/bin/server -config=/go/src/github.com/tinode/chat/server/tinode.conf  -static_data=/web/example-react-js/
