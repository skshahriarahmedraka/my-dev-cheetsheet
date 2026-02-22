Yes ✅ — in **Ubuntu** you can connect **2 Bluetooth headphones to 1 PC** and make both receive the **same audio output**.
But microphone (input) sharing is more limited — I’ll explain both clearly.

---

# 🎧 1️⃣ Same Audio Output to 2 Bluetooth Headphones

By default, Ubuntu sends sound to **one device at a time**.
To send audio to **both headphones simultaneously**, you need to create a **virtual combined output (sink)**.

Ubuntu (especially newer versions) uses **PipeWire** (or PulseAudio in older versions).

---

## ✅ Method (PipeWire – Ubuntu 22.04+ / 23+)

### Step 1: Install tools

```bash
sudo apt install pavucontrol
```

### Step 2: Connect both Bluetooth headphones

Use:

```bash
bluetoothctl
```

or GUI → Settings → Bluetooth

Make sure both are connected.

---

### Step 3: Create Combined Sink

Install:

```bash
sudo apt install pipewire-audio-client-libraries
```

Then create a combined sink:

```bash
pactl load-module module-combine-sink sink_name=dual_output
```

Now open:

```bash
pavucontrol
```

Go to:

* Output Devices → Select **dual_output**
* Playback tab → set apps to use **dual_output**

Now both headphones will play the same sound 🎶

---

# 🎤 2️⃣ Same Input (Microphone) From 2 Headphones?

⚠️ This is different.

Bluetooth headsets switch to **HSP/HFP mode** when mic is used.
This reduces audio quality and:

* You **cannot normally use 2 Bluetooth mics at the same time**
* Ubuntu allows **only one active input source**

You *can* manually switch input in:

```
pavucontrol → Input Devices
```

But **combining two Bluetooth microphones is not stable and not recommended.**

---

# ⚠️ Important Bluetooth Limitations

Bluetooth audio has bandwidth limits:

* Using 2 A2DP devices may cause:

  * Audio delay
  * Sync issues
  * Dropouts
* Cheap adapters struggle
* Internal laptop Bluetooth is often weak

For better stability:

* Use a **USB Bluetooth 5.0 dongle**
* Or use **one wired + one Bluetooth**

---

# 🔥 Best Professional Solution (Stable)

If you want perfect sync (for movies / music sharing):

Use:

* USB audio splitter
* Or 3.5mm headphone splitter
* Or dedicated Bluetooth transmitter that supports dual audio (like aptX Dual Link)

That is MUCH more stable than software combine.

---

# 💡 Quick Summary

| Feature                            | Possible?       | Stable?    |
| ---------------------------------- | --------------- | ---------- |
| 2 headphones same output           | ✅ Yes           | ⚠️ Medium  |
| 2 Bluetooth microphones same input | ❌ Not practical | ❌ No       |
| 1 mic + 2 outputs                  | ✅ Yes           | ⚠️ Depends |

---

If you tell me:

* Your Ubuntu version
* Are you using PipeWire or PulseAudio?
* Laptop or Desktop?

I can give you exact step-by-step commands tailored for your setup.
