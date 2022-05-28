## Date And Time

### timestamp
```shell
timestamp()
```
```terraform
resource "google_spanner_instance" "db" {
  display_name = "Application Database"
  labels = {
    "time_created" = timestamp()
  }
  lifecycle {
    ignore_changes = [
      labels,
    ]
  }
}
```
### timeadd
```shell
timeadd("2022-02-04T20:22:47Z", "4h")
```
```terraform
resource "google_spanner_instance" "db" {
  display_name = "Application Database"
  labels = {
    "time_to_live" = timeadd(timestamp(), "48h")
  }
}
```
### formatdate
```shell
formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ", timestamp())
"Sat, 28 May 2022 00:42:32 UTC"
```
```terraform
resource "google_spanner_instance" "db" {
  display_name = "Application Database"
  labels = {
    "time_modified" = formatdate(DD/MM/YY, timestamp())
  }
}
```