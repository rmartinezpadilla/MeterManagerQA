function fn() {
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; // a custom 'intelligent' default
  }
  var config = { // base config JSON
    //appId: 'my.app.id',
   // appSecret: 'my.secret',
    someUrlBase: 'https://ops.enerbit.dev',
   // anotherUrlBase: 'https://another-host.com/v1/'
  };
  if (env == 'stage') {
    // over-ride only those that need to be
    config.someUrlBase = 'https://ops.enerbit.dev';
  } else if (env == 'e2e') {
    config.someUrlBase = 'https://ops.enerbit.dev';
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);
  return config;
}