{
  "$GMObject":"",
  "%Name":"o_kamera",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":64,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":4,"eventType":7,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":false,
  "name":"o_kamera",
  "overriddenProperties":[],
  "parent":{
    "name":"Objects",
    "path":"folders/Objects.yy",
  },
  "parentObjectId":null,
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"k_debug_def","filters":[],"listItems":[],"multiselect":false,"name":"k_debug_def","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"False","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"k_fullscreen_def","filters":[],"listItems":[],"multiselect":false,"name":"k_fullscreen_def","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"False","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"k_freeroam_def","filters":[],"listItems":[],"multiselect":false,"name":"k_freeroam_def","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"False","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"k_target_def","filters":[
        "GMObject",
      ],"listItems":[],"multiselect":false,"name":"k_target_def","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"noone","varType":5,},
    {"$GMObjectProperty":"v1","%Name":"k_mode_def","filters":[],"listItems":[
        "\"wait_mode\"",
        "\"follow_target\"",
        "\"follow_mouse\"",
        "\"peak_follow_target\"",
        "\"pan_follow_target\"",
        "\"drag_follow_mouse\"",
        "\"border_follow_mouse\"",
        "\"move_to_click\"",
        "\"move_to_target\"",
        "\"celeste_mode\"",
      ],"multiselect":false,"name":"k_mode_def","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"\"wait_mode\"","varType":6,},
    {"$GMObjectProperty":"v1","%Name":"k_resolution_def","filters":[],"listItems":[
        "\"320x180\"",
        "\"480x270\"",
        "\"960x540\"",
        "\"1280x720\"",
        "\"1920x1080\"",
        "\"2560x1440\"",
        "\"2560x1600\"",
        "\"3200x1800\"",
      ],"multiselect":false,"name":"k_resolution_def","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"\"960x540\"","varType":6,},
    {"$GMObjectProperty":"v1","%Name":"k_display_def","filters":[],"listItems":[
        "\"320x180\"",
        "\"480x270\"",
        "\"960x540\"",
        "\"1280x720\"",
        "\"1920x1080\"",
        "\"2560x1440\"",
        "\"2560x1600\"",
        "\"3200x1800\"",
      ],"multiselect":false,"name":"k_display_def","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"\"960x540\"","varType":6,},
    {"$GMObjectProperty":"v1","%Name":"k_view_def","filters":[],"listItems":[
        "\"320x180\"",
        "\"480x270\"",
        "\"960x540\"",
        "\"1280x720\"",
        "\"1920x1080\"",
        "\"2560x1440\"",
        "\"2560x1600\"",
        "\"3200x1800\"",
      ],"multiselect":false,"name":"k_view_def","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"\"480x270\"","varType":6,},
    {"$GMObjectProperty":"v1","%Name":"k_gui_def","filters":[],"listItems":[
        "\"320x180\"",
        "\"480x270\"",
        "\"960x540\"",
        "\"1280x720\"",
        "\"1920x1080\"",
        "\"2560x1440\"",
        "\"2560x1600\"",
        "\"3200x1800\"",
      ],"multiselect":false,"name":"k_gui_def","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"\"960x540\"","varType":6,},
    {"$GMObjectProperty":"v1","%Name":"k_spd_def","filters":[],"listItems":[],"multiselect":false,"name":"k_spd_def","rangeEnabled":true,"rangeMax":1.0,"rangeMin":0.1,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0.3","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"k_angle_def","filters":[],"listItems":[],"multiselect":false,"name":"k_angle_def","rangeEnabled":true,"rangeMax":360.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"k_zoom_def","filters":[],"listItems":[],"multiselect":false,"name":"k_zoom_def","rangeEnabled":true,"rangeMax":2.0,"rangeMin":0.1,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"1","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"k_offset_x_def","filters":[],"listItems":[],"multiselect":false,"name":"k_offset_x_def","rangeEnabled":true,"rangeMax":128.0,"rangeMin":-128.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"k_offset_y_def","filters":[],"listItems":[],"multiselect":false,"name":"k_offset_y_def","rangeEnabled":true,"rangeMax":128.0,"rangeMin":-128.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":null,
  "spriteMaskId":null,
  "visible":false,
}