from setuptools import setup

setup(
    name="JetsonPatches",
    version="1.0.0",
    description="This is a patch for using cv2.imshow with Jupyter and using Raspberry Pi Camera with OpenCV.",
    author="sashimi",
    install_requires=["pillow"],
    extras_require={"Jupyter":["jupyterlab"]},
    url="https://github.com/sashimi-git/JetsonEnvironment/tree/main/JupyterLib/JetsonPatches",
    license="MIT"
)