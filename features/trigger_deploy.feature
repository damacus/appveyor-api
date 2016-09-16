Feature: Trigger Deployment
  As a developer
  I want a specific version of the build on the server
  So that I cna have matching environments

  Scenario Outline:
    Given I have an <environment> appveyor environment
    When I want to find out about the firewall ports
    Then I should find them in a document

  Examples:
    | environment |
    | production  |

  Scenario Outline:
    Given I have an <environment> environment
    When I want to find out about the architecture of the infrastructure
    Then I should find an infrastructure diagram

  Examples:
    | environment |
    | production  |
