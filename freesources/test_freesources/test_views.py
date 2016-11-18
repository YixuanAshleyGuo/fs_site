

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.test import TestCase
from django.test import Client
from freesources import views
import unittest

# test for item addition
class TestCase(TestCase):
    fixtures = ['test_data.json']
    def setUp(self):
        self.user = User.objects.create_user('testace',
                                             'ace@gmail.com', 'ace1234')
        # self.post = Post.objects.create(title="Test Post #1",
        #         body="Test Post #1 Body",
        #         author=self.user,
        #         date=datetime.datetime.now())
        self.c = Client()
        

    def test_post_creation(self):
        """
        Tests that we can create a Pos
        """
        self.assertEqual(self.post.title, "Test Post #1")
        self.assertEqual(self.post.author, self.user)


# test for feedback addition
def test_i_feedback_this(self):
    """
    Tests a new user marking the story as read.
    """
    self.c.login(username='newsposter', password='newspass')
    response = self.c.post('/freesources/feedback/1/', {'add':True})
    self.assertEqual(response.status_code, 200)
    self.assertEquals(response.content, '{\n    "read": true\n}')



#test for user sign up
def test_user(self):
    pass
