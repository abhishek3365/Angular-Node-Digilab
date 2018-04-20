var dao = require('../data-access-layer/app.dao');

var loginServices = require('./login.services')( dao.usersDao );
var digilabServices = require('./digilab.service')( dao.digilabDao );
var sessionServices = require('./session.service')( dao.sessionDao , dao.sessionStateDao , dao.sessionHostDao , dao.digilabHostDao , dao.digilabDao );

var app_services = { loginServices , digilabServices , sessionServices };

module.exports = app_services;