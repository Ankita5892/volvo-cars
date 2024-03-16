const express = require('express');
const app = express();

app.get('/', (req, res) => {
    // Get user agent from request headers
    const userAgent = req.headers['user-agent'];

    // Log user agent information
    console.log("User Agent Info: " + userAgent);

    res.json({
        status: 200,
        message: "hello world changing",
	userAgent: userAgent
    });
});

app.listen(8080, () => {
    console.log('server running on port 8080');
});

