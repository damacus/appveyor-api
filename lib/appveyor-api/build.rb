# frozen_string_literal: true
# Build
def start_build
  #   {
  #     accountName: 'your-account-name',
  #     projectSlug: 'project-slug-from-url',
  #     branch: 'master',
  #     environmentVariables: {
  #        my_var: 'value',
  #        another_var: 'another value'
  #     }
  # }
end

def start_commit_buld
  #   {
  #     accountName: 'your-account-name',
  #     projectSlug: 'project-slug-from-url',
  #     branch: 'develop',
  #     commitId: '3e9d9468'
  # }
end

def start_pull_request_build
  #   {
  #     accountName: 'your-account-name',
  #     projectSlug: 'project-slug-from-url',
  #     pullRequestId: 3
  # }
end

def cancel_build
  # DELETE /api/builds/{accountName}/{projectSlug}/{buildVersion}
end
