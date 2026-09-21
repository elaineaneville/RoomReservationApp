# TIU11RailsApp
TIU11 Coding Challenge 2026

AI Usage is indicated throughout the lines below with an additional section at the very end!

Core Requirements
As a staff member, I can:
- View available rooms across multiple sites
- Reserve a room for a specific date and time
- See my upcoming reservations
As an admin, I can:
- Approve or deny reservation requests
- Manage rooms and sites
System behavior:
- Prevent double bookings - prioritized double bookings
- Show reservation status flow: pending → approved or denied - deprioritized (
    least important of showing, as long as the user gets confirmation - it does not need to see pending - 
    not good from a UX pov but fine for timeframe)

Room Reservation System
Ruby - 3.4.1
Rails - 8.1.3.1

Database Model/Schema
Model names must be singular
Site
 -- has many rooms
Room 
 -- has many reservations

Site:
Name - string, 
Address - string, 
Description - string

Room:
Site - reference,
Name - string,
Capacity - integer,
Description - string

Reservation:
Room - reference, 
Reserver_name - string, 
Reservation_date - date, 
Start_time - time, 
End_time - time

Models..
app/model/Site..Room..Reservation
 - accepted almost everything that copilot gave
 - added extra for validations

 Rails through terminal added extra data in the rb files and i had to fix these before migration could work

We back added functionality to not double book in the reservation.rb 
Changed the Reservations Controllers.rb

db/seeds.rb
- Removed data upon reseeding
- Created 3 Sites
- Created data for each site
- printed conformation

AI here created data with missing commas, had to manually fix before seeding was successful


Controllers..
rails generate controller XX index show
Do this for Site, Room, Reservation
Creates app/controller files
Sites - accepted all AI input for index and show definitions
Rooms - did not accept inital AI input
Reservations - accepted probably 50% to 60% of AI input

Routes..
site - index and show
rooms - index and show
reservation - index, show, new, create, destroy

Accepted all AI input here

Routes let us (List/View Site), (List/View Rooms) and (List, View, and Create reserverations)


Views..
Site - index - Accepted most of the AI output, used different HTML headers and paragraphs to style than what AI gave
Site - show - Accepted almost all of AI output, added functionality to reserve the room, added link back to sites index
Room - index - Accepted all of the AI output 
Room - show - Accepted all of the AI output here
Reservations - index and show existed at creation via the command line but new and create didnt exist
Reservations - new - form to create a reservation
Reservations - show - showing of the servation with a delete button

Running Server..
Used Chat in VS Code to fix a lot of singular vs plural mistakes
Got basic functionality of reserving room without double booking

15 minutes left, starting to add users using chat in vs code. 
With Chat copilot - added the functionality to have a login using bcrypt,
added the functionalty to approve, deny, or pending view for both admin and staff