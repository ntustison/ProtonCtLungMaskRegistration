
To register the proton mask (`H1Mask.nii.gz`) to the CT mask (`CTtMask.nii.gz`) run the following command after installing [ANTs](https://github.com/stnava/ANTs):
```
antsRegistrationSyN.sh -d 3 -o H1xCT -f H1Mask.nii.gz -m CtMask.nii.gz -t b
```
Compare the result (`H1xCTWarped.nii.gz`) with the correct result (`H1xCTWarpedNickResults.nii.gz`) to ensure they're the same.

Here's a screenshot of the CT warped mask in the space of the H1 mask.
![Result](https://github.com/ntustison/ProtonCtLungMaskRegistration/blob/master/Figures/resultsSnap.png?raw=true "")
