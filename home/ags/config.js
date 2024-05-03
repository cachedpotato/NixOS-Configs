const battery = await Service.import('battery');
const hyprland = await Service.import('hyprland');
const network = await Service.import('network')
const audio = await Service.import('audio');
import brightness from './brightness.js';


//widgets can only be assigned as a child in one continer
//to make a reusable widget, make it a function
//so that you can just create an instance by calling it
//

function ringBattery() {

  return Widget.CircularProgress({
    class_name: battery.bind("charging").as(
      ch => `${ch ? "battery-charging" : "battery"}`
    ),
    rounded: true,
    value: battery.bind("percent").as(
      p =>  p > 0 ? p/100 : 0
    ),
  });
} 


function hyprWorkspaces() {
  const activeId = hyprland.active.workspace.bind("id");
  const workspaces = hyprland.bind("workspaces")
    .as(ws => ws.map(({id}) => Widget.Button({
      on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
      child: Widget.Label(`${id}`),
      //class_name is used for css
      class_name: activeId.as(i => `${i === id ? "focused" : ""}`),
    })));

  return Widget.Box({
    vertical: false,
    class_name: "hyprWorkspace",
    children: workspaces,
  })
};

function clock() {
  const time = Variable('', {
    poll: [1000, 'zsh -c "date +%T"'],
  });

  return Widget.Label({
    label: time.bind(),
    class_name: "clock",
  })
}


function networkStatus() {

  const ethernetIndicator = () => Widget.Icon({
    icon : network.wired.bind("icon_name"),
  });

  const wifiIndicator = () => Widget.Icon({
    icon : network.wifi.bind("iconName"),
  });


  return Widget.Stack({
    class_name: "internetConnection",

    children: {
      "wifi": wifiIndicator(),
      "wired": ethernetIndicator(),
    },

    shown: network.bind("primary").as(
      p => p || "wifi"
    ),

  });

};


function volume() {

  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted"
  };

  function getIcon()  {
    const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
      threshold => threshold <= audio.speaker.volume*100
    );

    return `audio-volume-${icons[icon]}-symbolic`; 
  }

  const icon = Widget.Icon({
    icon: Utils.watch(getIcon(), audio.speaker, getIcon)
  });

  const slider = Widget.Slider({
    hexpand: true,
    vertical: false,
    onChange: ({value}) => audio.speaker.volume = value,
    setup: self => self.hook(audio.speaker, () => {
      self.value = audio.speaker.volume || 0
    })

  })

  return Widget.Box({
    children: [
      icon,
      slider,
    ],
    class_name: "volume",
    css: "min-width: 90px",
  })
  
}

function myBrightness() {
  const slider = Widget.Slider({
    hexpand: true,
    on_change: self => brightness.screen_value = self.value, 
    value: brightness.bind("screen_value"),
  });

  const icon = Widget.Icon({
    icon: "display-brightness-symbolic",
  });

  return Widget.Box({
    children: [
      icon,
      slider,
    ],
    css: "min-width: 90px",
    class_name: "brightnessBox",
  });
}

function startWidgets() {
  return Widget.Box({
    children: [
      hyprWorkspaces(),
    ],
    spacing: 8,
    class_name: "leftBox",
  });
}

function centerWidgets() {
  return Widget.Box({
    children: [
      clock(),
    ],
    spacing: 8,
    class_name: "centerBox",
  });
}

function endWidgets() {
  return Widget.Box({
    children: [
      networkStatus(),
      myBrightness(),
      volume(),
      ringBattery(),
    ],
    spacing: 8,
    class_name: "rightBox",
  }); 
}


function myBar(monitor=0) {
  return Widget.Window({
    name: `monitor${monitor}`,
    anchor: ["top", "left", "right"],
    exclusivity: "normal",
    child: Widget.CenterBox({
      spacing: 8,
      startWidget: startWidgets(),
      centerWidget: centerWidgets(),
      endWidget: endWidgets(),
      vertical: false,
    }),
  })
}

///////////Layout
//Hyprland Workspaces | Time | Audio Network Backlight(toggle slider) battery notifications

App.config({
  windows: [myBar(0)],
})




