# Dungeons&Dragons Character Manager

This Sinatra based CRUD/MVC model application allows users to track and manage their D&D characters. Users can also view other users characters to help get inspired for their next D&D character!

[Demo Guide](https://www.youtube.com/watch?v=Z5tr9ocDMLM)

##Installation Instructions

1. Clone the repository and open locally
2. Open terminal and install the dependencies
```console
    $ bundle install
```
3. Make sure to provide a environment variable for the session secret in the ApplicationController
4. Run rake migrations to get the database started
```console
    $ rake db:migrate
```
5. Startup shotgun
```console
    $ shotgun
```
6. Open DnDCharacterManager and get started!

##Contributing Guide
- Fork the repository and mess around!
- Open a new GitHub pull request with any patches or changes
- Report bugs in the issues tab
- Send design suggestions as a DM to BeccaN

##License

The program is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
