<nav class="navbar navbar-expand-lg navbar-light bg-white flex-row border-bottom shadow">
  <div class="container-fluid">
    <a class="navbar-brand mx-lg-1 mr-0" href="#">
      <b style="color:rgb(94, 41, 255)">ULTIMATE TEAM RACE</b>
    </a>
    <button class="navbar-toggler mt-2 mr-auto toggle-sidebar text-muted">
      <i class="fe fe-menu navbar-toggler-icon"></i>
    </button>
    <div class="navbar-slide bg-white ml-lg-4" id="navbarSupportedContent">
      <a href="#" class="btn toggle-sidebar d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
        <i class="fe fe-x"><span class="sr-only"></span></i>
      </a>
      <ul class="navbar-nav mr-auto">
        <li class="nav-item dropdown">
          <a href="/acceuil-equipe" id="dashboardDropdown" class="nav-link" role="button">
            <span class="ml-lg-2 mr-lg-2">Accueil</span><span class="sr-only"></span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a href="/liste-etape-equipe" id="dashboardDropdown" class="nav-link" role="button" >
            <span class="ml-lg-2 mr-lg-2">Etapes</span><span class="sr-only">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a href="/classement-generale-equipe" id="dashboardDropdown" class="nav-link" role="button">
            <span class="ml-lg-2 mr-lg-2">Classement equipe</span><span class="sr-only"></span>
          </a>
        </li>
        
      </ul>
    </div>
    
    <ul class="navbar-nav d-flex flex-row">
      <li class="nav-item">
        <a class="nav-link text-muted my-2" href="./#" id="modeSwitcher" data-mode="dark">
          <i class="fe fe-sun fe-16"></i>
        </a>
      </li>
      <li class="nav-item dropdown ml-lg-0">
        <a class="nav-link dropdown-toggle text-muted" href="#" id="navbarDropdownMenuLink" role="button"
          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="avatar avatar-sm mt-2">
            <img src="./assets/avatars/face-1.jpg" alt="..." class="avatar-img rounded-circle">
          </span>
        </a>
        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
          <li class="nav-item">
            <a class="nav-link pl-3" href="equipe-log-out">Deconnection</a>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</nav>