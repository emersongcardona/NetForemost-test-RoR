# NetForemost-test-RoR
test for interview for NetForemost company 


### Backend: consume api from news api and provides 2 apis for frontend,  one is to get all the articles in a category (e.g., technology), another is to show all the data from a selected by id Article 

### frontend: implementing vuejs for frontend consume the 2 api's from backend (rails) and show data in user interface.

## Notes
file .env will be sent by email

## technologies and resources 
backend
- Ruby on Rails (version 5.2)
- PostgreSQL database
- HTTParty to pettitions for news API 
- rspec for test
- rack-cors to enable backend frontend connection
- factory bot to create articles for testing

frontend   
 - Vuejs (version 3.2.13)
 - axios to handler api petitions 
 - vue Rutes to handler routes in vuejs

other technologies
 - git/github
 - DBeaver
 - postman

## times 
### backend
- connect db, connect to news api (read documentation and test it before consume it in backend), create     controller, migrations and routes, test : 2:30 hours

### frontend
- structurate proyect and hanlder petitions to both backend api`s : 2 hours
- give styles to frontend acourds to figma desing : 1 hours