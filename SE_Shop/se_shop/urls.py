"""se_shop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from jobs.views import jobs
from about.views import about,index
from product.views import product
from cart.views import cart,addtocart,cartorder,cartok,cartordercheck,myorder
from login.views import login,logout,register,manage
from message.views import message


urlpatterns = [
    path("admin/", admin.site.urls),
    path("jobs/",jobs),
    path("",index),
    path("about/",about),
    path("product/",product),
    path("cart/",cart),
    path("addtocart/<str:ctype>/",addtocart),
    path("addtocart/<str:ctype>/<int:productid>/",addtocart),
    path("cartorder/",cartorder),
    path("cartok/",cartok),
    path("cartordercheck/",cartordercheck),
    path('myorder/',myorder),
    path("login/",login),
    path("logout/",logout),
    path("register/",register),
    path("member/",manage),
    path("message/",message),
    
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)