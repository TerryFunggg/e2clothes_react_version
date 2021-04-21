import { createSlice, PayloadAction} from '@reduxjs/toolkit'
import { Modal } from '../shared/types.interface'
import type { RootState } from '../store'


interface ModalActionState {
  modal: boolean,
  content?: Modal
}

const initialState: ModalActionState = {
  modal: false,
  content:{
    title: 'Sure?',
    description:"Are your sure?"
  }
}

export const modalSlice = createSlice({
  name: 'modal',
  initialState,
  reducers: {
    showModal: (state, action: PayloadAction<Modal>) => {
      state.modal = true
      state.content = action.payload
    },
    hideModal: (state) => {
      state.modal = false
    },
  }
})


export const { showModal, hideModal } = modalSlice.actions

export const selectModal = (state: RootState) => state.modalAction.modal;
export const selectModalContent = (state: RootState) => state.modalAction.content;

export default modalSlice.reducer
