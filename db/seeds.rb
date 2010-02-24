# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
counties = %w{Asturias Cantabria Madrid Sevilla Valencia }
genders = %w{Man Woman}
body_types = ['Slender', 'Athletic', 'Average', 'A few extra pounds', 'Heavy']
marital_statuses = ['Single', 'In a relationship', 'Married', 'Divorced', 'Widowed']

counties.each { |c| County.find_or_create_by_name(c) }
genders.each { |g| Gender.find_or_create_by_name(g) }
body_types.each { |bt| BodyType.find_or_create_by_name(bt) }
marital_statuses.each { |ms| MaritalStatus.find_or_create_by_name(ms) }

