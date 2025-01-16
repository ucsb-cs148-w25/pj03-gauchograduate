import './Navbar.css'

const Navbar = () => {
  
  return (

    <nav className="navbar">
      <div className="navbar-left">
        <a href="/" className="logo">
          GauchoGraduate
        </a>
      </div>
      <div className="navbar-center">
        <ul className="nav-links">
          <li>
            <a href="/planner">Planner</a>
          </li>
          <li>
            <a href="/courses">Courses</a>
          </li>
        </ul>
      </div>
      <div className="navbar-right">
        <a href="/account" className="user-icon">
          <i className="fas fa-user"></i>
        </a>
      </div>
    </nav>
  )
}

export default Navbar