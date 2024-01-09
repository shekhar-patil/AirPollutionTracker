### Air Pollution Data Analysis

#### Objective:
This assignment evaluates your proficiency in integrating external APIs, building importers, showcasing code quality, and formulating database queries. The primary task involves integrating the OpenWeatherMap Air Pollution API into a Rails application to retrieve, import, and store air pollution data for various cities across India.

#### Getting Started with the Project

1. Begin by cloning this project and executing `bundle install`.
2. Generate an API key from https://openweathermap.org/guide.
3. Create a file named `.env` in the root folder and include the following environment variable:
   `AIR_POLLUTION_API_KEY={api_key}`
4. Run the seed file using `bundle exec rails db:seed`.
5. To fetch historical data, execute the rake task:
   `rails import:historical_pollution_data`.

#### Components Included in this Assignment

1. **Rake Task:** Used to fetch historical data (`import:historical_pollution_data`).
2. **Sidekiq Job and sidekiq-cron:** Employed for importing pollution data at regular intervals (`ImportPollutionDataJob`).
3. **VCR gem:** Prevents redundant API calls during testing (test cases).
4. **RSpec:** Ensures test coverage.
5. **Service:** Utilizes the OpenWeatherService for making API requests.
6. **Tailwind:** Integrated for CSS styling.

[View the demo video here](https://www.loom.com/share/48abb3c416c54632ade620428d99e9db?sid=a1bacac2-5e2f-495d-a96b-172c6a3e904e)
