import os
print os.environ['HOME']

worlds["josh"] = "/minecraft/worlds/josh"

renders["joshday"] = {
    "world": "josh",
    "title": "Josh Daytime",
    "rendermode": smooth_lighting,
    "dimension": "overworld",
}

renders["joshnight"] = {
    "world": "josh",
    "title": "Josh Nighttime",
    "rendermode": smooth_night,
    "dimension": "overworld",
}

renders["joshnether"] = {
    "world": "josh",
    "title": "Josh Nether",
    "rendermode": nether_smooth_lighting,
    "dimension": "nether",
}

renders["joshnethersouth"] = {
    "world": "josh",
    "title": "Josh Nether",
    "rendermode": nether_smooth_lighting,
    "dimension": "nether",
    "northdirection" : "lower-right",
}

outputdir = "/overviewer/worlds/josh"
texturepath = "/overviewer/textures/" + os.environ.get('TEXTURES_VERSION') + ".jar"