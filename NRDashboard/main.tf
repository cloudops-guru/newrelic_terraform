
resource "newrelic_one_dashboard" "this" {
  name        = "${var.project}-${var.env}"
  permissions = "public_read_only"
  # To create TABS in dashboard
  dynamic "page" {
    for_each = var.resources
    content {
      # To display TABS name in dashboard
      name = page.value["bu"]
      # To create graph in dashboard
      dynamic "widget_line" {
        # To create graph based on its title 
         
        for_each = (page.value["title"] == null) ? []  : page.value["title"]
        content { 
            column = (((widget_line.key % 3) * 4) + 1)
            height = 4 
            row    = (abs(format("%.0f", (widget_line.key / 3))) * 4) + 1
            width  = 4
            title  = upper(page.value["title"][widget_line.key])
            nrql_query {
                query = page.value["nrql_query"][widget_line.key]
            } 
        }
      }
      dynamic "widget_pie" {
        # To create graph based on its title
        for_each = (page.value["title_pie"] == null) ? [] : page.value["title_pie"] 
        content { 
            column = (((widget_pie.key % 3) * 4) + 1)
            height = 4 
            row    = (abs(format("%.0f", (widget_pie.key / 3))) * 4) + 1
            width  = 4
            title  = upper(page.value["title_pie"][widget_pie.key])
            nrql_query {
                query = page.value["nrql_query_pie"][widget_pie.key]
            } 
        }
      }
      dynamic "widget_table" {
        # To create graph based on its title
        for_each = (page.value["title_table"] == null) ? [] : page.value["title_table"] 
        content { 
            column = (((widget_table.key % 3) * 4) + 1)
            height = 4 
            row    = (abs(format("%.0f", (widget_table.key / 3))) * 4) + 1
            width  = 4
            title  = upper(page.value["title_table"][widget_table.key])
            nrql_query {
                query = page.value["nrql_query_table"][widget_table.key]
            } 
        }
      }

      dynamic "widget_billboard" {
        # To create graph based on its title
        for_each = (page.value["title_billboard"] == null) ? [] : page.value["title_billboard"] 
        content { 
            column = (((widget_billboard.key % 3) * 4) + 1)
            height = 4 
            row    = (abs(format("%.0f", (widget_billboard.key / 3))) * 4) + 1
            width  = 4
            title  = upper(page.value["title_billboard"][widget_billboard.key])
            nrql_query {
                query = page.value["nrql_query_billboard"][widget_billboard.key]
            } 
        }
      }

      dynamic "widget_bar" {
        # To create graph based on its title
        for_each = (page.value["title_bar"] == null) ? [] : page.value["title_bar"] 
        content { 
            column = (((widget_bar.key % 3) * 4) + 1)
            height = 4 
            row    = (abs(format("%.0f", (widget_bar.key / 3))) * 4) + 1
            width  = 4
            title  = upper(page.value["title_bar"][widget_bar.key])
            nrql_query {
                query = page.value["nrql_query_bar"][widget_bar.key]
            } 
        }
      }
    }
  }
}
