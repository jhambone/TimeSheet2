from django.contrib import admin
from .models import TimeSheetMain, TimeSheetLineCell, Employee, Department, LaborType, TaskOrder

# Register your models here.

admin.site.register([TimeSheetMain, TimeSheetLineCell, Employee, Department, LaborType, TaskOrder])
