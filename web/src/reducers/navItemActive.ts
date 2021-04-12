import { createSlice } from '@reduxjs/toolkit'
import type { RootState } from '../store'

interface NavItemActiveState {
  value: string
}

const initialState: NavItemActiveState = {
  value: 'home'
}

export const navItemActive = createSlice({
  name: 'avtive',
  initialState,
  reducers: {
    activeHome: (state) => {
      state.value = "home"
    },
    activeMarket: (state) => {
      state.value = "market"
    },
  }
})


export const { activeHome, activeMarket } = navItemActive.actions

export const selectNavItemActive = (state: RootState) => state.navItemActive.value

export default navItemActive.reducer
