const configDir = '/home/lowlife/.flake_configs/home/ags';
const battery = await Service.import('battery');
const hyprland = await Service.import('hyprland');
const network = await Service.import('network')
const audio = await Service.import('audio');
import brightness from './brightness.js';
//why isn't App.configDir working?


function nixLogo() {
  return Widget.Icon({
    css: 'margin-left: 8px;'
      + 'background-color: transparent;',
    class_name: "nixLogo",
    icon: `${configDir}/assets/NixOSLogo.png`,
    size: 30,
  })
};

function ringBattery() {
  const className = battery.bind("percent").as(
    p => p > 30 ? "" : 
      battery.bind("charging") === true ? "" :
        p > 15 ? "battery-warning-notCharging" : "battery-critical-notCharging"
  ); 

  return Widget.CircularProgress({
    css: 'font-size: 6px;' //thiccness
      + 'min-width: 30px;'
      + 'min-height: 30px;',//size = min(min-width, min-height)
    class_name: className,
    rounded: true,
    value: battery.bind("percent").as(
      p =>  p > 0 ? p/100 : 0
    ),
    child: Widget.Icon({
      icon: battery.bind("icon_name"),
      css: 'font-size: 10px;'
    })
  });
} 

function hyprWorkspaces() {
  const activeId = hyprland.active.workspace.bind("id");
  const workspaces = hyprland.bind("workspaces")
    .as(ws => ws.map(({id}) => Widget.Button({
      //css: "margin: 2px;",
      onClicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
      child: Widget.Label(`${id}`),
      //class_name is used for css
      class_name: activeId.as(i => `${i === id ? "focused" : ""}`),
    })));

  return Widget.Box({
    vertical: false,
    spacing: 1,
    class_name: "workspaces",
    children: workspaces,
  })
};

function clock() {
  const time = Variable('', {
    poll: [1000, ['zsh', '-c', 'date +"%H:%M %D"'], ],
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
    icon: Utils.watch(getIcon(), audio.speaker, getIcon),
    css: 'font-size: 10px;'
      + 'color: #e0e0e0;'
  });

  return Widget.CircularProgress({
    css: 'font-size: 6px;' //thiccness
      + 'min-width: 30px;'
      + 'min-height: 30px;', //size = min(min-width, min-height)
    class_name: "volume",
    rounded: true,
    value: audio.speaker.bind("volume"),
    child: icon,
  });
  
};

function myBrightness() {
  const icon = Widget.Icon({
    icon: "display-brightness-symbolic",
    css: 'font-size: 10px;'
      + 'color: #e0e0e0;'
  });

  return Widget.CircularProgress({
    css: 'font-size: 6px;' //thiccness
      + 'min-width: 30px;'
      + 'min-height: 30px;', //size = min(min-width, min-height)
    class_name: "brightness",
    rounded: true,
    value: brightness.bind("screen_value").as(
      br => br == 0 ? 0 : br
    ),
    child: icon,
  });
}

//cmd: command to execute (string)
//className: class name for css
//label: text for the button
function powerMenuItems(cmd, className = "", label) {
  return Widget.MenuItem({
    className: className,
    child: Widget.Label({
      label: label,
      xalign: 0,
      justification: "left",
    }),
    onActivate: () => {
      Utils.execAsync(`zsh -c "${cmd}"`);
    }
  })
};

function powerMenu() {
   const menu = Widget.Menu({
    children: [
      powerMenuItems("hyprlock", "lock", "Lock Screen"),
      powerMenuItems("poweroff", "shutdown", "Shut Down"),
      powerMenuItems("reboot", "restart", "Restart"),
    ],
  });

  return Widget.MenuBar({
    setup: self => {
      self.append(Widget.MenuItem({
        child: Widget.Icon({
          icon: "system-shutdown-symbolic",
        }),
        submenu: menu,
      }));
    },
  });
};

///////////////////////////////////Bar Setup/////////////////////////////////////
//
function startWidgets() {
  return Widget.Box({
    children: [
      nixLogo(),
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
    hpack: "end",
    children: [
      myBrightness(),
      volume(),
      ringBattery(),
      networkStatus(),
      powerMenu(),
    ],
    spacing: 8,
    class_name: "rightBox",
  }); 
}

function myBar(monitor=0) {
  return Widget.Window({
    name: `monitor${monitor}`,
    anchor: ["top", "left", "right"],
    monitor: monitor,
    exclusivity: "exclusive",
    class_name: "bar",
    child: Widget.CenterBox({
      spacing: 8,
      startWidget: startWidgets(),
      centerWidget: centerWidgets(),
      endWidget: endWidgets(),
      vertical: false,
    }),
  })
}

App.config({
  windows: [myBar(0)],
  style:`${configDir}/style.css`,
})




