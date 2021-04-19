// in src/MyUrlField.js
import * as React from "react";
import { makeStyles } from '@material-ui/core/styles';
import Avatar from '@material-ui/core/Avatar';


const AvatarField = ({ record = {}, source }) => {
  return (
    <Avatar alt={record['user_name']} src={record[source]} />
  );
}

export default AvatarField;
