import React, { useState } from 'react';
import {DialogContent} from '../../shared/types.interface'
/* 
    Create a custom hook for Dialog
*/
const useDialog = () => {
    let [dialogIsActive, setDialogIsActive] = useState(false);
    let [dialogContent, setDialogContent] = useState<DialogContent>({
        title:'',
        description: ''
    });

    let handleDialog = (content? : DialogContent) => {
        setDialogIsActive(!dialogIsActive);
        if(content) setDialogContent(content)
    }

    return {dialogIsActive, handleDialog, dialogContent}
};

export default useDialog;
