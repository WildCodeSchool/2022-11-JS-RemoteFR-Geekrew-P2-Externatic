import { Link } from "react-router-dom";

import SearchBar from "../components/SearchBar";
import OffersContainer from "../components/OffersContainer";
import AdvancedSearchButton from "../components/AdvancedSearchButton";
import FavoriteDash from "../components/FavoriteDash";
import CompanyDash from "../components/CompanyDash";

import { useCurrentUserContext } from "../contexts/CurrentUserContext";

function Dashboard() {
  const { roles } = useCurrentUserContext();
  return (
    <div className="bg-background flex flex-col justify-center">
      {roles.includes("candidate") && (
        <>
          <SearchBar />
          <AdvancedSearchButton />
          <OffersContainer />
          <FavoriteDash />
        </>
      )}
      {roles.includes("company") && <CompanyDash />}
      <Link to="/Test-admin">Test Admin</Link>
    </div>
  );
}

export default Dashboard;
