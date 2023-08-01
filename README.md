# Automated-neural-behavioral-alignment
Code for automated TS triggers from a MonkeyLogic task along with code for identifying artifacts in an implantable DBS system. For details see "Automated artifact injection into sensing-capable brain modulation devices for neural-behavioral synchronization and the influence of device state"

Each folder has its own README for the functions/scripts/files involved. This gives a very general overview of what is contained in each folder.

### Event-Triggered Stim
Code for sending stimulation pulses from a MonkeyLogic (Asaad & Eskandar 2008; https://monkeylogic.nimh.nih.gov/) task to the NeuroOmega (Alpha Omega, Nazareth, Israel).

### Artifact Identification
Code for identifying TS artifact times from LFPs onboard a fully implantable DBS device. These times are compared to (1) trial start times logged by the task computer,
(2) trial start times logged by the NeuroOmega system, and (3) TS transmission times logged by the NeuroOmega system.
