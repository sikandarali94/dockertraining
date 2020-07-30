const express = require('express');
const redis = require('redis');

const app = express();
const client = redis.createClient({
    /* We do not provide a connection url when connecting a container to another deployed by Docker compose. Instead, we
    just provide the name of the service/container. When the Redis library makes a request to this host name, Docker
    will look at it and automatically understand which service/container we want to connect to because we are providing
    the name of the service/container. */
    host: 'redis-server',
    /* While this is not required, we provided a port for completion sake, as this is the default Redis port. */
    port: 6379
});
client.set('visits', 0);

app.get('/', (req, res) => {
    client.get('visits', (err, visits) => {
        res.send('Number of visits is ' + visits);
        client.set('visits', parseInt(visits) + 1);
    })
});

app.listen(8081, () => {
    console.log('Listening on port 8081');
})