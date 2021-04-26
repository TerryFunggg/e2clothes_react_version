import React, { useContext } from "react";
import ReactDOM from "react-dom";
import { AlertContext } from "./MyAlertContext";

const alertRoot = document.getElementById("alert-root") as HTMLElement;
export default function Alert() {
  const { alertContent, alertIsActive, handleAlert } = useContext(AlertContext);
  return ReactDOM.createPortal(
    <div
      className={`absolute flex justify-center overflow-hidden bottom-0 w-screen z-20 ${
        alertIsActive ? "block" : "hidden"
      }`}
    >
      <div
        className={`bg-${alertContent.color}-500 text-white font-bold m-10 mb-20 px-6 py-4 border-0 rounded-2xl relative  mb-4 alert shadow-xl`}
      >
        <input type="checkbox" className="hidden" id="alert" />
        <span className="text-xl inline-block mr-5 align-middle">
          <i className="fas fa-bell" />
        </span>
        <span className="inline-block align-middle mr-8">
          {alertContent.message}
        </span>
        <button
          className="absolute bg-transparent text-2xl font-semibold leading-none right-0 top-0 mt-4 mr-6 outline-none focus:outline-none"
          onClick={() => handleAlert()}
        >
          <span>×</span>
        </button>
      </div>
    </div>,
    alertRoot
  );
}
