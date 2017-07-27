import os
import json

from django.views.generic import TemplateView
from django.conf import settings 

from .helper import create_json_response, tree_to_json

class HomePageView(TemplateView):
    template_name = "fbe/file_browser.html"

def get_root_folder_info(request, *args, **kwargs):
    root_folder_json = tree_to_json(settings.SAMPLE_SOURCE_DIR)
    return create_json_response(root_folder_json, safe=False)

def serve_file(request, *args, **kwargs):
    if 'path' in request.GET:
        try:
            file_abs_path = os.path.join(settings.SAMPLE_SOURCE_DIR,
                                         request.GET['path'])
            file_content = None
            with open(file_abs_path) as f:
                file_content = f.read()

            return create_json_response({
                "return_code": 200,
                "content": file_content
            })
        except Exception:
            return create_json_response({"return_code": "404"}, status=404)

    else:
        return create_json_response({"return_code": "400"}, status=400)
