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
  NumberInput,
  BooleanInput,
  NumberField,
  BooleanField
} from 'react-admin'

const ProductsFilter = (props) => (
  <Filter {...props}>
    <TextInput label="Search" source="q" alwaysOn />
  </Filter>
);

export const ProductsList = props => (
  <List filters={<ProductsFilter />} {...props}>
    <Datagrid >
      <EditButton />
      <TextField source="id" />
      <TextField source="shop_id" />
      <TextField source="name" />
      <TextField source="price" />
      <TextField source="decription" />
      <NumberField source="quality" />
      <BooleanField source="is_active" />
    </Datagrid>
  </List>
);


export const ProductsEdit = props => (
  <Edit {...props}>
    <SimpleForm>
      <TextInput source="id" />
      <TextInput source="shop_id" />
      <TextInput source="name" />
      <TextInput source="price" />
      <TextInput source="decription" />
      <NumberInput source="quality" />
      <BooleanInput source="is_active" />
    </SimpleForm>
  </Edit>
)

export const ProductsCreate = props => (
  <Create {...props}>
    <SimpleForm>
      <TextInput source="id" />
      <TextInput source="shop_id" />
      <TextInput source="name" />
      <TextInput source="price" />
      <TextInput source="decription" />
      <NumberInput source="quality" />
      <BooleanInput source="is_active" />
    </SimpleForm>
  </Create>
)
