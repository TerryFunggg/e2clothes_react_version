import React from 'react';
import useDialog from './useDialog'
import MyDialog from './MyDialog';

import {DialogContent,DialogInitial} from '../../shared/types.interface'

type Props = {
    children: React.ReactNode
}


const initialState: DialogInitial = {
    dialogIsActive: false,
    handleDialog:() =>{},
    dialogContent: {
        title: 'Sure?',
        description: "Are you sure?" ,
    },
  };

const DialogContext = React.createContext(initialState);

const DialogProvider = ({children}: Props) => {
    const {dialogIsActive,handleDialog,dialogContent} = useDialog()
    return (
        <DialogContext.Provider value={{dialogIsActive,handleDialog,dialogContent}}>
            <MyDialog/>
            {children}
        </DialogContext.Provider>
    )
}

export {DialogProvider, DialogContext}