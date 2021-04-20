import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import type { RootState } from '../store'

interface isLoggedState {
  logged: boolean,
}

const initialState: isLoggedState = {
  logged: false,
}

export const isLoggedSlice = createSlice({
  name: 'isLogged',
  initialState,
  reducers: {
    setIsLogged: (state, action: PayloadAction<boolean>) => {
      state.logged = action.payload
    },
  }
})


export const { setIsLogged } = isLoggedSlice.actions

export const selectIsLogged = (state: RootState) => state.isLogged.logged

export default isLoggedSlice.reducer
