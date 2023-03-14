import React from "react";
import { useCurrentUserContext } from "../contexts/CurrentUserContext";

import circle from "../assets/images/circle.png";
import plusIcon from "../assets/Icons/plus-circle.svg";

function ProfilePic() {
  const { dispatch } = useCurrentUserContext();

  const handleInput = (e) => {
    dispatch({
      type: "HANDLE_INPUT",
      field: e.target.name,
      payload: e.target.value,
    });
  };

  return (
    <>
      <div className="relative flex flex-row justify-center h-28 w-28 items-center">
        <img src={circle} alt="" className="absolute" />
        <img src={plusIcon} alt="" className="absolute h-6 invert" />
        <img src="" alt="" className="absolute" />
      </div>
      <input
        onChange={handleInput}
        className="border-2"
        name="picture"
        type="text"
      />
    </>
  );
}

export default ProfilePic;
