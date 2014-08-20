shinyUI(pageWithSidebar(
  headerPanel('Estimating Tastiness'),
  sidebarPanel(
    
    sliderInput('sweet', 'sweet', min = 0,max = 100,value = 50),
    sliderInput('salty', 'salty', min = 0,max = 100,value = 50),
    sliderInput('umami', 'umami', min = 0,max = 100,value = 50),
    sliderInput('sour', 'sour', min = 0,max = 100,value = 50),
    sliderInput('bitter', 'bitter', min = 0,max = 100,value = 25),
    sliderInput('piquant', 'piquant', min = 0,max = 100,value = 25)
    
  ),
  mainPanel(
    HTML("<p>Did you know that your tongue can only perceive 6 tastes?<br>
Use the sliders on the left to predict how a recipe will rate on a scale of 5.<br>
The data set is based on 2000 rated recipes gathered from around the web.</p>"),
    
    HTML(paste("<h2><center>We predict the tastiness index will be </center></h2><center><h1> ",textOutput("text1"),"</center></h1>")),
    HTML("<small>1 = Ewww<br>3 = Okay<br>5 = Finger licking good!</small>")

  )
))
