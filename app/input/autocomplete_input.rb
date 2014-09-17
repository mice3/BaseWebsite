class AutocompleteInput < SimpleForm::Inputs::StringInput
  # This method only create a basic input without reading any value from object
  def input
    table = object_name
    relation_table = attribute_name.to_s
    path = template.autocomplete_path
    relation_object_name = nil

    if table.to_s.include?("scrum_tasks_attributes")
      table = "scrum_task"
    end

    relation_object_type = table.camelize.constantize.reflect_on_association(relation_table.to_sym).class_name

    if object.send(relation_table) != nil
      rel = object.send(relation_table)
      relation_object_name = rel.autocomplete_label
    end

    textfield_id = "autocomplete_"+table+"_#{attribute_name}_id"
    autocomplete_element_name = "#{table}_#{attribute_name.to_s}_id"
    if "scrum_task" == table
      textfield_id = "autocomplete_scrum_"+table+"_0_#{attribute_name}_id"
      autocomplete_element_name = "scrum_scrum_tasks_attributes_0_#{attribute_name.to_s}_id"
    end
    out = ""
    if "scrum_task" == table
      out << template.text_field_tag("scrum[scrum_tasks_attributes][0][#{attribute_name}_id]", relation_object_name, :id => textfield_id)
    end
    out << @builder.hidden_field("#{attribute_name}_id")
    out << ""

    out << '<script>
                $( "#'+ textfield_id +'" ).click(function() {
                    setTimeout(function() { $( "#'+ textfield_id +'" ).select()  }, 100);
                  });
                $( "#'+ textfield_id +'" ).autocomplete({
                  source: "'+ path + '?type='+ relation_object_type +'",
                  minLength: 2,
                  autoFocus: true,
                  change: function(event,ui){

                  },
                  select: function( event, ui ) {
                    $(this).val((ui.item ? ui.item.value : ""));
                    console.log("asdasd");
                    $("#'+ autocomplete_element_name +'").val((ui.item ? ui.item.id : ""));
                    $(this).blur();
                  }
                  ,
                    response: function(event, ui) {
                        if (!ui.content.length) {
                            var noResult = { value:"",label:"No results found" };
                            ui.content.push(noResult);
                        }
                    }
                });
              </script>'


    template.raw(out)
  end
end
#$("#'+ table + '_' + attribute_name.to_s + '_id").val((ui.item ? ui.item.id : ""));
