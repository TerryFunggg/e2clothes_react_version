import { Dialog, Transition } from "@headlessui/react";
import React, { Fragment } from "react";
import ReactDOM from "react-dom";
import { DialogContext } from "./MyDialogContext";

const dialogRoot = document.getElementById("dialog-root") as HTMLElement;
export default function MyDialog() {
  const { dialogIsActive, handleDialog, dialogContent } = React.useContext(
    DialogContext
  );

  /**
     Call back function after onConfirm or onCancle
  **/
  const handleFn = (fn?: () => void) => {
    if (fn) fn();
    handleDialog();
  };

  return ReactDOM.createPortal(
    <Transition show={dialogIsActive} as={Fragment}>
      <Dialog
        as="div"
        id="modal"
        className="fixed inset-0 z-10 overflow-y-auto"
        static
        open={dialogIsActive}
        onClose={() => handleDialog()}
      >
        <div className="min-h-screen px-4 text-center">
          <Transition.Child
            as={Fragment}
            enter="ease-out duration-300"
            enterFrom="opacity-0"
            enterTo="opacity-50"
            leave="ease-in duration-200"
            leaveFrom="opacity-50"
            leaveTo="opacity-0"
          >
            <Dialog.Overlay className="fixed inset-0 bg-gray-200 opacity-60" />
          </Transition.Child>

          {/* This element is to trick the browser into centering the modal contents. */}
          <span
            className="inline-block h-screen align-middle"
            aria-hidden="true"
          >
            &#8203;
          </span>
          <Transition.Child
            as={Fragment}
            enter="ease-out duration-300"
            enterFrom="opacity-0 scale-95"
            enterTo="opacity-100 scale-100"
            leave="ease-in duration-200"
            leaveFrom="opacity-100 scale-100"
            leaveTo="opacity-0 scale-95"
          >
            <div className="inline-block w-full max-w-md p-8 my-8 overflow-hidden text-left align-middle transition-all transform bg-white shadow-xl rounded-2xl">
              <Dialog.Title
                as="h3"
                className="text-lg md:text-3xl font-medium leading-6 text-gray-900"
              >
                {dialogContent.title}
              </Dialog.Title>
              <div className="mt-2">
                <p className="text-sm md:text-lg text-gray-500">
                  {dialogContent.description}
                </p>
              </div>

              <div className="mt-6 flex justify-between">
                {/* Confirm button */}
                <button
                  type="button"
                  className="dialog-confirm-btn"
                  onClick={() => {
                    if (dialogContent.onConfirm)
                      handleFn(dialogContent.onConfirm);
                  }}
                >
                  Confirm
                </button>
                {/* Cancel button */}
                <button
                  type="button"
                  className="dialog-cancel-btn"
                  onClick={() => {
                    if (dialogContent.onCancel)
                      handleFn(dialogContent.onCancel);
                  }}
                >
                  Cancel
                </button>
              </div>
            </div>
          </Transition.Child>
        </div>
      </Dialog>
    </Transition>,
    dialogRoot
  );
}
