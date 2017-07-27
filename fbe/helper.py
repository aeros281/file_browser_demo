import os
import json

from django import http
from django.conf import settings

def create_json_response(json_content, *args, **kwargs):
    return http.HttpResponse(json.dumps(json_content), content_type="application/json", *args, **kwargs)

if hasattr(http, 'JsonResponse'):
    create_json_response = http.JsonResponse

def file_to_dict(fpath):
    return {
        'name': os.path.basename(fpath),
        'text': os.path.basename(fpath),
        'type': 'file',
        'icon': 'jstree-file',
        'path': fpath.replace(settings.SAMPLE_SOURCE_DIR + '/', ''),
        'tag': 'org',
        'li_attr': {
            'isLeaf': True,
            'file_path': fpath.replace(settings.SAMPLE_SOURCE_DIR + '/', ''),
        },
    }

def folder_to_dict(rootpath):
    return {
        'name': os.path.basename(rootpath),
        'text': os.path.basename(rootpath),
        'icon': 'jstree-folder',
        'type': 'folder',
        'path': rootpath.replace(settings.SAMPLE_SOURCE_DIR + '/', ''),
        'tag': 'org',
        'li_attr': {
            'isLeaf': False,
            'file_path': rootpath.replace(settings.SAMPLE_SOURCE_DIR + '/', ''),
        },
        'children': [],
    }

def tree_to_dict(rootpath):
    root_dict = folder_to_dict(rootpath)
    root, folders, files = next(os.walk(rootpath))
    root_dict['children'] = [file_to_dict(os.path.sep.join([root, fpath])) for fpath in files]
    root_dict['children'] += [tree_to_dict(os.path.sep.join([root, folder])) for folder in folders]
    return root_dict

def tree_to_json(rootdir):
    root, folders, files = next(os.walk(rootdir))
    root_dict = [tree_to_dict(os.path.sep.join([root, folder])) for folder in folders]
    root_dict += [file_to_dict(os.path.sep.join([root, fpath])) for fpath in files]
    return root_dict
