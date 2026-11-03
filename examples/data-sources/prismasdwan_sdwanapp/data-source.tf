# Find an SD-WAN app by its exact name; the id and the versions are what prismasdwan_sdwanapps_config needs.
data "prismasdwan_sdwanapp" "email" {
  name = "Email Notifications For Alarm-Alerts"
}

output "email_app_id" {
  value = data.prismasdwan_sdwanapp.email.id
}

# all releases of the app: 1.5.0, 1.4.0, ...
output "email_app_versions" {
  value = data.prismasdwan_sdwanapp.email.versions
}
