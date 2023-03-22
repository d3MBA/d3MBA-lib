Input Menus Documentation

This documentation explains how to use the Framework.OpenInputMenu function to create different types of input menus in FiveM. The function supports three input menu types: "ox_lib", "qb-input", and "nh-input".

Function Usage
The Framework.OpenInputMenu function has the following signature:

```lua 
    Framework.OpenInputMenu(inputType, header, inputs)
```

Parameters

* `inputType` (string): The type of input menu to open. Supported types are "ox_lib", "qb-input", and "nh-input".
* `header` (string): The header or title of the input menu.
* `Input` inputs (table): A table containing the input fields configuration.


Types Configuration
Each input menu type has its own configuration for the inputs parameter.

1. ox_lib
For "ox_lib", the inputs table should contain entries with the following fields:

* `type` (string): The input type. Supported types are "number", "text", and "select".
* `text` (string): The label for the input field.
* `default` (optional, any): The default value for the input field. This is only applicable for "number" and "text" input types.
* `options` (table): A table containing options for the "select" input type. Each option should have a `value` and a `text` field.

Example:

```lua

    local dialog = Framework.OpenInputMenu("ox_lib", "Ox Input Menu Example", {
        {
            type = "input",
            text = "Enter your name",
        },
        {
            type = "number",
            text = "Enter your age",
        },
        {
            type = "select",
            text = "Select your gender",
            options = {
                {value = "male", text = "Male"},
                {value = "female", text = "Female"},
            },
        },
    })

    print(dialog[1])
    print(dialog[2])
    print(dialog[3])

```

2. qb-input
For "qb-input", the `inputs` table should contain entries with the following fields:

* `text` (string): The label for the input field.
* `name` (string): A unique identifier for the input field.
* `type` (string): The input type. Supported types are "text", "number", and "select".
* `isRequired` (optional, boolean): Whether the input field is required. Defaults to false.
* `options` (optional, table): A table containing options for the "select" input type. Each option should have a `value` and a `text` field.

Example:

```lua 

    local dialog = Framework.OpenInputMenu("qb-input", "QB Input Menu Example", {
        {
            text = "Enter your name",
            name = "name",
            type = "text",
            isRequired = true,
        },
        {
            text = "Enter your age",
            name = "age",
            type = "number",
            isRequired = true,
        },
    })

    print(dialog.name)
    print(dialog.age)


```

3. nh-input
For "nh-input", the inputs table should contain entries with the following fields:

* `name` (string): A unique identifier for the input field.
* `type` (string): The input type. Supported types are "text" and "number".
* `label` (string): The label for the input field.

Example:

```lua 

    local dialog = Framework.OpenInputMenu("nh-input", "NH Input Menu Example", {
        {
            name = "name",
            type = "text",
            label = "Enter your name",
        },
        {
            name = "age",
            type = "number",
            label = "Enter your age
        },
    })

    print(dialog.name)
    print(dialog.age)


```