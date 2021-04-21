export type Modal = {
  title?: string,
  description?: string,
  okButtonMessage?: string;
  noButtonMessage?: string;
  okButtonClick?: () => void;
  cancelButtonClick?: () => void;
}

export interface DialogContent {
  title:string,
  description: string,
  onConfirm?: () => void,
  onCancel?: () => void
}

export interface DialogInitial {
  dialogIsActive: boolean,
  handleDialog: (constent?: DialogContent | undefined) => void,
  dialogContent: DialogContent
}

export interface LogInValues {
  email: string,
  password: string,
}

export interface SignUpValues extends LogInValues {
  user_name: string,
  first_name: string,
  last_name: string,
  phone: string,
  confirmPassword?: string
}


export interface ProfileValues extends LogInValues, SignUpValues { }
