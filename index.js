const express = require('express');

const app = express();

app.get('/', (req, res) => {
    /* When we make changes to our project files in Docker, Docker detects those changes during the COPY instruction and
    runs every subsequent instruction normally without cache. However, this means, in regards to npm, that if we do not
    change the package.json file then it is an unnecessary step to run npm install again. */
    res.send('How are you doing?');
});

app.listen(8080, () => {
    console.log('Listening on port 8080');
})