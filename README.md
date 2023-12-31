<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
<a href="https://civic-voice-plus-fe.onrender.com/">
  <img src="app/assets/images/cvp_logo.png" alt="Logo" width="100" height="100">
</a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/jcjurado3/civic_voice_plus_fe">
    <img src="app/assets/images/CVP main.png" alt="main page">
  </a>

<h3 align="center">CivicVoice Plus</h3>

  <p align="center">
    Welcome to the front end repository for CivicVoicePlus!
    CivicVoicePlus is a web application built for the Turing School of Software and Design's Mod 3 Consultancy project. Read more about project requirements: https://backend.turing.edu/module3/projects/consultancy/
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#Back End Repository">Back End Repository</a></li>
        <li><a href="#Front End Repository">Front End Repository</a></li>
      </ul>
    </li>
    <li><a href="#testing">Testing</a></li>
    <li><a href="#DB Design">DB Design</a></li>
    <li><a href="#Endpoints">Endpoints</a></li>
    <li><a href="#Technical Solutions">Technical Solutions</a></li>
    <li><a href="#Roadmap">Roadmap</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#Project Contributor Contact Info">Project Contributor Contact Info</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

CivicVoicePlus ("CV+") is a civic data tool which aims to educate and inform users with relevant legislative information, empowering them to actively participate in civic matters and hold elected officials accountable for their actions. Users can select bill categories for their dashboard feed, search for and track the progress of specific bills, and easily access simplified bill summaries, status, and congressperson information.

The front end application handles user interaction through the browser, and is built on Rails with HTML and CSS styling. It is responsible for user authentication and authorization, and consumes RESTful endpoints exposed through the back end application to deliver data about search results, saved bills, and bill details to the views. The front end is also responsible for passing specific data through via JSON requests to perform CRUD actions in the back end database (ex. saving a bill for a specific user).

Our Production Site is available [here](https://civic-voice-plus-fe.onrender.com/)

Github repositories:
* Front End: [![Github][Github]][project-fe-gh-url]
* Back End:  [![Github][Github]][project-be-gh-url]

Video Walkthrough:

<!-- <video src="https://github.com/jcjurado3/civic_voice_plus_fe/assets/125082037/e575075e-f065-4a73-8ef1-171ad6de592b" title="CVP demo video"></video> -->


<!-- <video src="CVP%20Demo.mp4" controls title="CVP demo"></video> -->
<!-- https://github.com/jcjurado3/civic_voice_plus_fe/assets/125082037/ac65f1d0-7e38-4232-b2e7-a1b915e8494e -->




https://github.com/jcjurado3/civic_voice_plus_fe/assets/125082037/e575075e-f065-4a73-8ef1-171ad6de592b





<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Ruby][Ruby]][Ruby-url]
* [![Rails][Rails]][Rails-url]
* [![Tailwind][Tailwind]][Tailwind-url]
* [![Postgres][Postgres]][Postgres-url]
* [![Render][Render]][Render-url]
<!-- * [![Heroku][Heroku]][Heroku-url]
* [![CircleCI][CircleCI]][CircleCI-url] -->

