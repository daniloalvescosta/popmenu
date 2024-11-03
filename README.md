![PopMenu logo](https://cdn.prod.website-files.com/5a6f337e3f25150001fa6f4a/5a80731938edac00018786ba_Popmenu%20-%20Horizontal.fw.webp)

# PopMenu Challenger
I was challenged by PopMenu to create an API with an endpoint that accepts the import of a JSON file and, together with this, creates instances of restaurants, menus, and menu items, paying attention, of course, to creating a MenuItem that does not have duplicate names. The current repository aims to solve this challenge!

## How to run this project

   

    git clone git@github.com:daniloalvescosta/popmenu.git
    rails db:create
    rails db:migrate
    bundle exec rspec
    rails server
Please pay attention to the database.yml file before running the project. Your PostgreSQL configuration might differ from the one present there.
