function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	WEATHER_URL: 'https://api.weatherbit.io/v2.0/current',
	BOOKING_URL: 'https://www.phptravels.net/home',
	API_KEY: java.lang.System.getenv('weather_api_key')
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}