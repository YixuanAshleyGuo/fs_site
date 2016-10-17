from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.db import connection
from django.contrib.auth.decorators import login_required

# Index page, with map and markers
def index(request):
	#Event table inner join feedback, join tag table; pass result to index page to display on map
    with connection.cursor() as cursor:
        cursor.execute("SELECT ev.*,t.tag_name,f.feedback_type FROM Events ev INNER JOIN Events e ON ev.event_id = e.event_id INNER JOIN Tag t ON ev.tag_id = t.tag_id LEFT JOIN Feedback f ON ev.event_id = f.event_id")
        events = dictfetchall(cursor)       
    context = {
        'events': events,
    }
    return render(request,'freesources/index.html', context)

# transfer the raw pulled database data into dictionary format
def dictfetchall(cursor):
#    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

# feedback adding view, require user to be logged in
from django.contrib.auth.decorators import login_required
def feedback(request,fd_type,event_id):
    with connection.cursor() as cursor:
        cursor.execute("INSERT INTO Feedback (event_id,feedback_type,user_id) VALUES (%s, %s, %s)",
                      [event_id,fd_type,request.user.id])
    
    return index(request)
