import React, { useState } from "react";
import { AlertColor, AlertContent } from "../../shared/types.interface";

const useAlert = () => {
  const [alertIsActive, setAlertActive] = useState(false);
  const [alertContent, setAlertContent] = useState<AlertContent>({
    color: "blue",
    message: "",
  });

  const handleAlert = (content?: AlertContent) => {
    setAlertActive(!alertIsActive);
    if (content) setAlertContent(content);
  };

  return { alertIsActive, alertContent, handleAlert };
};

export default useAlert;
