## Metriks: API Tracking Service and Reporting Tool

![Alt](/chart.png)

### Javascript Snippet

Include the Javascript code below in your application's `application.js` file.

```javascript
var blocmetrics = {};
  blocmetrics.report = function(eventName){
    var event = {event: { name: eventName }};
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  }
```
