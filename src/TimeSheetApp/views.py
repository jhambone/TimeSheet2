from django.shortcuts import RequestContext, render_to_response, HttpResponseRedirect, get_object_or_404
from datetime import timedelta, date
from .models import TimeSheetMain, TimeSheetLineCell, Employee
from django.forms.models import modelformset_factory
from .forms import TimeSheetLineCellForm

def daterange(start_date, end_date):
    for n in range(int((end_date - start_date).days)):
        yield start_date + timedelta(n)

def time_page(request, result_name):   #when called in URL it needs to have identifiers for all parameters

    records = TimeSheetMain.objects.get(timeSheet_code=result_name)

    #Timesheet Date Range filler
    start = records.startDate
    end = records.endDate
    start_Date_as_date = date(int(start.strftime("%Y")), int(start.strftime("%m")), int(start.strftime("%d")))
    end_Date_as_date = date(int(end.strftime("%Y")), int(end.strftime("%m")), int(end.strftime("%d")))
    rangeofdates = daterange(start_Date_as_date, end_Date_as_date)

    req_user = request.user
    recordsUser = records.user

    empID = Employee.objects.get(user=recordsUser) #.get is used for when there is only 1 record!

    if req_user == recordsUser:

        TimeSheetForm = modelformset_factory(TimeSheetLineCell, form=TimeSheetLineCellForm, can_delete=False)
     #   qset = TimeSheetLineCell.objects.filter().values('hours', 'unit') #CORRECT - only pulls hours and unit

        timesheetformset = TimeSheetForm(queryset=TimeSheetLineCell.objects.filter(timeSheet_code=records))

        if request.method == 'POST':
            timesheetformset = TimeSheetForm(request.POST, request.FILES)

            if timesheetformset.is_valid():
                timesheetformset.save()
                return HttpResponseRedirect('')

    return render_to_response('ts.html', {'records': records,
                                          'timesheetformset': timesheetformset,
                                          'empID': empID,
                                          'rangeofdates': rangeofdates,
                                          }, context_instance=RequestContext(request))








