from django.shortcuts import render_to_response
from TimeSheetApp.models import TimeSheetMain
from django.contrib.auth.decorators import login_required
from django.shortcuts import RequestContext, redirect
from django.contrib import auth
from django.shortcuts import redirect


@login_required(redirect_field_name='login.html')

def home(request):
      query_result = TimeSheetMain.objects.filter(user=request.user).values('startDate', 'endDate', 'status', 'timeSheet_code') # these variables are being passed to dashboard.html for use for currnetly logged in suer
      return render_to_response('dashboard.html', {'query_result': query_result}, context_instance=RequestContext(request))

def logout(request):
    auth.logout(request)

    return redirect('/')


# def ts_forward(request):
#      ts = TimeSheetMain.objects.filter(user=request.user).values('startDate')
#      return redirect('ts.html', {'ts': ts}, context_instance=RequestContext(request))


# query_result = TimeSheetMain.objects.all().values_list('employee_id', 'startDate').order_by('employee_id')
# model_type = ContentType.objects.get(app_label=app_label, model=model_name)
# objects = model_type.model_class().objects.all()


#BACKUP

# query_result = TimeSheetMain.objects.all().values_list('employee_id', 'startDate') # .select_related?('player__positionstats')
# query_result = TimeSheetMain.objects.all().values_list('employee_id', 'startDate').order_by('employee_id')
# model_type = ContentType.objects.get(app_label=app_label, model=model_name)
# objects = model_type.model_class().objects.all()

# def time(request):
#    query_results = TimeSheetMain.objects.all()
#    return TemplateResponse('dashboard.html', query_results, context_instance=RequestContext(request))



# def queryset(self, request):
#    if request.user.is_superuser:
# return Vendor.objects.all()
# return Vendor.objects.filter(vendor_account=request.user)

# return a response to your template and add query_results to the context


# def time(request):
#    return TemplateResponse(request, 'dashboard.html', {'item': TimeSheetMain.objects.all()})

