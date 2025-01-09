<nav class="topnav navbar navbar-light">
  <button type="button" class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
    <i class="fe fe-menu navbar-toggler-icon"></i>
  </button>
  <ul class="nav">
    <li class="nav-item">
      <a class="nav-link text-muted my-2" href="#" id="modeSwitcher" data-mode="dark">
        <i class="fe fe-sun fe-16"></i>
      </a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle text-muted pr-0" href="#" id="navbarDropdownMenuLink" role="button"
        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="avatar avatar-sm mt-2">
          <img src="./${pageContext.request.contextPath}/assets/avatars/face-1.jpg" alt="..."
            class="avatar-img rounded-circle">
        </span>
      </a>
      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
        <a class="dropdown-item" href="equipe-log-out">Deconnection</a>
      </div>
    </li>
  </ul>
</nav>
<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
  <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
    <i class="fe fe-x"><span class="sr-only"></span></i>
  </a>
  <nav class="vertnav navbar navbar-light">
    <!-- nav bar -->
    <div class="w-100 mb-4 d-flex">
      <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="#">
        <b style="color:rgb(0, 255, 4)">Pharmacie</b>
      </a>
    </div>
    <!-- <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="/" data-toggle="collapse" aria-expanded="false" class="nav-link">
          <i class="fe fe-home fe-16"></i>
          <span class="ml-3 item-text">Accueil</span><span class="sr-only">(current)</span>
        </a>
      </li>
    </ul> -->
    <p class="text-muted nav-heading mt-4 mb-1">
      <span>Apps</span>
    </p>
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item w-100">
        <a class="nav-link" href="/">
          <!-- <i class="fe fe-calendar fe-16"></i> -->
          <span class="ml-3 item-text">Liste Produit</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a href="#contact" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
          <!-- <i class="fe fe-chart fe-16"></i> -->
          <span class="ml-3 item-text">Vente</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="contact">
          <a class="nav-link pl-3" href="#"><span class="ml-1">Ajoute</span></a>
          <a class="nav-link pl-3" href="#"><span class="ml-1">Analyse</span></a>
          <a class="nav-link pl-3" href="/vente-product"><span class="ml-1">Liste</span></a>
        </ul>
      </li>
      
    </ul>

  </nav>
</aside>