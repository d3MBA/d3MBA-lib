Framework = Framework or {}


-- Function to open different types of input menus based on the provided inputType
--- @param inputType <string> - representing the type of input menu to open
--- @param header <string> - representing the header/title of the input menu
--- @param inputs <table> - containing the input fields configuration
function Framework.OpenInputMenu(inputType, header, inputs)
    if inputType == "ox_lib" then
        local oxInputs = {}
        for _, v in ipairs(inputs) do
            if v.type == "number" or v.type == "input" then
                table.insert(oxInputs, {
                    type = v.type,
                    label = v.label,
                    default = v.default or nil,
                })
            elseif v.type == "checkbox" then
                table.insert(oxInputs, {
                    type = 'checkbox',
                    label = v.label,
                    default = v.default or false,
                })
            elseif v.type == "select" then
                local options = {}
                for _, option in ipairs(v.options) do
                    table.insert(options, {value = option.value, label = option.label})
                end
                table.insert(oxInputs, {
                    type = 'select',
                    label = v.label,
                    options = options,
                })
            elseif v.type == "slider" then
                table.insert(oxInputs, {
                    type = 'slider',
                    label = v.label,
                    min = v.min or 1,
                    max = v.max or 100,
                    default = v.default or 1,
                })
            end
        end
        return lib.inputDialog(header, oxInputs)

    elseif inputType == "qb-input" then  
        local qbInputs = {}
        for _, v in ipairs(inputs) do
            table.insert(qbInputs, {
                text = v.text,
                name = v.name,
                type = v.type,
                isRequired = v.isRequired or false,
                options = v.options or nil,
            })
        end
        return exports['qb-input']:ShowInput({
            header = header,
            submitText = "Submit",
            inputs = qbInputs,
        })

    elseif inputType == "nh-input" then
        return exports['nh-keyboard']:Keyboard({
            header = header,
            rows = inputs,
        })
    else
        print("^3Invalid input menu type: ^0" .. inputType .. "^3! Choose your ^5input menu^3 in the config!") 
    end
end
