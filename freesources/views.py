from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect

from django.shortcuts import render, redirect, get_object_or_404
from django.db import connection
from django.contrib.auth.decorators import login_required
from .forms import eventForm


# Index page, with map and markers
def index(request):
    # temporary adding event function, to be improved later
    #if this is a POST request
    if request.method == 'POST':
        form = eventForm(request.POST)
        #check for validation
        if form.is_valid():
            #form.save()
            data = form.cleaned_data
            with connection.cursor() as cursors:
                cursors.execute("INSERT INTO Events (tag_id, longitude, latitude, location, description, expire_type, start_time, expiration) VALUES (%s,%s,%s,%s,%s,%s,%s,%s);",
                                [data['tag_id'],data['longitude'],data['latitude'], data['location'], data['description'], data['exp_type'], data['start_time'],data['expiration']])
            return HttpResponseRedirect('/freesources/')
        else:
            HttpResponse("Adding new event not successful")
    elif request.method == 'GET':
        form = eventForm()
    else:
        return 0;

	#Event table inner join feedback, join tag table; pass result to index page to display on map
    with connection.cursor() as cursor:
        cursor.execute("""SELECT ev.*,t.tag_name,f.feedback_type, f_rej_f.fb as rej_false, f_rej_e.fb as rej_exp, f_confirm.fb as confirm
            FROM Events ev 
            INNER JOIN Events e ON ev.event_id = e.event_id 
            INNER JOIN Tag t ON ev.tag_id = t.tag_id 
            LEFT JOIN Feedback f ON f.user_id = %s AND ev.event_id = f.event_id
            LEFT JOIN (
            SELECT f.event_id, COUNT(*) as fb FROM Feedback f WHERE f.feedback_type = 'rej_false' 
            GROUP BY f.event_id
            ) f_rej_f ON f_rej_f.event_id = ev.event_id
            LEFT JOIN (
            SELECT f.event_id, COUNT(*) as fb FROM Feedback f WHERE f.feedback_type = 'rej_exp' 
            GROUP BY f.event_id
            ) f_rej_e ON f_rej_e.event_id = ev.event_id
            LEFT JOIN (
            SELECT f.event_id, COUNT(*) as fb FROM Feedback f WHERE f.feedback_type = 'confirm' 
            GROUP BY f.event_id
            ) f_confirm ON f_confirm.event_id = ev.event_id
            ;""",[request.user.id])
            
        # cursor.execute("""SELECT COUNT(*)
        #     FROM 
        #     LEFT JOIN Feedback f_rej_f ON f_rej_f.feedback_type = 'rej_false' AND ev.event_id = f_rej_f.event_id
        #     LEFT JOIN Feedback f_rej_e ON f_rej_e.feedback_type = 'rej_exp' AND ev.event_id = f_rej_e.event_id
        #     LEFT JOIN Feedback f_confirm ON f_confirm.feedback_type = 'confirm' AND ev.event_id = f_confirm.event_id
        #     GROUP BY ev.event_id;
        #     """,
        #     [request.user.id])
        events = dictfetchall(cursor)    
  
    context = {
        'events': events,
        'form': form,
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
@login_required
def feedback(request,fd_type,event_id):
    with connection.cursor() as cursor:
        cursor.execute("DELETE FROM Feedback WHERE event_id = %s AND user_id = %s",
            [event_id,request.user.id])

        cursor.execute("INSERT INTO Feedback (event_id,feedback_type,user_id) VALUES (%s, %s, %s)",
                      [event_id,fd_type,request.user.id])
    
    return HttpResponseRedirect('/freesources/')