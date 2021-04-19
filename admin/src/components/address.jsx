import React from "react";
import {
  List,
  Edit,
  Create,
  Datagrid,
  TextField,
  EditButton,
  TextInput,
  SimpleForm,
  Filter,
  ReferenceInput,
  SelectInput
} from 'react-admin'

const AddressFilter = (props) => (
  <Filter {...props}>
    <TextInput label="Search" source="q" alwaysOn />
  </Filter>
);

export const AddressList = props => (
  <List filters={<AddressFilter />} {...props}>
    <Datagrid >
      <EditButton />
      <TextField source="id" />
      <TextField source="city" />
      <TextField source="street_address" />
      <TextField source="building_address" />
      <TextField source="zip_code" />
    </Datagrid>
  </List>
);


export const AddressEdit = props => (
  <Edit {...props}>
    <SimpleForm>
      <TextInput source="id" />
      <TextInput source="city" />
      <TextInput multiline source="street_address" />
      <TextInput multiline source="building_address" />
      <TextInput multiline source="zip_code" />
    </SimpleForm>
  </Edit>
)

export const AddressCreate = props => (
  <Create {...props}>
    <SimpleForm>
      <TextInput source="id" />
      <TextInput source="city" />
      <TextInput multiline source="street_address" />
      <TextInput multiline source="building_address" />
      <TextInput multiline source="zip_code" />
    </SimpleForm>
  </Create>
)
