# NewLMS

# All routes of NelLMS applications
Verb URI Pattern  \n                                       Controller#Action
GET  /teachers/:id/studentsprogress(.:format)            teachers#studentsprogress
GET  /students/:id/setprogress/:lesson_content(.:format) students#setprogress
GET  /students/:id/progress(.:format)                    students#progress

# To run all spec of models
$rspec spec/models