CivicVoicePlus front end application uses these integrations:
* OAuth with Google for user authentication and log in
  * Gem: omniauth-google-oauth2, more information [here](https://github.com/zquestz/omniauth-google-oauth2)
* Tailwind was used for CSS styling
   * Gem: tailwindcss-rails, more information [here](https://github.com/rails/tailwindcss-rails)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To demo CivicVoicePlus on your local machine, follow these steps:

### Back End Repository
1. Clone the back end repo [here](https://github.com/jcjurado3/civic_voice_plus_be)
1. Follow instuctions in the front end repo `README`

### Front End Repository
1. Clone this repo `git clone git@github.com:jcjurado3/civic_voice_plus_fe.git`
1. Register for a google oauth key [here](https://developers.google.com/identity/protocols/oauth2)
1. Navigate to the local repository: `cd civic_voice_plus_fe`
1. Run: `bundle install`
1. Run: `rails db:{create,migrate}`
1. Run: `bundle exec figaro install`
1. Add `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` to config/application.yml file
1. Run: `rails s `to start rails server
1. Visit: http://localhost:5000/


### Prerequisites

* ruby 3.2.2
* Rails Version 7.0.6

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Testing -->
# Testing

`bundle exec rspec` will run the entire test suite. *All tests passing at time of writing.*
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DB Design -->
# DB Design
![database design](<CVP FE schema.png>)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Endpoints -->
## Endpoints
<details>
<summary> `route: "/"`</summary>
<br>
 <img src="app/assets/images/main_page_visitor.png" alt="visitor login">
 <img src="app/assets/images/main_page_logged_in.png" alt="user login 1">
 <img src="app/assets/images/main_page_user.png" alt="user login 2">

</details>
<br>
<details>
<summary>`route: "/dashboard" `</summary>
<br>

 <img src="app/assets/images/dashboard.png" alt="user dashboard">

</details>
<br>
<details>
<summary>`route: "/users/:id`</summary>
<br>

 <img src="app/assets/images/user edit categories.png" alt="user show edit categories">


</details>
<br>
<details>
<summary>`route: "/bills"`</summary>
<br>

 <img src="app/assets/images/bills search.png" alt="bill index search">


</details>
<br>

<details>
<summary>`route: "/bills/:id`</summary>
<br>

 <img src="app/assets/images/bill show page1.png" alt="bill show page1">
 <img src="app/assets/images/bill show page 2.png" alt="bill show page2">


</details>
<br>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Technical Solutions -->
## Technical Solutions:
As part of the Consultancy project requirements, the CivicVoicePlus team challenged ourselves to stretch technologies during the 11-day design and development process. We selected the following based on the challenges we anticipated facing while building out our MVP, and adjusted our choices to reflect our individual and team learning goals as well as blockers that came up during the course of working on the project.

### Caching
* Challenge: Two of the API endpoints that expose data for the front end of our application rely on both database queries and external API calls, which significantly slowed down the processing time and resulted in a less-than-ideal experience for our users. Additionally, we were hitting rate limits on our API endpoints.
* Solution: We decided cache our bill endpoints and save bills to our database since this is frequent endpoints and there are so many bills to render on both a users dashboard as well as bills show pages. We used the Rails.cache syntax and some helpful documentation to cache these requests on the back end. We decided not to implement caching for other API calls that would change frequently, such as the request to get all saved bills for a specific user.

### Mobile Friendly Design
* Challenge: In designing and styling the front end, we knew we wanted our app to be able to account for various browser sizes that allow a user to take their bill search and tracking on the go, wherever they may be!
* Solution: Utilizing Tailwind, we added flex containers to allow for various size browsers and made sure to test that our app's functionality was still successful!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Roadmap -->
## Roadmap
Additional features, functionality, and potential refactors:
  * Standard user registration and log in (to be added to the OAuth workflow)
  * Allow users to create custom search parameters to render on their user digest
  * Create functionality to allow users to opt into email or push notification on status updates of their saved bills
  * Consume OpenAI API and add functionality to a bills show page to read and summarize the entire bill's text document
  * Add in easy to contact officials via email or access petition information that they can send right to the elected officials from the app
  * Add nearest voting stations, dates, and updates for users and allow them to add calendar reminders that include the location and details of the polling site
  * Expanded error handling

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Project Contributor Contact Info
* Ashley Plasket: [![Linkedin][Linkedin-shield]][ashley-li-url] [![Github][Github]][ashley-gh-url]
* Jeff Redish:   [![Linkedin][Linkedin-shield]][jeff-li-url] [![Github][Github]][jeff-gh-url]
* Jimmy Jurado [![Linkedin][Linkedin-shield]][jimmy-li-url] [![Github][Github]][jimmy-gh-url]
* Julian Beldotti [![Linkedin][Linkedin-shield]][julian-li-url] [![Github][Github]][julian-gh-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/jcjurado3/civic_voice_plus_be.svg?style=for-the-badge
[contributors-url]: https://github.com/jcjurado3/civic_voice_plus_be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/jcjurado3/civic_voice_plus_be.svg?style=for-the-badge
[forks-url]: https://github.com/jcjurado3/civic_voice_plus_be/network/members
[stars-shield]: https://img.shields.io/github/stars/jcjurado3/civic_voice_plus_be.svg?style=for-the-badge
[stars-url]: https://github.com/jcjurado3/civic_voice_plus_be/stargazers
[issues-shield]: https://img.shields.io/github/issues/jcjurado3/civic_voice_plus_be.svg?style=for-the-badge
[issues-url]: https://github.com/jcjurado3/civic_voice_plus_be/issues
[license-shield]: https://img.shields.io/github/license/jcjurado3/civic_voice_plus_be.svg?style=for-the-badge
[license-url]: https://github.com/jcjurado3/civic_voice_plus_be/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[ashley-li-url]: https://www.linkedin.com/in/ashley-plasket/
[jeff-li-url]: https://www.linkedin.com/in/jredish/
[jimmy-li-url]: https://www.linkedin.com/in/jimmy-jurado-093568131/
[julian-li-url]: https://www.linkedin.com/in/julian-beldotti-1a427824/
[Github]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[project-fe-gh-url]: https://github.com/jcjurado3/civic_voice_plus_fe
[project-be-gh-url]: https://github.com/jcjurado3/civic_voice_plus_be
[ashley-gh-url]: https://github.com/aplasket
[jeff-gh-url]: https://github.com/Jredish11
[jimmy-gh-url]: https://github.com/jcjurado3
[julian-gh-url]: https://github.com/JCBeldo
[Ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/en/
[Tailwind]: https://img.shields.io/badge/Tailwind-191970?style=for-the-badge&logo=tailwindcss&logoColor=white
[Tailwind-url]: https://tailwindcss.com/
[Rails]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/
[Postgres]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
[UnSplash]: https://img.shields.io/badge/Unsplash-C0C0C0?style=for-the-badge&logo=unsplash&logoColor=white
[UnSplash-url]: https://unsplash.com/
[Render]: https://img.shields.io/badge/Render-1E90FF?style=for-the-badge&logo=render&logoColor=white
[Render-url]: https://render.com/
[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://devcenter.heroku.com/articles/getting-started-with-rails7
[CircleCI]: https://img.shields.io/badge/circleci-343434?style=for-the-badge&logo=circleci&logoColor=white
[CircleCI-url]: https://circleci.com/
