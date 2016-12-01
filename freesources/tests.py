# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from allauth.account import app_settings as account_settings
from django.test import TestCase
from freesources.forms import eventForm
from allauth.account.models import EmailAddress
from allauth.account.utils import user_email
from django.contrib.auth import get_user_model
from django.test.client import RequestFactory
from allauth.utils import get_user_model
from django.contrib.auth.models import AnonymousUser
from django.contrib.auth.models import User
from django.contrib.messages.middleware import MessageMiddleware
from django.contrib.sessions.middleware import SessionMiddleware
from django.test.utils import override_settings
import MySQLdb

# Create your tests here.
class FreesourcesTestCase(TestCase):
    @override_settings(
        SOCIALACCOUNT_AUTO_SIGNUP=True,
        ACCOUNT_SIGNUP_FORM_CLASS=None,
        ACCOUNT_EMAIL_VERIFICATION=account_settings.EmailVerificationMethod.NONE # noqa
    )

    def setUp(self):
        """Sets up the test environment before each test."""
        self.client.login(username="teamace", password='grapes1234')
        # Setup tables in database

    def tearDown(self):
        """Tears down the test environment before each test."""
        # Drop tables in database
        pass

    def test_index(self):
        """Tests the index function of views.py. This test requires an Events table in the MySQL test database."""

        # Make sure index operates properly for GET requests
        resp = self.client.get('/freesources/')
        self.assertEqual(resp.status_code, 200)

        resp = self.client.get('/freesources/1')
        self.assertEqual(resp.status_code, 404)

        resp = self.client.get('/freesources/a')
        self.assertEqual(resp.status_code, 404)

        resp = self.client.get('/freesources/a1')
        self.assertEqual(resp.status_code, 404)

        resp = self.client.get('/freesources/abcdefg123abcdefg123')
        self.assertEqual(resp.status_code, 404)

    def test_add_marker(self):
        """Tests the add marker functionality of the project."""
        #self.assertEqual(resp.context['some_response_element'], "Expected response")

        # Send POST request with no data
        resp = self.client.post('/freesources/')

        # Send proper post request
        resp = self.client.post('/freesources/')
        self.assertEqual(resp.context, None)
        self.assertEqual(resp.status_code, 302)

        # Send malformed POST request
        resp = self.client.post('/freesources/', {'t_id' : '', 'exp_typ' : '', 'start_time' : '', 'expiration' : '', 'description' : '', 'location' : ''})
        self.assertEqual(resp.status_code, 302)
        self.assertEqual(resp.context, None)

    def test_create_account(self):
        """Tests the create account functionality of the project."""

        # Create an account with fake user data and login
        
        #User = get_user_model()
        #my_user = User.objects.create_user('test123', email='test123@test.com', password='grapes1234')
        #logged_in = self.client.login(username="test123", password='grapes1234')
        #assertTrue(logged_in)

    def test_add_feedback(self):
        """Tests the add feedback functionality for an item on the map."""

        # Test feedback ID not found
        for nums in range(0, 10):
            resp = self.client.post('/freesources/feedback/%s')
            self.assertEqual(resp.status_code, 404)

        # Authenticate a user
        self.client.get('/accounts/')

        # Send same requests with authenticated user
        for nums in range(0, 10):
            resp = self.client.post('/freesources/feedback/%s')
            self.assertEqual(resp.status_code, 404)
