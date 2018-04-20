module.exports = (app) => {

    var appController = require('../controller/app.controller');
  
    app.route('/login')
      .post(appController.loginController.authenticateUser);
    
    app.route('/digilab')
      .get(appController.digilabController.getAllDigilabs)
      .post(appController.digilabController.addDigilab);

    app.route('/digilab/:id')
      .put(appController.digilabController.updateDigilab);

    app.route('/session')
      .post(appController.sessionController.addSession);

    app.route('/session/:id')
      .put(appController.sessionController.updateSession);

    app.route('/sessions')
      .post(appController.sessionController.getSessions);
}