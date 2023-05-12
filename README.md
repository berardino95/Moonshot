# Moonshot

Moonshot is  an app that show from 2 JSON file all the Apollo mission.
There is a Mission.json that contains all the information about Name, Description, Launch Date and Crew.
There is an astronauts.json that contains a list of astronauts whit all the information about every astronaut.

In a Bundle extension there is a generic function that decodes the data from the JSON file.

When you launch the app, you can see all the mission in a List or Grid View. You can change the showed layout clicking the button in the top right corner.
Tapping on a mission, you can see the detail in a ScrollView. At the end of the view there is a horizontal ScrollView that show the crew member.
Tapping on a member you can see the detail about the member.

The layout selected is stored in UserDefault, when you relaunch the app the last Layout selection is loaded


Used in this project: Bundle, Extension, Generic, JSONDecoder, UserDefault, GridView, ListView, Animation, toolbar, GeometryReader




https://github.com/berardino95/Moonshot/assets/26569311/17526309-d784-42ca-86f4-d3fcc7f26944

