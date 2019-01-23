var plasma = getApiVersion(1);

var layout = {
  "desktops": [
    {
      "applets": [
      ],
      "config": {
        "/": {
          "formfactor": "0",
          "immutability": "1",
          "lastScreen": "0",
          "wallpaperplugin": "org.kde.slideshow"
        },
        "/ConfigDialog": {
          "DialogHeight": "540",
          "DialogWidth": "720"
        },
        "/Configuration": {
          "PreloadWeight": "0"
        },
        "/General": {
          "pressToMoveHelp": "false"
        },
        "/Wallpaper/org.kde.slideshow/General": {
          "SlidePaths": "/usr/share/wallpapers/SirGallifrey/contents/images"
        }
      },
      "wallpaperPlugin": "org.kde.slideshow"
    },
    {
      "applets": [
      ],
      "config": {
        "/": {
          "formfactor": "0",
          "immutability": "1",
          "lastScreen": "1",
          "wallpaperplugin": "org.kde.slideshow"
        },
        "/ConfigDialog": {
          "DialogHeight": "540",
          "DialogWidth": "720"
        },
        "/Configuration": {
          "PreloadWeight": "0"
        },
        "/General": {
          "pressToMoveHelp": "false"
        },
        "/Wallpaper/org.kde.slideshow/General": {
          "SlidePaths": "/usr/share/wallpapers/SirGallifrey/contents/images"
        }
      },
      "wallpaperPlugin": "org.kde.slideshow"
    },
    {
      "applets": [
      ],
      "config": {
        "/": {
          "formfactor": "0",
          "immutability": "1",
          "lastScreen": "2",
          "wallpaperplugin": "org.kde.slideshow"
        },
        "/ConfigDialog": {
          "DialogHeight": "540",
          "DialogWidth": "720"
        },
        "/Configuration": {
          "PreloadWeight": "0"
        },
        "/General": {
          "pressToMoveHelp": "false"
        },
        "/Wallpaper/org.kde.slideshow/General": {
          "SlidePaths": "/usr/share/wallpapers/SirGallifrey/contents/images"
        }
      },
      "wallpaperPlugin": "org.kde.slideshow"
    },
    {
      "applets": [
      ],
      "config": {
        "/": {
          "formfactor": "0",
          "immutability": "1",
          "lastScreen": "3",
          "wallpaperplugin": "org.kde.slideshow"
        },
        "/ConfigDialog": {
          "DialogHeight": "540",
          "DialogWidth": "720"
        },
        "/Configuration": {
          "PreloadWeight": "0"
        },
        "/General": {
          "pressToMoveHelp": "false"
        },
        "/Wallpaper/org.kde.slideshow/General": {
          "SlidePaths": "/usr/share/wallpapers/SirGallifrey/contents/images"
        }
      },
      "wallpaperPlugin": "org.kde.slideshow"
    },
  ],
  "panels": [
    {
      "alignment": "left",
      "applets": [
        {
          "config": {
            "/": {
              "immutability": "1"
            },
            "/Configuration": {
              "PreloadWeight": "100"
            },
            "/Configuration/General": {
              "favoritesPortedToKAstats": "true"
            },
            "/Configuration/Shortcuts": {
              "global": "Alt+F1"
            },
            "/Shortcuts": {
              "global": "Alt+F1"
            }
          },
          "plugin": "org.kde.plasma.kickoff"
        },
        {
          "config": {
            "/": {
              "immutability": "1"
            },
            "/Configuration": {
              "PreloadWeight": "0"
            },
            "/Configuration/ConfigDialog": {
              "DialogHeight": "540",
              "DialogWidth": "720"
            },
            "/Configuration/General": {
              "launchers": "applications:systemsettings.desktop,applications:org.kde.dolphin.desktop,applications:termite.desktop,applications:brave-bin.desktop,applications:visual-studio-code.desktop,applications:org.kde.okular.desktop,applications:postman.desktop,applications:org.kde.spectacle.desktop,applications:spotify.desktop,applications:telegramdesktop.desktop"
            }
          },
          "plugin": "org.kde.plasma.icontasks"
        },
        {
          "config": {
            "/": {
              "immutability": "1"
            },
            "/Configuration": {
              "PreloadWeight": "0"
            },
            "/Configuration/General": {
              "history": "#3c3c3c,#333333,#1e1e1e"
            }
          },
          "plugin": "org.kde.plasma.colorpicker"
        },
        {
          "config": {
            "/": {
              "immutability": "1"
            },
            "/Configuration": {
              "PreloadWeight": "0"
            }
          },
          "plugin": "org.kde.plasma.pager"
        },
        {
          "config": {
            "/": {
              "immutability": "1"
            },
            "/Configuration": {
              "PreloadWeight": "40"
            }
          },
          "plugin": "org.kde.plasma.systemtray"
        },
        {
          "config": {
            "/": {
              "immutability": "1"
            },
            "/Configuration": {
              "PreloadWeight": "0"
            },
            "/Configuration/Appearance": {
              "showDate": "true"
            },
            "/Configuration/ConfigDialog": {
              "DialogHeight": "540",
              "DialogWidth": "720"
            }
          },
          "plugin": "org.kde.plasma.digitalclock"
        }
      ],
      "config": {
        "/": {
          "formfactor": "2",
          "immutability": "1",
          "lastScreen": "0",
          "wallpaperplugin": "org.kde.image"
        },
        "/ConfigDialog": {
          "DialogHeight": "84",
          "DialogWidth": "1920"
        },
        "/Configuration": {
          "PreloadWeight": "0"
        }
      },
      "height": 0.7857142857142857,
      "hiding": "normal",
      "location": "top",
      "maximumLength": 68.57142857142857,
      "minimumLength": 68.57142857142857,
      "offset": 0
    }
  ],
  "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
