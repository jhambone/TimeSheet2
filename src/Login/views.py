# from django.shortcuts import render, render_to_response, RequestContext

# Create your views here.
from django.shortcuts import render, render_to_response, RequestContext, HttpResponseRedirect
from django.contrib.auth import authenticate, login
from django.core.urlresolvers import reverse

# NEED TO IMPORT DASHBOARD MODULE

def login_user(request):
    state = ""
    username = password = ''
    if request.POST:
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                state = "You're successfully logged in!"

                return HttpResponseRedirect('/dashboard/')

            else:
                state = "Your account is not active, please contact the site admin."
        else:
            state = "Your username and/or password were incorrect."

    return render_to_response('login.html',{'state':state, 'username': username})


