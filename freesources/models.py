# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


TAG_ID = (
	('1', 'AED'),
	('2', 'Free Food'),
	('3', 'Event'),
	('4', 'Restroom'),
	('5', 'Vaccines'),
	('6', 'Health Check-ups'),
	('7', 'Water'),
)

# Create your models here.
class Marker(models.Model):
	location = models.CharField(max_length=255)

class Filter(models.Model):
	tag_type = models.CharField(max_length=255)