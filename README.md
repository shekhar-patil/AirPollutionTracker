Analyzing Air Pollution Data

### Objective:
The goal of this assignment is to assess your ability to research external APIs for integrations, create an importer, demonstrate code quality, and write database queries. The task focuses on integrating the OpenWeatherMap Air Pollution API into a Rails application to fetch, import, and store air pollution data for different cities across India.


# How to start with Project

1. Clone this project and perform `bundle install`
2. Create API key from https://openweathermap.org/guide
3. create file .env in the root folder and add following enviroment variable.
`AIR_POLLUTION_API_KEY={api_key}`
4. Execute seed file using `bundle exec rails db:seed`
5. To fetch historical data execute following rake task
`rails import:historical_pollution_data`


# This assignment containts

1. Rake Task - To fetch historical data (`import:historical_pollution_data`)
2. Sidekiq Job and sidekiq-cron - To import pollution data in regular interval (`ImportPollutionDataJob`)
3. VCR gem - To avoid redudant calls to API while testing the test cases.
4. Rspec - To cover test coverage
5. Service - OpenWeatherApi for API requests.
6. Tailwind - For CSS.


[Link for demo video](https://www.loom.com/share/48abb3c416c54632ade620428d99e9db?sid=a1bacac2-5e2f-495d-a96b-172c6a3e904e)
