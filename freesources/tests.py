# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.test import TestCase
from freesources.forms import eventForm

# Create your tests here.
class FreesourcesTestCase(TestCase):

	def setUp(self):
		pass

	def test_index(self):
		resp = self.client.get('/freesources/')
		self.assertEqual(resp.status_code, 200)

	def test_add_marker(self):
		# Send post request

		resp = self.client.post('/freesources/', {'tag_id' : '', 'exp_type' : '', 'start_time' : '', 'expiration' : '', 'description' : '', 'location' : ''})
		self.assertEqual(resp.status_code, 404)

		resp = self.client.post('/freesources/')
		self.assertEqual(resp.status_code, 200)
		self.assertEqual(resp.context['some_response_element'], "Expected response")

	def test_create_account(self):
		pass

	def test_add_feedback(self):
		resp = self.client.post('/freesources/feedback/1')


