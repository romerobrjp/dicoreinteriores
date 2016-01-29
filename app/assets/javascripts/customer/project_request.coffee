angular.module 'project_request', ['ngResource', 'angularFileUpload']
.factory 'ProjectRequest', ['$resource', ($resource) ->
  $resource '/customer/project_requests.json/:id', {id: '@id'}, {
    'create' :  {method: 'POST', url: '/customer/project_requests.json'},
    'update' :  { method: 'PUT', url: '/customer/project_requests/:id.json' },
    'get'    :  { method: 'GET', url: '/customer/project_requests/:id.json' }
    'destroy':  { method: 'DELETE', url: '/customer/project_requests/:id.json' }
  }
]
.controller 'NewProjectRequestCtrl', ['$scope', 'ProjectRequest', 'FileUploader', '$http', 'Notification', ($scope, ProjectRequest, FileUploader, $http, Notification) ->

  url = window.location.pathname
  if url.indexOf('/edit') > 0
    @project_request = ProjectRequest.get(id: url.match(/\d+/g)[0])
  else
    @project_request = {description: 'empty', attachments: []}

  @step = 1

  @uploader = new FileUploader {
    url: '/attachments/ng_upload',
    formData: [{attachable_type: 'ProjectRequest', attachable_id: @project_request.id}]
  }
  @uploader.onSuccessItem = (fileItem, response, status, headers) =>
    return

  @next = () =>
    if @project_request.id?
      ProjectRequest.update @project_request, (data) =>
        @project_request = data
        @uploader.formData[0]['attachable_id'] = @project_request['id']
        Notification.primary('Project Request Saved');
        @step++
        return
    else
      ProjectRequest.save @project_request, (data) =>
        @project_request = data
        @uploader.formData[0]['attachable_id'] = @project_request['id']
        Notification.primary('Project Request Saved');
        @step++
        return
    return

  @delete = () =>
    ProjectRequest.destroy @project_request, () ->
      Notification.primary('Project Request Deleted');
      window.location.assign("/customer/project_requests")
      return
    return

  @deleteAttachment = (attachment) =>
    $http.delete('/attachments/ng_delete/' + attachment.id)
      .then((response) =>
        i = @project_request.attachments.indexOf(attachment)
        @project_request.attachments.splice(i, 1)
        Notification.primary('Attachment Deleted');
        return
      )
    return

  @isImage = (contentType) ->
    return contentType.search(/image/g) >= 0

  return
]
.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  return
]
