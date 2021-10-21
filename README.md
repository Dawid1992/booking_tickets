### Basic information:

* Ruby 3.0.0
* Rails 6.0.3
* PostgreSQL 1.2

Tests:
* rspec, factory_bot_rails, shoulda-matchers, capybara, faker

Appearance & clarity:
* rubocop

### Models

Base on two models - events and orders
event has:
- name
- information about amount of total and sold ticket
- price per ticket
- start date

order has
- ticket amount
- order value based on ticket's amount * price per ticket
- status (open/closed)
- expiration date

## Payment

Payment can have 4 statuses (successful, successful buy expired, failed with card error and failed with payment error)

After 15 minutes unpaid order is cancelled and tickets are returned to the pool
