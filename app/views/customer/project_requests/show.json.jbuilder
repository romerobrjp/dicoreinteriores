json.id @project_request.id
json.description @project_request.description
json.space_type @project_request.space_type.as_json
json.attachments @project_request.attachments do |attachment|
  json.filename attachment.file_file_name
  json.content_type attachment.file_content_type
  json.url attachment.file.url
end
