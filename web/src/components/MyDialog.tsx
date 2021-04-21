import { Dialog, Transition } from "@headlessui/react";
import { Fragment} from "react";
import { useAppDispatch, useAppSelector } from '../hooks'
import { hideModal, selectModal,selectModalContent } from '../reducers/modalAction'



type DialogProps = {
  okButtonMessage?: string;
  noButtonMessage?: string;
  okButtonClick?: () => void;
  cancelButtonClick?: () => void;
};

export default function MyDialog({ ...props }: DialogProps) {
  const open = useAppSelector(selectModal)
  const content = useAppSelector(selectModalContent)
  const dispatch = useAppDispatch();

  return (
    <Transition show={open} as={Fragment}>
      <Dialog
        as="div"
        id="modal"
        className="fixed inset-0 z-10 overflow-y-auto"
        static
        open={open}
        onClose={() => dispatch(hideModal())}
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
                {content?.title}
              </Dialog.Title>
              <div className="mt-2">
                <p className="text-sm md:text-lg text-gray-500">{content?.description}</p>
              </div>

              <div className="mt-6 flex justify-between">
                {/* Confirm button */}
                <button
                  type="button"
                  className="dialog-confirm-btn"                  
                  onClick={() => props.cancelButtonClick ? props.cancelButtonClick() : dispatch(hideModal())}
                >
                  {props.okButtonMessage || "Confirm"}
                </button>
                {/* Cancel button */}
                <button
                  type="button"
                  className="dialog-cancel-btn"
                  onClick={() => props.cancelButtonClick ? props.cancelButtonClick() : dispatch(hideModal())}
                >
                  {props.noButtonMessage || "Cancel"}
                </button>
              </div>
            </div>
          </Transition.Child>
        </div>
      </Dialog>
    </Transition>
  );
}
