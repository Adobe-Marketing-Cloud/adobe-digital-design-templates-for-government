$(document).ready ->

    # find all form input and append the label the way it's supposed to be done with BA
    $("body input[type!='hidden']").each ->
        thisguy = $(this)
        formval = thisguy.attr("value")
        thisid = thisguy.attr("id")
        if formval and thisid
            thisguy.parent().append "<label for=\"" + thisid + "\">" + formval + "</label>"
            $(thisguy.parent()).contents().filter(->
                @nodeType is 3
            ).each ->
                @textContent = ""



    # for accessibility, find all navigation elements and add the role 'navigation' to them, to meet accesibility standards
    $(".usa-sidenav-list").attr "role", "navigation"
    $(".usa-topnav-list").attr "role", "navigation"
