FROM ruby:2.7

# Specify everything will happen within the /app folder inside the container
RUN mkdir /app
WORKDIR /app

# Copy Gemfile from our current application to the /app container
COPY Gemfile Gemfile.lock ./

# Copy all the files from our current application to the /app 
COPY . .

EXPOSE 4567 8808

# Install all the dependencies
RUN bundle install