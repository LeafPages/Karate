function fn() {   
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; // a custom 'intelligent' default
  }
  var config = { // base config JSON
	 baseUrl : 'dev49243',
	 username : 'admin',
  	 password : 'Tuna@123'
  };
  if (env == 'QA') {
    // over-ride only those that need to be
    config.baseUrl = 'dev49245';
  } else if (env == 'e2e') {
    // you can have your own value
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  
  karate.configure('report',{showLog: true, showAllSteps: true });
  
  return config;
}