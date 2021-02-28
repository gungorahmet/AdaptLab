from django.shortcuts import render

from rest_framework.views import APIView
from rest_framework.response import Response
from django.shortcuts import render
# Create your views here.

response = {"response": {"test": "value"}}

class Docpage(APIView):
    def get(self, request):
        try:
            return render(request, "documentation.html", response)
        except Exception as e:
            print(e)
            return Response(status=500)