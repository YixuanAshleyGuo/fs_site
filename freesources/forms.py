from django import forms
import datetime
from django.db import connection

EXP_TYPE = (
	('Temporary', 'Temporary'),
	('Permanent', 'Permanent'),
	('Recurrent', 'Recurrent'),
)
TAG_ID = (
	('1', 'AED'),
	('2', 'Free Food'),
	('3', 'Event'),
	('4', 'Restroom'),
	('5', 'Vaccines'),
	('6', 'Health Check-ups'),
	('7', 'Water'),
)
class eventForm(forms.Form):
    # tag_id = forms.ModelChoiceField(connection.cursor().execute("SELECT tag_id FROM Tag"))
    tag_id = forms.ChoiceField(choices = TAG_ID, widget=forms.Select(attrs={'class':'form-control'}))
    exp_type = forms.ChoiceField(choices = EXP_TYPE, widget=forms.Select(attrs={'class':'form-control'}))
    latitude = forms.FloatField(widget=forms.NumberInput(attrs={'class':'form-control'}))
    longitude = forms.FloatField(widget=forms.NumberInput(attrs={'class':'form-control'}))
    # tag = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control'}),max_length=255)
    start_time = forms.DateTimeField(input_formats=['%Y-%m-%dT%H:%M'], widget=forms.DateTimeInput(attrs={'class':'form-control','type':'datetime-local'}),initial=datetime.date.today)
    #expiration = forms.DateTimeField(widget=forms.widgets.DateTimeInput(input_formats=["%d %b %Y %H:%M:%S %Z"]))
    expiration = forms.DateTimeField(input_formats=['%Y-%m-%dT%H:%M'],widget=forms.DateTimeInput(attrs={'class':'form-control','type':'datetime-local'}),initial=datetime.date.today)
    description = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control'}),max_length=1024)
    location = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control'}),max_length=255)