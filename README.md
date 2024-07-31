# Manga Aggregator Application

## Description

This application is a manga aggregator built using Ruby on Rails 7. It allows users to browse, rate, and comment on various manga titles. The application is styled using Tailwind CSS and integrates PostgreSQL for database management.

## Features Checklist

- [x] An admin panel to upload the mangas
- [x] Distinctive fields to fill the title of the manga being uploaded, the author, date of first publishing, and description of the manga
- [x] Admin can upload the manga from the admin panel
- [x] Feature to upload new chapters whenever the admin desires
- [x] Manga categories to determine the genre of the manga
- [x] Homepage displaying all available mangas with a search bar
- [x] Display trending mangas on the homepage
- [x] View detailed information when a user clicks on a manga
- [x] Users can like and comment on the mangas
- [x] Read mangas in a paginated way with a page read tracker
- [x] Track likes on the manga, users can rate manga out of 5 stars

### Additional Requirements (Nice to Have)

- [ ] Recommend manga to a user based on their past interests in some genre
- [x] Data analytics for the admin to determine which mangas are being read the most by the users and other such details

## Admin Credentials

john@doe.com
1234

## Ruby Version

This application is built with Ruby 3.2.0 and Rails 7.0.0. Ensure you have the correct version installed to run the application.

## System Dependencies

- Ruby 3.2.0
- Rails 7.0.0
- PostgreSQL 14.x
- Node.js (for managing frontend assets)
- Yarn (for managing JavaScript dependencies)

## Configuration

1. **Clone the repository:**

   ```bash
   git clone https://github.com/varshi45/Manga-Reader.git
   cd Manga-Reader
   ```

2. **Install the required gems:**

   ```bash
   bundle install
   ```

3. **Install JavaScript dependencies:**

   ```bash
   yarn install
   ```

4. **Setup environment variables:**
   Create a `.env` file in the root directory and add the necessary environment variables. Example:
   ```bash
   DATABASE_URL=postgres://user:password@localhost:5432/manga_aggregator_development
   ```

## Database Creation

1. **Create the database:**

   ```bash
   rails db:create
   ```

2. **Run migrations:**

   ```bash
   rails db:migrate
   ```

3. **Seed the database with initial data (optional):**
   ```bash
   rails db:seed
   ```

## How to Run the Test Suite

To run the test suite, use the following command:

```bash
rails test
```

## Services

- **Job Queues:** If your application uses background jobs, configure Active Job with your preferred queuing backend (e.g., Sidekiq, Delayed Job).
- **Cache Servers:** Use caching for improved performance. Configure caching in `config/environments/production.rb` (e.g., Redis).
- **Search Engines:** If implementing search functionality, integrate with a search engine (e.g., Elasticsearch).

## Deployment Instructions

1. **Prepare the server environment:**

   - Install Ruby, Rails, PostgreSQL, and other dependencies.
   - Configure the server with environment variables and database credentials.

2. **Deploy the application:**

   - Use a deployment tool or service (e.g., Capistrano, Heroku, AWS Elastic Beanstalk).
   - Run deployment tasks such as `rails db:migrate` and `rails assets:precompile`.

3. **Start the application server:**

   ```bash
   rails server
   ```

## Additional Notes

- For local development, ensure that you have the appropriate version of Ruby and Rails installed.
- Review the `config/environments/*.rb` files for environment-specific configurations.
- Consult the [Rails Guides](https://guides.rubyonrails.org/) for more detailed information on Rails features and best practices.
- Use the `bin/dev` script for starting the development server to ensure CSS is correctly applied.

---
