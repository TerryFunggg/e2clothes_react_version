import React, { createContext } from "react";
import useAlert from "./useAlert";
import MyAlert from "./MyAlert";
import { AlertColor, AlertInitial } from "../../shared/types.interface";

type Props = {
  children: React.ReactNode;
};

const init: AlertInitial = {
  alertIsActive: false,
  handleAlert: () => {},
  alertContent: {
    color: "blue",
    message: "",
  },
};

const AlertContext = React.createContext(init);

const AlertProvider = ({ children }: Props) => {
  const { alertIsActive, handleAlert, alertContent } = useAlert();
  return (
    <AlertContext.Provider value={{ alertIsActive, handleAlert, alertContent }}>
      <MyAlert />
      {children}
    </AlertContext.Provider>
  );
};

export { AlertProvider, AlertContext };
