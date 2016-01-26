angular.module 'project_request', ['ngResource', 'angularFileUpload']
.factory 'ProjectRequest', ['$resource', ($resource) ->
  $resource '/customer/project_requests.json/:id', {id: '@id'}, {
    'create' :  {method: 'POST', url: '/customer/project_requests.json'},
    'update' :  { method: 'PUT', url: '/customer/project_requests/:id.json' },
    'get'    :  { method: 'GET', url: '/customer/project_requests/:id.json' }
    'destroy':  { method: 'DELETE', url: '/customer/project_requests/:id.json' }
  }
]
.controller 'NewProjectRequestCtrl', ['$scope', 'ProjectRequest', 'FileUploader', ($scope, ProjectRequest, FileUploader) ->
  @step = 1
  @project_request = {description: 'empty', attachments: []}
  ctrl = this

  @uploader = new FileUploader {
    url: '/attachments/ng_upload',
    formData: [{attachable_type: 'ProjectRequest'}]
  }
  @uploader.onSuccessItem = (fileItem, response, status, headers) ->
    return

  @next = () ->
    if ctrl.step == 1
      ProjectRequest.save ctrl.project_request, (data) ->
        ctrl.project_request = data
        ctrl.uploader.formData[0]['attachable_id'] = data['id']
        ctrl.step++
        return
    else
      ProjectRequest.update ctrl.project_request, (data) ->
        ctrl.project_request = data
        ctrl.step++
        return
    return
  @delete = () ->
    ProjectRequest.destroy ctrl.project_request, (data) ->
      return
  return
]
.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  return
]
