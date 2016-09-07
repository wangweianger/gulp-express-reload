
module.exports = function (app) {
    app.use('/demo1', require('./demo1.js'));
    app.use('/demo2', require('./demo2.js'));
};