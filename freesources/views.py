from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect

from django.shortcuts import render, redirect, get_object_or_404
from django.db import connection
from django.contrib.auth.decorators import login_required
from .forms import ItemForm, ItemFormMark, TagSuggestion
from datetime import timedelta


# Index page, with map and markers
def index(request):
    # temporary adding event function, to be improved later
    form_mark = ItemFormMark()
    # if this is a POST request
    if request.method == 'POST':
        if request.user.is_authenticated():
            form = ItemForm(data=request.POST)
            #check for validation
            print("About to validate form")
            if form.is_valid():
                #form.save()
                print("form is valid")
                data = form.cleaned_data
                print(data['start_time'])
                if data['start_time'] is None:
                    start_time = data['start_time']
                else:
                    start_time = data['start_time'] - timedelta(hours=5)
                if data['expiration'] is None:
                    expiration = data['expiration']
                else:
                    expiration = data['expiration'] - timedelta(hours=5)
                with connection.cursor() as cursors:
                    cursors.execute("INSERT INTO fs_item (user_id, tag_id, longitude, latitude, location, description, expire_type, start_time, expiration) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s);",
                                    [request.user.id, data['tag_name'], data['longitude'],data['latitude'], data['location'], data['description'], data['expiration_type'], start_time,expiration])
                return HttpResponseRedirect('/freesources/')
            else:
                print("FAIL")
                HttpResponse("Adding new item not successful")
        else:
            return HttpResponseRedirect('/accounts/login')
    elif request.method == 'GET':
        form = ItemForm()
    else:
        return 0;

	#item table inner join feedback, join tag table; pass result to index page to display on map
    with connection.cursor() as cursor:
        cursor.execute("""SELECT ev.*,u.username, t.tag_name,f.feedback_type, f_rej_f.fb as rej_false, f_rej_e.fb as rej_exp, f_confirm.fb as confirm
            FROM fs_item ev 
            INNER JOIN fs_item e ON ev.item_id = e.item_id 
            INNER JOIN auth_user u ON ev.user_id = u.id
            INNER JOIN fs_tag t ON ev.tag_id = t.tag_id 
            LEFT JOIN fs_feedback f ON f.user_id = %s AND ev.item_id = f.item_id
            LEFT JOIN (
            SELECT f.item_id, COUNT(*) as fb FROM fs_feedback f WHERE f.feedback_type = 'rej_false' 
            GROUP BY f.item_id
            ) f_rej_f ON f_rej_f.item_id = ev.item_id
            LEFT JOIN (
            SELECT f.item_id, COUNT(*) as fb FROM fs_feedback f WHERE f.feedback_type = 'rej_exp' 
            GROUP BY f.item_id
            ) f_rej_e ON f_rej_e.item_id = ev.item_id
            LEFT JOIN (
            SELECT f.item_id, COUNT(*) as fb FROM fs_feedback f WHERE f.feedback_type = 'confirm' 
            GROUP BY f.item_id
            ) f_confirm ON f_confirm.item_id = ev.item_id
            ORDER BY ev.latitude, ev.longitude
            ;""",[request.user.id])
        items = dictfetchall(cursor)    
    context = {
        'items': items,
        'form': form,
        'form_mark': form_mark,
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
def feedback(request,fd_type,item_id):
    with connection.cursor() as cursor:
        cursor.execute("DELETE FROM fs_feedback WHERE item_id = %s AND user_id = %s",
            [item_id,request.user.id])

        cursor.execute("INSERT INTO fs_feedback (item_id,feedback_type,user_id) VALUES (%s, %s, %s)",
                      [item_id,fd_type,request.user.id])
    
    return HttpResponseRedirect('/freesources/')
@login_required
def tag_suggestion(request):
    if request.method == 'POST':
        if request.user.is_authenticated():
            form = TagSuggestion(data=request.POST)
            #check for validation
            print("About to validate form")
            if form.is_valid():
                #form.save()
                print("form is valid")
                data = form.cleaned_data
                with connection.cursor() as cursors:
                    #### was INSTER INTO fs_item
                    cursors.execute("INSERT INTO fs_tag_suggestion (user_id, tag_title, tag_description) VALUES (%s,%s,%s);",[request.user.id, data['tag_title'], data['tag_description']])
                    print("Successful execute!")
                return HttpResponseRedirect('/freesources/')
            else:
                print("FAIL")
                HttpResponse("Adding tag suggestion was not successful")
        else:
            return HttpResponseRedirect('/accounts/login')
    elif request.method == 'GET':
        form = TagSuggestion()
    else:
        return 0;
    context = {
        'form': form,
    }
    return render(request,'freesources/tag_suggestion.html', context)



