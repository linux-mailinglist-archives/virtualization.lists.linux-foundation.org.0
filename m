Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561E2F74D5
	for <lists.virtualization@lfdr.de>; Fri, 15 Jan 2021 10:04:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E6385869A7;
	Fri, 15 Jan 2021 09:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kKB0yjVpawE0; Fri, 15 Jan 2021 09:04:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 241C8869B4;
	Fri, 15 Jan 2021 09:04:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03875C0FA8;
	Fri, 15 Jan 2021 09:04:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06477C088B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Jan 2021 09:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DC95D867BD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Jan 2021 09:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHLH7tfslxBV
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Jan 2021 09:03:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 597588665F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Jan 2021 09:03:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0376AA6F;
 Fri, 15 Jan 2021 09:03:51 +0000 (UTC)
To: Eli Cohen <elic@nvidia.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch,
 christian.koenig@amd.com, sam@ravnborg.org
References: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Change eats memory on my server
Message-ID: <23cf7712-1daf-23b8-b596-792c9586d6b4@suse.de>
Date: Fri, 15 Jan 2021 10:03:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8216567510409235839=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8216567510409235839==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="b9oKPa2LaO82NeqHYhn216RqnHul0myBC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b9oKPa2LaO82NeqHYhn216RqnHul0myBC
Content-Type: multipart/mixed; boundary="4lluKEjAFX7Zf09fXV5ictL26QPzfbbGx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Eli Cohen <elic@nvidia.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch,
 christian.koenig@amd.com, sam@ravnborg.org
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <23cf7712-1daf-23b8-b596-792c9586d6b4@suse.de>
Subject: Re: Change eats memory on my server
References: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>
In-Reply-To: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>

--4lluKEjAFX7Zf09fXV5ictL26QPzfbbGx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

(cc'ing dri-devel)

Hi

Am 14.01.21 um 16:15 schrieb Eli Cohen:
> Hi Thomas,
>=20
> After long bisecting I found that this patch,
>=20
> commit 1086db71a1dbbfb32ffb42cf0d540b69956f951e
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Tue Nov 3 10:30:06 2020 +0100
>=20
>      drm/vram-helper: Remove invariant parameters from internal kmap fu=
nction
>=20
> is the offending patch causing the kernel to eat my server memory. It
> will eat all 24 GB of ram after around 7 hours.

Thanks for reporting. It's a bit strange that this commit shows up,=20
because there's nothing that should produce a memory leak.

Could you please double-check that 3fb91f56aea4 ("drm/udl: Retrieve USB=20
device from struct drm_device.dev") works correctly and that=20
823efa922102 ("drm/cma-helper: Remove empty drm_gem_cma_prime_vunmap()") =

is broken?

For one of the broken commits, could you please send us the output of

   dmesg | grep -i drm

after most of the memory got leaked?

Best regards
Thomas

>=20
> It's a a super micro server. The output of dmidecode is below:
>=20
>=20
> # dmidecode 3.2
> Getting SMBIOS data from sysfs.
> SMBIOS 3.1.1 present.
> Table at 0x6F01B000.
>=20
> Handle 0x0000, DMI type 0, 26 bytes
> BIOS Information
> 	Vendor: American Megatrends Inc.
> 	Version: 2.0
> 	Release Date: 11/30/2017
> 	Address: 0xF0000
> 	Runtime Size: 64 kB
> 	ROM Size: 32 MB
> 	Characteristics:
> 		PCI is supported
> 		BIOS is upgradeable
> 		BIOS shadowing is allowed
> 		Boot from CD is supported
> 		Selectable boot is supported
> 		BIOS ROM is socketed
> 		EDD is supported
> 		5.25"/1.2 MB floppy services are supported (int 13h)
> 		3.5"/720 kB floppy services are supported (int 13h)
> 		3.5"/2.88 MB floppy services are supported (int 13h)
> 		Print screen service is supported (int 5h)
> 		Serial services are supported (int 14h)
> 		Printer services are supported (int 17h)
> 		ACPI is supported
> 		USB legacy is supported
> 		BIOS boot specification is supported
> 		Targeted content distribution is supported
> 		UEFI is supported
> 	BIOS Revision: 5.12
>=20
> Handle 0x0001, DMI type 1, 27 bytes
> System Information
> 	Manufacturer: Supermicro
> 	Product Name: Super Server
> 	Version: 0123456789
> 	Serial Number: 0123456789
> 	UUID: 00000000-0000-0000-0000-0cc47af973ca
> 	Wake-up Type: Power Switch
> 	SKU Number: To be filled by O.E.M.
> 	Family: To be filled by O.E.M.
>=20
> Handle 0x0002, DMI type 2, 15 bytes
> Base Board Information
> 	Manufacturer: Supermicro
> 	Product Name: X11DPT-B
> 	Version: 1.02
> 	Serial Number: HM179S003332
> 	Asset Tag: To be filled by O.E.M.
> 	Features:
> 		Board is a hosting board
> 		Board is replaceable
> 	Location In Chassis: To be filled by O.E.M.
> 	Chassis Handle: 0x0003
> 	Type: Motherboard
> 	Contained Object Handles: 0
>=20
> Handle 0x0003, DMI type 3, 22 bytes
> Chassis Information
> 	Manufacturer: Supermicro
> 	Type: Main Server Chassis
> 	Lock: Not Present
> 	Version: 0123456789
> 	Serial Number: 0123456789
> 	Asset Tag: To be filled by O.E.M.
> 	Boot-up State: Safe
> 	Power Supply State: Safe
> 	Thermal State: Safe
> 	Security Status: None
> 	OEM Information: 0x00000000
> 	Height: Unspecified
> 	Number Of Power Cords: 1
> 	Contained Elements: 0
> 	SKU Number: To be filled by O.E.M.
>=20
> Handle 0x0004, DMI type 8, 9 bytes
> Port Connector Information
> 	Internal Reference Designator: JVGA1
> 	Internal Connector Type: None
> 	External Reference Designator: VGA
> 	External Connector Type: DB-15 female
> 	Port Type: Video Port
>=20
> Handle 0x0005, DMI type 8, 9 bytes
> Port Connector Information
> 	Internal Reference Designator: JLAN1
> 	Internal Connector Type: None
> 	External Reference Designator: IPMI_LAN
> 	External Connector Type: RJ-45
> 	Port Type: Network Port
>=20
> Handle 0x0006, DMI type 8, 9 bytes
> Port Connector Information
> 	Internal Reference Designator: JUSB1
> 	Internal Connector Type: None
> 	External Reference Designator: USB0/1(3.0)
> 	External Connector Type: Access Bus (USB)
> 	Port Type: USB
>=20
> Handle 0x0007, DMI type 8, 9 bytes
> Port Connector Information
> 	Internal Reference Designator: TPM/PORT80
> 	Internal Connector Type: Other
> 	External Reference Designator: Not Specified
> 	External Connector Type: None
> 	Port Type: Other
>=20
> Handle 0x0008, DMI type 8, 9 bytes
> Port Connector Information
> 	Internal Reference Designator: FAN3
> 	Internal Connector Type: Other
> 	External Reference Designator: Not Specified
> 	External Connector Type: None
> 	Port Type: Other
>=20
> Handle 0x0009, DMI type 8, 9 bytes
> Port Connector Information
> 	Internal Reference Designator: FAN4
> 	Internal Connector Type: Other
> 	External Reference Designator: Not Specified
> 	External Connector Type: None
> 	Port Type: Other
>=20
> Handle 0x000A, DMI type 8, 9 bytes
> Port Connector Information
> 	Internal Reference Designator: JCOM1 - COM1
> 	Internal Connector Type: Other
> 	External Reference Designator: Not Specified
> 	External Connector Type: None
> 	Port Type: Other
>=20
> Handle 0x000B, DMI type 8, 9 bytes
> Port Connector Information
> 	Internal Reference Designator: I-SATA6
> 	Internal Connector Type: Other
> 	External Reference Designator: Not Specified
> 	External Connector Type: None
> 	Port Type: Other
>=20
> Handle 0x000C, DMI type 8, 9 bytes
> Port Connector Information
> 	Internal Reference Designator: JSD1 - SATA PWR
> 	Internal Connector Type: Other
> 	External Reference Designator: Not Specified
> 	External Connector Type: None
> 	Port Type: Other
>=20
> Handle 0x000D, DMI type 9, 17 bytes
> System Slot Information
> 	Designation: CPU1 SLOT1 PCI-E 3.0 X16E 3.0 X16
> 	Type: x16 PCI Express 3 x16
> 	Current Usage: In Use
> 	Length: Long
> 	ID: 1
> 	Characteristics:
> 		3.3 V is provided
> 		Opening is shared
> 		PME signal is supported
> 	Bus Address: 0000:3b:00.0
>=20
> Handle 0x000E, DMI type 9, 17 bytes
> System Slot Information
> 	Designation: CPU1 SIOM PCI-E 3.0 X16
> 	Type: x16 PCI Express 3 x16
> 	Current Usage: In Use
> 	Length: Short
> 	ID: 1
> 	Characteristics:
> 		3.3 V is provided
> 		Opening is shared
> 		PME signal is supported
> 	Bus Address: 0000:18:00.0
>=20
> Handle 0x000F, DMI type 9, 17 bytes
> System Slot Information
> 	Designation: CPU2 RSC-P-6 PCI-E 3.0 X16 3.0 X8
> 	Type: x16 PCI Express 3 x16
> 	Current Usage: Available
> 	Length: Short
> 	ID: 1
> 	Characteristics:
> 		3.3 V is provided
> 		Opening is shared
> 		PME signal is supported
> 	Bus Address: 0000:af:00.0
>=20
> Handle 0x0011, DMI type 11, 5 bytes
> OEM Strings
> 	String 1: Intel Skylake/Lewisburg/Purley
> 	String 2: Supermicro motherboard-X11 Series
>=20
> Handle 0x0012, DMI type 32, 20 bytes
> System Boot Information
> 	Status: No errors detected
>=20
> Handle 0x0013, DMI type 39, 22 bytes
> System Power Supply
> 	Power Unit Group: 1
> 	Location: PSU1
> 	Name: PWS-2K22A-1R
> 	Manufacturer: SUPERMICRO
> 	Serial Number: P2K22CH46JT0157
> 	Asset Tag: N/A
> 	Model Part Number: PWS-2K22A-1R
> 	Revision: 1.3
> 	Max Power Capacity: 2200 W
> 	Status: Present, OK
> 	Type: Switching
> 	Input Voltage Range Switching: Auto-switch
> 	Plugged: Yes
> 	Hot Replaceable: No
>=20
> Handle 0x0014, DMI type 39, 22 bytes
> System Power Supply
> 	Power Unit Group: 2
> 	Location: PSU2
> 	Name: PWS-2K22A-1R
> 	Manufacturer: SUPERMICRO
> 	Serial Number: P2K22CH46JT0155
> 	Asset Tag: N/A
> 	Model Part Number: PWS-2K22A-1R
> 	Revision: 1.3
> 	Max Power Capacity: 2200 W
> 	Status: Present, OK
> 	Type: Switching
> 	Input Voltage Range Switching: Auto-switch
> 	Plugged: Yes
> 	Hot Replaceable: No
>=20
> Handle 0x0015, DMI type 41, 11 bytes
> Onboard Device
> 	Reference Designation: ASPEED Video AST2500
> 	Type: Video
> 	Status: Enabled
> 	Type Instance: 1
> 	Bus Address: 0000:03:00.0
>=20
> Handle 0x0016, DMI type 38, 18 bytes
> IPMI Device Information
> 	Interface Type: KCS (Keyboard Control Style)
> 	Specification Version: 2.0
> 	I2C Slave Address: 0x10
> 	NV Storage Device: Not Present
> 	Base Address: 0x0000000000000CA2 (I/O)
> 	Register Spacing: Successive Byte Boundaries
>=20
> Handle 0x0017, DMI type 42, 12 bytes
> Management Controller Host Interface
> 	Interface Type: KCS: Keyboard Controller Style
>=20
> Handle 0x001C, DMI type 15, 73 bytes
> System Event Log
> 	Area Length: 65535 bytes
> 	Header Start Offset: 0x0000
> 	Header Length: 16 bytes
> 	Data Start Offset: 0x0010
> 	Access Method: Memory-mapped physical 32-bit address
> 	Access Address: 0xFF110000
> 	Status: Valid, Not Full
> 	Change Token: 0x00000001
> 	Header Format: Type 1
> 	Supported Log Type Descriptors: 25
> 	Descriptor 1: Single-bit ECC memory error
> 	Data Format 1: Multiple-event handle
> 	Descriptor 2: Multi-bit ECC memory error
> 	Data Format 2: Multiple-event handle
> 	Descriptor 3: Parity memory error
> 	Data Format 3: None
> 	Descriptor 4: Bus timeout
> 	Data Format 4: None
> 	Descriptor 5: I/O channel block
> 	Data Format 5: None
> 	Descriptor 6: Software NMI
> 	Data Format 6: None
> 	Descriptor 7: POST memory resize
> 	Data Format 7: None
> 	Descriptor 8: POST error
> 	Data Format 8: POST results bitmap
> 	Descriptor 9: PCI parity error
> 	Data Format 9: Multiple-event handle
> 	Descriptor 10: PCI system error
> 	Data Format 10: Multiple-event handle
> 	Descriptor 11: CPU failure
> 	Data Format 11: None
> 	Descriptor 12: EISA failsafe timer timeout
> 	Data Format 12: None
> 	Descriptor 13: Correctable memory log disabled
> 	Data Format 13: None
> 	Descriptor 14: Logging disabled
> 	Data Format 14: None
> 	Descriptor 15: System limit exceeded
> 	Data Format 15: None
> 	Descriptor 16: Asynchronous hardware timer expired
> 	Data Format 16: None
> 	Descriptor 17: System configuration information
> 	Data Format 17: None
> 	Descriptor 18: Hard disk information
> 	Data Format 18: None
> 	Descriptor 19: System reconfigured
> 	Data Format 19: None
> 	Descriptor 20: Uncorrectable CPU-complex error
> 	Data Format 20: None
> 	Descriptor 21: Log area reset/cleared
> 	Data Format 21: None
> 	Descriptor 22: System boot
> 	Data Format 22: None
> 	Descriptor 23: End of log
> 	Data Format 23: None
> 	Descriptor 24: OEM-specific
> 	Data Format 24: OEM-specific
> 	Descriptor 25: OEM-specific
> 	Data Format 25: OEM-specific
>=20
> Handle 0x001D, DMI type 16, 23 bytes
> Physical Memory Array
> 	Location: System Board Or Motherboard
> 	Use: System Memory
> 	Error Correction Type: Single-bit ECC
> 	Maximum Capacity: 2304 GB
> 	Error Information Handle: Not Provided
> 	Number Of Devices: 6
>=20
> Handle 0x001E, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x001D
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 8 GB
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMMA1
> 	Bank Locator: P0_Node0_Channel0_Dimm0
> 	Type: DDR4
> 	Type Detail: Synchronous
> 	Speed: 2400 MT/s
> 	Manufacturer: Micron Technology
> 	Serial Number: 181E11CB
> 	Asset Tag: P1-DIMMA1_AssetTag (date:17/31)
> 	Part Number: 9ASF1G72PZ-2G3B1
> 	Rank: 1
> 	Configured Memory Speed: 2400 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x001F, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x001D
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMMA2
> 	Bank Locator: P0_Node0_Channel0_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0020, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x001D
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMMB1
> 	Bank Locator: P0_Node0_Channel1_Dimm0
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0021, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x001D
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMMB2
> 	Bank Locator: P0_Node0_Channel1_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0022, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x001D
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMMC1
> 	Bank Locator: P0_Node0_Channel2_Dimm0
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0023, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x001D
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMMC2
> 	Bank Locator: P0_Node0_Channel2_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0024, DMI type 16, 23 bytes
> Physical Memory Array
> 	Location: System Board Or Motherboard
> 	Use: System Memory
> 	Error Correction Type: Single-bit ECC
> 	Maximum Capacity: 2304 GB
> 	Error Information Handle: Not Provided
> 	Number Of Devices: 6
>=20
> Handle 0x0025, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0024
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 8 GB
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMMD1
> 	Bank Locator: P0_Node1_Channel0_Dimm0
> 	Type: DDR4
> 	Type Detail: Synchronous
> 	Speed: 2400 MT/s
> 	Manufacturer: Micron Technology
> 	Serial Number: 181E129C
> 	Asset Tag: P1-DIMMD1_AssetTag (date:17/31)
> 	Part Number: 9ASF1G72PZ-2G3B1
> 	Rank: 1
> 	Configured Memory Speed: 2400 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0026, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0024
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMMD2
> 	Bank Locator: P0_Node1_Channel0_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0027, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0024
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMME1
> 	Bank Locator: P0_Node1_Channel1_Dimm0
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0028, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0024
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMME2
> 	Bank Locator: P0_Node1_Channel1_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0029, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0024
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMMF1
> 	Bank Locator: P0_Node1_Channel2_Dimm0
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x002A, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0024
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P1-DIMMF2
> 	Bank Locator: P0_Node1_Channel2_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x002B, DMI type 16, 23 bytes
> Physical Memory Array
> 	Location: System Board Or Motherboard
> 	Use: System Memory
> 	Error Correction Type: Single-bit ECC
> 	Maximum Capacity: 2304 GB
> 	Error Information Handle: Not Provided
> 	Number Of Devices: 6
>=20
> Handle 0x002C, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x002B
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 8 GB
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMMA1
> 	Bank Locator: P1_Node0_Channel0_Dimm0
> 	Type: DDR4
> 	Type Detail: Synchronous
> 	Speed: 2400 MT/s
> 	Manufacturer: Micron Technology
> 	Serial Number: 181E1283
> 	Asset Tag: P2-DIMMA1_AssetTag (date:17/31)
> 	Part Number: 9ASF1G72PZ-2G3B1
> 	Rank: 1
> 	Configured Memory Speed: 2400 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x002D, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x002B
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMMA2
> 	Bank Locator: P1_Node0_Channel0_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x002E, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x002B
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMMB1
> 	Bank Locator: P1_Node0_Channel1_Dimm0
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x002F, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x002B
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMMB2
> 	Bank Locator: P1_Node0_Channel1_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0030, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x002B
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMMC1
> 	Bank Locator: P1_Node0_Channel2_Dimm0
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0031, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x002B
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMMC2
> 	Bank Locator: P1_Node0_Channel2_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0032, DMI type 16, 23 bytes
> Physical Memory Array
> 	Location: System Board Or Motherboard
> 	Use: System Memory
> 	Error Correction Type: Single-bit ECC
> 	Maximum Capacity: 2304 GB
> 	Error Information Handle: Not Provided
> 	Number Of Devices: 6
>=20
> Handle 0x0033, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0032
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 8 GB
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMMD1
> 	Bank Locator: P1_Node1_Channel0_Dimm0
> 	Type: DDR4
> 	Type Detail: Synchronous
> 	Speed: 2400 MT/s
> 	Manufacturer: Micron Technology
> 	Serial Number: 181E122C
> 	Asset Tag: P2-DIMMD1_AssetTag (date:17/31)
> 	Part Number: 9ASF1G72PZ-2G3B1
> 	Rank: 1
> 	Configured Memory Speed: 2400 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0034, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0032
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMMD2
> 	Bank Locator: P1_Node1_Channel0_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0035, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0032
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMME1
> 	Bank Locator: P1_Node1_Channel1_Dimm0
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0036, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0032
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMME2
> 	Bank Locator: P1_Node1_Channel1_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0037, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0032
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMMF1
> 	Bank Locator: P1_Node1_Channel2_Dimm0
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0038, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x0032
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: DIMM
> 	Set: None
> 	Locator: P2-DIMMF2
> 	Bank Locator: P1_Node1_Channel2_Dimm1
> 	Type: Unknown
> 	Type Detail: Unknown
> 	Speed: Unknown
> 	Manufacturer: NO DIMM
> 	Serial Number: NO DIMM
> 	Asset Tag: NO DIMM
> 	Part Number: NO DIMM
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x0039, DMI type 19, 31 bytes
> Memory Array Mapped Address
> 	Starting Address: 0x00000000000
> 	Ending Address: 0x001FFFFFFFF
> 	Range Size: 8 GB
> 	Physical Array Handle: 0x001D
> 	Partition Width: 1
>=20
> Handle 0x003A, DMI type 20, 35 bytes
> Memory Device Mapped Address
> 	Starting Address: 0x00000000000
> 	Ending Address: 0x001FFFFFFFF
> 	Range Size: 8 GB
> 	Physical Device Handle: 0x001E
> 	Memory Array Mapped Address Handle: 0x0039
> 	Partition Row Position: 1
> 	Interleave Position: 1
> 	Interleaved Data Depth: 1
>=20
> Handle 0x003B, DMI type 19, 31 bytes
> Memory Array Mapped Address
> 	Starting Address: 0x00200000000
> 	Ending Address: 0x003FFFFFFFF
> 	Range Size: 8 GB
> 	Physical Array Handle: 0x0024
> 	Partition Width: 1
>=20
> Handle 0x003C, DMI type 20, 35 bytes
> Memory Device Mapped Address
> 	Starting Address: 0x00000000000
> 	Ending Address: 0x001FFFFFFFF
> 	Range Size: 8 GB
> 	Physical Device Handle: 0x0025
> 	Memory Array Mapped Address Handle: 0x003B
> 	Partition Row Position: 1
> 	Interleave Position: 1
> 	Interleaved Data Depth: 1
>=20
> Handle 0x003D, DMI type 19, 31 bytes
> Memory Array Mapped Address
> 	Starting Address: 0x00400000000
> 	Ending Address: 0x005FFFFFFFF
> 	Range Size: 8 GB
> 	Physical Array Handle: 0x002B
> 	Partition Width: 1
>=20
> Handle 0x003E, DMI type 20, 35 bytes
> Memory Device Mapped Address
> 	Starting Address: 0x00000000000
> 	Ending Address: 0x001FFFFFFFF
> 	Range Size: 8 GB
> 	Physical Device Handle: 0x002C
> 	Memory Array Mapped Address Handle: 0x003D
> 	Partition Row Position: 1
> 	Interleave Position: 1
> 	Interleaved Data Depth: 1
>=20
> Handle 0x003F, DMI type 19, 31 bytes
> Memory Array Mapped Address
> 	Starting Address: 0x00600000000
> 	Ending Address: 0x007FFFFFFFF
> 	Range Size: 8 GB
> 	Physical Array Handle: 0x0032
> 	Partition Width: 1
>=20
> Handle 0x0040, DMI type 20, 35 bytes
> Memory Device Mapped Address
> 	Starting Address: 0x00000000000
> 	Ending Address: 0x001FFFFFFFF
> 	Range Size: 8 GB
> 	Physical Device Handle: 0x0033
> 	Memory Array Mapped Address Handle: 0x003F
> 	Partition Row Position: 1
> 	Interleave Position: 1
> 	Interleaved Data Depth: 1
>=20
> Handle 0x0041, DMI type 7, 19 bytes
> Cache Information
> 	Socket Designation: L1 Cache
> 	Configuration: Enabled, Not Socketed, Level 1
> 	Operational Mode: Write Back
> 	Location: Internal
> 	Installed Size: 512 kB
> 	Maximum Size: 512 kB
> 	Supported SRAM Types:
> 		Synchronous
> 	Installed SRAM Type: Synchronous
> 	Speed: Unknown
> 	Error Correction Type: Single-bit ECC
> 	System Type: Instruction
> 	Associativity: 8-way Set-associative
>=20
> Handle 0x0042, DMI type 7, 19 bytes
> Cache Information
> 	Socket Designation: L2 Cache
> 	Configuration: Enabled, Not Socketed, Level 2
> 	Operational Mode: Varies With Memory Address
> 	Location: Internal
> 	Installed Size: 8 MB
> 	Maximum Size: 8 MB
> 	Supported SRAM Types:
> 		Synchronous
> 	Installed SRAM Type: Synchronous
> 	Speed: Unknown
> 	Error Correction Type: Single-bit ECC
> 	System Type: Unified
> 	Associativity: 16-way Set-associative
>=20
> Handle 0x0043, DMI type 7, 19 bytes
> Cache Information
> 	Socket Designation: L3 Cache
> 	Configuration: Enabled, Not Socketed, Level 3
> 	Operational Mode: Varies With Memory Address
> 	Location: Internal
> 	Installed Size: 11 MB
> 	Maximum Size: 11 MB
> 	Supported SRAM Types:
> 		Synchronous
> 	Installed SRAM Type: Synchronous
> 	Speed: Unknown
> 	Error Correction Type: Single-bit ECC
> 	System Type: Unified
> 	Associativity: Fully Associative
>=20
> Handle 0x0044, DMI type 4, 48 bytes
> Processor Information
> 	Socket Designation: CPU1
> 	Type: Central Processor
> 	Family: Xeon
> 	Manufacturer: Intel(R) Corporation
> 	ID: 54 06 05 00 FF FB EB BF
> 	Signature: Type 0, Family 6, Model 85, Stepping 4
> 	Flags:
> 		FPU (Floating-point unit on-chip)
> 		VME (Virtual mode extension)
> 		DE (Debugging extension)
> 		PSE (Page size extension)
> 		TSC (Time stamp counter)
> 		MSR (Model specific registers)
> 		PAE (Physical address extension)
> 		MCE (Machine check exception)
> 		CX8 (CMPXCHG8 instruction supported)
> 		APIC (On-chip APIC hardware supported)
> 		SEP (Fast system call)
> 		MTRR (Memory type range registers)
> 		PGE (Page global enable)
> 		MCA (Machine check architecture)
> 		CMOV (Conditional move instruction supported)
> 		PAT (Page attribute table)
> 		PSE-36 (36-bit page size extension)
> 		CLFSH (CLFLUSH instruction supported)
> 		DS (Debug store)
> 		ACPI (ACPI supported)
> 		MMX (MMX technology supported)
> 		FXSR (FXSAVE and FXSTOR instructions supported)
> 		SSE (Streaming SIMD extensions)
> 		SSE2 (Streaming SIMD extensions 2)
> 		SS (Self-snoop)
> 		HTT (Multi-threading)
> 		TM (Thermal monitor supported)
> 		PBE (Pending break enabled)
> 	Version: Intel(R) Xeon(R) Silver 4108 CPU @ 1.80GHz
> 	Voltage: 1.6 V
> 	External Clock: 100 MHz
> 	Max Speed: 4000 MHz
> 	Current Speed: 1800 MHz
> 	Status: Populated, Enabled
> 	Upgrade: Other
> 	L1 Cache Handle: 0x0041
> 	L2 Cache Handle: 0x0042
> 	L3 Cache Handle: 0x0043
> 	Serial Number: Not Specified
> 	Asset Tag: UNKNOWN
> 	Part Number: Not Specified
> 	Core Count: 8
> 	Core Enabled: 8
> 	Thread Count: 16
> 	Characteristics:
> 		64-bit capable
> 		Multi-Core
> 		Hardware Thread
> 		Execute Protection
> 		Enhanced Virtualization
> 		Power/Performance Control
>=20
> Handle 0x0045, DMI type 7, 19 bytes
> Cache Information
> 	Socket Designation: L1 Cache
> 	Configuration: Enabled, Not Socketed, Level 1
> 	Operational Mode: Write Back
> 	Location: Internal
> 	Installed Size: 512 kB
> 	Maximum Size: 512 kB
> 	Supported SRAM Types:
> 		Synchronous
> 	Installed SRAM Type: Synchronous
> 	Speed: Unknown
> 	Error Correction Type: Single-bit ECC
> 	System Type: Instruction
> 	Associativity: 8-way Set-associative
>=20
> Handle 0x0046, DMI type 7, 19 bytes
> Cache Information
> 	Socket Designation: L2 Cache
> 	Configuration: Enabled, Not Socketed, Level 2
> 	Operational Mode: Varies With Memory Address
> 	Location: Internal
> 	Installed Size: 8 MB
> 	Maximum Size: 8 MB
> 	Supported SRAM Types:
> 		Synchronous
> 	Installed SRAM Type: Synchronous
> 	Speed: Unknown
> 	Error Correction Type: Single-bit ECC
> 	System Type: Unified
> 	Associativity: 16-way Set-associative
>=20
> Handle 0x0047, DMI type 7, 19 bytes
> Cache Information
> 	Socket Designation: L3 Cache
> 	Configuration: Enabled, Not Socketed, Level 3
> 	Operational Mode: Varies With Memory Address
> 	Location: Internal
> 	Installed Size: 11 MB
> 	Maximum Size: 11 MB
> 	Supported SRAM Types:
> 		Synchronous
> 	Installed SRAM Type: Synchronous
> 	Speed: Unknown
> 	Error Correction Type: Single-bit ECC
> 	System Type: Unified
> 	Associativity: Fully Associative
>=20
> Handle 0x0048, DMI type 4, 48 bytes
> Processor Information
> 	Socket Designation: CPU2
> 	Type: Central Processor
> 	Family: Xeon
> 	Manufacturer: Intel(R) Corporation
> 	ID: 54 06 05 00 FF FB EB BF
> 	Signature: Type 0, Family 6, Model 85, Stepping 4
> 	Flags:
> 		FPU (Floating-point unit on-chip)
> 		VME (Virtual mode extension)
> 		DE (Debugging extension)
> 		PSE (Page size extension)
> 		TSC (Time stamp counter)
> 		MSR (Model specific registers)
> 		PAE (Physical address extension)
> 		MCE (Machine check exception)
> 		CX8 (CMPXCHG8 instruction supported)
> 		APIC (On-chip APIC hardware supported)
> 		SEP (Fast system call)
> 		MTRR (Memory type range registers)
> 		PGE (Page global enable)
> 		MCA (Machine check architecture)
> 		CMOV (Conditional move instruction supported)
> 		PAT (Page attribute table)
> 		PSE-36 (36-bit page size extension)
> 		CLFSH (CLFLUSH instruction supported)
> 		DS (Debug store)
> 		ACPI (ACPI supported)
> 		MMX (MMX technology supported)
> 		FXSR (FXSAVE and FXSTOR instructions supported)
> 		SSE (Streaming SIMD extensions)
> 		SSE2 (Streaming SIMD extensions 2)
> 		SS (Self-snoop)
> 		HTT (Multi-threading)
> 		TM (Thermal monitor supported)
> 		PBE (Pending break enabled)
> 	Version: Intel(R) Xeon(R) Silver 4108 CPU @ 1.80GHz
> 	Voltage: 1.6 V
> 	External Clock: 100 MHz
> 	Max Speed: 4000 MHz
> 	Current Speed: 1800 MHz
> 	Status: Populated, Enabled
> 	Upgrade: Other
> 	L1 Cache Handle: 0x0045
> 	L2 Cache Handle: 0x0046
> 	L3 Cache Handle: 0x0047
> 	Serial Number: Not Specified
> 	Asset Tag: UNKNOWN
> 	Part Number: Not Specified
> 	Core Count: 8
> 	Core Enabled: 8
> 	Thread Count: 16
> 	Characteristics:
> 		64-bit capable
> 		Multi-Core
> 		Hardware Thread
> 		Execute Protection
> 		Enhanced Virtualization
> 		Power/Performance Control
>=20
> Handle 0x004D, DMI type 40, 27 bytes
> Additional Information 1
>=20
> Handle 0x004E, DMI type 40, 200 bytes
> Additional Information 1
>=20
> Handle 0x004F, DMI type 40, 27 bytes
> Additional Information 1
>=20
> Handle 0x0050, DMI type 40, 27 bytes
> Additional Information 1
>=20
> Handle 0x0051, DMI type 130, 32 bytes
> OEM-specific Type
> 	Header and Data:
> 		82 20 51 00 01 00 20 00 00 00 04 00 00 00 00 01
> 		18 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 	Strings:
> 		RSC-P-6
>=20
> Handle 0x0052, DMI type 130, 32 bytes
> OEM-specific Type
> 	Header and Data:
> 		82 20 52 00 01 00 20 00 00 00 02 00 00 00 00 01
> 		18 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 	Strings:
> 		BPN-ADP-12S3216N4-2UB
>=20
> Handle 0x0053, DMI type 40, 27 bytes
> Additional Information 1
>=20
> Handle 0x0054, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 54 00 06 00 00 86 80 20 20 D9 15 62 09 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0055, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 55 00 54 00 00 00 00 00
>=20
> Handle 0x0056, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 56 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0057, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 57 00 56 00 00 00 04 00
>=20
> Handle 0x0058, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 58 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0059, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 59 00 58 00 00 00 04 01
>=20
> Handle 0x005A, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 5A 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x005B, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 5B 00 5A 00 00 00 04 02
>=20
> Handle 0x005C, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 5C 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x005D, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 5D 00 5C 00 00 00 04 03
>=20
> Handle 0x005E, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 5E 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x005F, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 5F 00 5E 00 00 00 04 04
>=20
> Handle 0x0060, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 60 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0061, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 61 00 60 00 00 00 04 05
>=20
> Handle 0x0062, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 62 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0063, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 63 00 62 00 00 00 04 06
>=20
> Handle 0x0064, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 64 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0065, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 65 00 64 00 00 00 04 07
>=20
> Handle 0x0066, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 66 00 08 00 00 86 80 24 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0067, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 67 00 66 00 00 00 05 00
>=20
> Handle 0x0068, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 68 00 08 00 00 86 80 25 20 00 00 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0069, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 69 00 68 00 00 00 05 02
>=20
> Handle 0x006A, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 6A 00 08 00 00 86 80 26 20 86 80 26 20 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x006B, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 6B 00 6A 00 00 00 05 04
>=20
> Handle 0x006C, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 6C 00 08 00 00 86 80 14 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x006D, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 6D 00 6C 00 00 00 08 00
>=20
> Handle 0x006E, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 6E 00 08 00 00 86 80 16 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x006F, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 6F 00 6E 00 00 00 08 02
>=20
> Handle 0x0070, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 70 00 06 00 00 86 80 90 A1 D9 15 62 09 01
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0071, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 71 00 70 00 00 00 1C 00
>=20
> Handle 0x0072, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 72 00 06 00 00 86 80 95 A1 D9 15 62 09 02
> 		00 00 00 01 00 00 00
>=20
> Handle 0x0073, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 73 00 72 00 00 00 1C 05
>=20
> Handle 0x0074, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 74 00 06 00 00 03 1A 50 11 03 1A 50 11 02
> 		00 00 00 01 00 00 00
>=20
> Handle 0x0075, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 75 00 74 00 00 02 00 00
>=20
> Handle 0x0076, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 76 00 06 06 00 86 80 30 20 D9 15 62 09 02
> 		00 00 00 04 00 00 00
>=20
> Handle 0x0077, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 77 00 76 00 00 17 00 00
>=20
> Handle 0x0078, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 78 00 02 06 00 86 80 21 15 D9 15 12 09 02
> 		00 00 00 04 00 00 00
>=20
> Handle 0x0079, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 79 00 78 00 00 18 00 00
>=20
> Handle 0x007A, DMI type 190, 58 bytes
> OEM-specific Type
> 	Header and Data:
> 		BE 3A 7A 00 02 06 00 86 80 21 15 D9 15 12 09 02
> 		00 00 00 04 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00
>=20
> Handle 0x007B, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 7B 00 02 06 00 86 80 21 15 D9 15 12 09 02
> 		00 00 00 04 00 00 00
>=20
> Handle 0x007C, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 7C 00 7B 00 00 18 00 01
>=20
> Handle 0x007D, DMI type 190, 58 bytes
> OEM-specific Type
> 	Header and Data:
> 		BE 3A 7D 00 02 06 00 86 80 21 15 D9 15 12 09 02
> 		00 00 00 04 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00
>=20
> Handle 0x007E, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 7E 00 08 00 00 86 80 34 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x007F, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 7F 00 7E 00 00 17 05 00
>=20
> Handle 0x0080, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 80 00 08 00 00 86 80 35 20 00 00 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0081, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 81 00 80 00 00 17 05 02
>=20
> Handle 0x0082, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 82 00 08 00 00 86 80 36 20 86 80 36 20 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0083, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 83 00 82 00 00 17 05 04
>=20
> Handle 0x0084, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 84 00 06 01 00 86 80 30 20 D9 15 62 09 03
> 		00 00 00 10 00 00 00
>=20
> Handle 0x0085, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 85 00 84 00 00 3A 00 00
>=20
> Handle 0x0086, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 86 00 02 01 00 B3 15 1D 10 B3 15 83 00 03
> 		00 00 00 10 00 00 00
>=20
> Handle 0x0087, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 87 00 86 00 00 3B 00 00
>=20
> Handle 0x0088, DMI type 190, 58 bytes
> OEM-specific Type
> 	Header and Data:
> 		BE 3A 88 00 02 01 00 B3 15 1D 10 B3 15 83 00 03
> 		00 00 00 10 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00
>=20
> Handle 0x0089, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 89 00 02 01 00 B3 15 1D 10 B3 15 83 00 03
> 		00 00 00 10 00 00 00
>=20
> Handle 0x008A, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 8A 00 89 00 00 3B 00 01
>=20
> Handle 0x008B, DMI type 190, 58 bytes
> OEM-specific Type
> 	Header and Data:
> 		BE 3A 8B 00 02 01 00 B3 15 1D 10 B3 15 83 00 03
> 		00 00 00 10 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00
>=20
> Handle 0x008C, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 8C 00 08 00 00 86 80 34 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x008D, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 8D 00 8C 00 00 3A 05 00
>=20
> Handle 0x008E, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 8E 00 08 00 00 86 80 35 20 00 00 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x008F, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 8F 00 8E 00 00 3A 05 02
>=20
> Handle 0x0090, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 90 00 08 00 00 86 80 36 20 86 80 36 20 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0091, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 91 00 90 00 00 3A 05 04
>=20
> Handle 0x0092, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 92 00 08 00 00 86 80 66 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0093, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 93 00 92 00 00 3A 08 00
>=20
> Handle 0x0094, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 94 00 08 00 00 86 80 66 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0095, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 95 00 94 00 00 3A 09 00
>=20
> Handle 0x0096, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 96 00 08 00 00 86 80 40 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0097, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 97 00 96 00 00 3A 0A 00
>=20
> Handle 0x0098, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 98 00 08 00 00 86 80 41 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0099, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 99 00 98 00 00 3A 0A 01
>=20
> Handle 0x009A, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 9A 00 08 00 00 86 80 42 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x009B, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 9B 00 9A 00 00 3A 0A 02
>=20
> Handle 0x009C, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 9C 00 08 00 00 86 80 43 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x009D, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 9D 00 9C 00 00 3A 0A 03
>=20
> Handle 0x009E, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 9E 00 08 00 00 86 80 44 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x009F, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 9F 00 9E 00 00 3A 0A 04
>=20
> Handle 0x00A0, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 A0 00 08 00 00 86 80 45 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00A1, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A A1 00 A0 00 00 3A 0A 05
>=20
> Handle 0x00A2, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 A2 00 08 00 00 86 80 46 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00A3, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A A3 00 A2 00 00 3A 0A 06
>=20
> Handle 0x00A4, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 A4 00 08 00 00 86 80 47 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00A5, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A A5 00 A4 00 00 3A 0A 07
>=20
> Handle 0x00A6, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 A6 00 08 00 00 86 80 48 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00A7, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A A7 00 A6 00 00 3A 0B 00
>=20
> Handle 0x00A8, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 A8 00 08 00 00 86 80 49 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00A9, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A A9 00 A8 00 00 3A 0B 01
>=20
> Handle 0x00AA, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 AA 00 08 00 00 86 80 4A 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00AB, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A AB 00 AA 00 00 3A 0B 02
>=20
> Handle 0x00AC, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 AC 00 08 00 00 86 80 4B 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00AD, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A AD 00 AC 00 00 3A 0B 03
>=20
> Handle 0x00AE, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 AE 00 08 00 00 86 80 40 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00AF, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A AF 00 AE 00 00 3A 0C 00
>=20
> Handle 0x00B0, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 B0 00 08 00 00 86 80 41 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00B1, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A B1 00 B0 00 00 3A 0C 01
>=20
> Handle 0x00B2, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 B2 00 08 00 00 86 80 42 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00B3, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A B3 00 B2 00 00 3A 0C 02
>=20
> Handle 0x00B4, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 B4 00 08 00 00 86 80 43 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00B5, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A B5 00 B4 00 00 3A 0C 03
>=20
> Handle 0x00B6, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 B6 00 08 00 00 86 80 44 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00B7, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A B7 00 B6 00 00 3A 0C 04
>=20
> Handle 0x00B8, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 B8 00 08 00 00 86 80 45 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00B9, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A B9 00 B8 00 00 3A 0C 05
>=20
> Handle 0x00BA, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 BA 00 08 00 00 86 80 46 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00BB, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A BB 00 BA 00 00 3A 0C 06
>=20
> Handle 0x00BC, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 BC 00 08 00 00 86 80 47 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00BD, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A BD 00 BC 00 00 3A 0C 07
>=20
> Handle 0x00BE, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 BE 00 08 00 00 86 80 48 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00BF, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A BF 00 BE 00 00 3A 0D 00
>=20
> Handle 0x00C0, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 C0 00 08 00 00 86 80 49 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00C1, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A C1 00 C0 00 00 3A 0D 01
>=20
> Handle 0x00C2, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 C2 00 08 00 00 86 80 4A 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00C3, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A C3 00 C2 00 00 3A 0D 02
>=20
> Handle 0x00C4, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 C4 00 08 00 00 86 80 4B 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00C5, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A C5 00 C4 00 00 3A 0D 03
>=20
> Handle 0x00C6, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 C6 00 08 00 00 86 80 34 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00C7, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A C7 00 C6 00 00 5D 05 00
>=20
> Handle 0x00C8, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 C8 00 08 00 00 86 80 35 20 00 00 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00C9, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A C9 00 C8 00 00 5D 05 02
>=20
> Handle 0x00CA, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 CA 00 08 00 00 86 80 36 20 86 80 36 20 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00CB, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A CB 00 CA 00 00 5D 05 04
>=20
> Handle 0x00CC, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 CC 00 11 00 00 86 80 58 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00CD, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A CD 00 CC 00 00 5D 0E 00
>=20
> Handle 0x00CE, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 CE 00 08 00 00 86 80 59 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00CF, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A CF 00 CE 00 00 5D 0E 01
>=20
> Handle 0x00D0, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 D0 00 11 00 00 86 80 58 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00D1, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A D1 00 D0 00 00 5D 0F 00
>=20
> Handle 0x00D2, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 D2 00 08 00 00 86 80 59 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00D3, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A D3 00 D2 00 00 5D 0F 01
>=20
> Handle 0x00D4, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 D4 00 11 00 00 86 80 4C 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00D5, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A D5 00 D4 00 00 5D 12 00
>=20
> Handle 0x00D6, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 D6 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00D7, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A D7 00 D6 00 00 80 04 00
>=20
> Handle 0x00D8, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 D8 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00D9, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A D9 00 D8 00 00 80 04 01
>=20
> Handle 0x00DA, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 DA 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00DB, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A DB 00 DA 00 00 80 04 02
>=20
> Handle 0x00DC, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 DC 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00DD, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A DD 00 DC 00 00 80 04 03
>=20
> Handle 0x00DE, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 DE 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00DF, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A DF 00 DE 00 00 80 04 04
>=20
> Handle 0x00E0, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 E0 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00E1, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A E1 00 E0 00 00 80 04 05
>=20
> Handle 0x00E2, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 E2 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00E3, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A E3 00 E2 00 00 80 04 06
>=20
> Handle 0x00E4, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 E4 00 08 00 00 86 80 21 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00E5, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A E5 00 E4 00 00 80 04 07
>=20
> Handle 0x00E6, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 E6 00 08 00 00 86 80 24 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00E7, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A E7 00 E6 00 00 80 05 00
>=20
> Handle 0x00E8, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 E8 00 08 00 00 86 80 25 20 00 00 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00E9, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A E9 00 E8 00 00 80 05 02
>=20
> Handle 0x00EA, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 EA 00 08 00 00 86 80 26 20 86 80 26 20 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00EB, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A EB 00 EA 00 00 80 05 04
>=20
> Handle 0x00EC, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 EC 00 08 00 00 86 80 14 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00ED, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A ED 00 EC 00 00 80 08 00
>=20
> Handle 0x00EE, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 EE 00 08 00 00 86 80 16 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00EF, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A EF 00 EE 00 00 80 08 02
>=20
> Handle 0x00F0, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 F0 00 06 00 00 86 80 30 20 D9 15 62 09 03
> 		00 00 00 08 00 00 00
>=20
> Handle 0x00F1, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A F1 00 F0 00 00 85 00 00
>=20
> Handle 0x00F2, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 F2 00 01 00 00 00 10 C9 00 D9 15 72 09 03
> 		00 00 00 08 00 00 00
>=20
> Handle 0x00F3, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A F3 00 F2 00 00 86 00 00
>=20
> Handle 0x00F4, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 F4 00 08 00 00 86 80 34 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00F5, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A F5 00 F4 00 00 85 05 00
>=20
> Handle 0x00F6, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 F6 00 08 00 00 86 80 35 20 00 00 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00F7, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A F7 00 F6 00 00 85 05 02
>=20
> Handle 0x00F8, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 F8 00 08 00 00 86 80 36 20 86 80 36 20 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00F9, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A F9 00 F8 00 00 85 05 04
>=20
> Handle 0x00FA, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 FA 00 06 02 00 86 80 30 20 D9 15 62 09 01
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00FB, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A FB 00 FA 00 00 AE 00 00
>=20
> Handle 0x00FC, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 FC 00 08 00 00 86 80 34 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00FD, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A FD 00 FC 00 00 AE 05 00
>=20
> Handle 0x00FE, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 FE 00 08 00 00 86 80 35 20 00 00 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x00FF, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A FF 00 FE 00 00 AE 05 02
>=20
> Handle 0x0100, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 00 01 08 00 00 86 80 36 20 86 80 36 20 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0101, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 01 01 00 01 00 AE 05 04
>=20
> Handle 0x0102, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 02 01 08 00 00 86 80 66 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0103, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 03 01 02 01 00 AE 08 00
>=20
> Handle 0x0104, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 04 01 08 00 00 86 80 66 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0105, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 05 01 04 01 00 AE 09 00
>=20
> Handle 0x0106, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 06 01 08 00 00 86 80 40 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0107, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 07 01 06 01 00 AE 0A 00
>=20
> Handle 0x0108, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 08 01 08 00 00 86 80 41 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0109, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 09 01 08 01 00 AE 0A 01
>=20
> Handle 0x010A, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 0A 01 08 00 00 86 80 42 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x010B, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 0B 01 0A 01 00 AE 0A 02
>=20
> Handle 0x010C, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 0C 01 08 00 00 86 80 43 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x010D, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 0D 01 0C 01 00 AE 0A 03
>=20
> Handle 0x010E, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 0E 01 08 00 00 86 80 44 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x010F, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 0F 01 0E 01 00 AE 0A 04
>=20
> Handle 0x0110, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 10 01 08 00 00 86 80 45 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0111, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 11 01 10 01 00 AE 0A 05
>=20
> Handle 0x0112, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 12 01 08 00 00 86 80 46 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0113, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 13 01 12 01 00 AE 0A 06
>=20
> Handle 0x0114, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 14 01 08 00 00 86 80 47 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0115, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 15 01 14 01 00 AE 0A 07
>=20
> Handle 0x0116, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 16 01 08 00 00 86 80 48 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0117, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 17 01 16 01 00 AE 0B 00
>=20
> Handle 0x0118, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 18 01 08 00 00 86 80 49 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0119, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 19 01 18 01 00 AE 0B 01
>=20
> Handle 0x011A, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 1A 01 08 00 00 86 80 4A 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x011B, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 1B 01 1A 01 00 AE 0B 02
>=20
> Handle 0x011C, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 1C 01 08 00 00 86 80 4B 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x011D, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 1D 01 1C 01 00 AE 0B 03
>=20
> Handle 0x011E, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 1E 01 08 00 00 86 80 40 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x011F, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 1F 01 1E 01 00 AE 0C 00
>=20
> Handle 0x0120, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 20 01 08 00 00 86 80 41 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0121, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 21 01 20 01 00 AE 0C 01
>=20
> Handle 0x0122, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 22 01 08 00 00 86 80 42 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0123, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 23 01 22 01 00 AE 0C 02
>=20
> Handle 0x0124, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 24 01 08 00 00 86 80 43 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0125, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 25 01 24 01 00 AE 0C 03
>=20
> Handle 0x0126, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 26 01 08 00 00 86 80 44 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0127, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 27 01 26 01 00 AE 0C 04
>=20
> Handle 0x0128, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 28 01 08 00 00 86 80 45 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0129, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 29 01 28 01 00 AE 0C 05
>=20
> Handle 0x012A, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 2A 01 08 00 00 86 80 46 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x012B, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 2B 01 2A 01 00 AE 0C 06
>=20
> Handle 0x012C, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 2C 01 08 00 00 86 80 47 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x012D, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 2D 01 2C 01 00 AE 0C 07
>=20
> Handle 0x012E, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 2E 01 08 00 00 86 80 48 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x012F, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 2F 01 2E 01 00 AE 0D 00
>=20
> Handle 0x0130, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 30 01 08 00 00 86 80 49 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0131, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 31 01 30 01 00 AE 0D 01
>=20
> Handle 0x0132, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 32 01 08 00 00 86 80 4A 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0133, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 33 01 32 01 00 AE 0D 02
>=20
> Handle 0x0134, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 34 01 08 00 00 86 80 4B 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0135, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 35 01 34 01 00 AE 0D 03
>=20
> Handle 0x0136, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 36 01 06 0E 00 86 80 30 20 D9 15 62 09 01
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0137, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 37 01 36 01 00 D7 00 00
>=20
> Handle 0x0138, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 38 01 06 0F 00 86 80 31 20 D9 15 62 09 01
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0139, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 39 01 38 01 00 D7 01 00
>=20
> Handle 0x013A, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 3A 01 06 10 00 86 80 32 20 D9 15 62 09 01
> 		00 00 00 00 00 00 00
>=20
> Handle 0x013B, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 3B 01 3A 01 00 D7 02 00
>=20
> Handle 0x013C, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 3C 01 06 11 00 86 80 33 20 D9 15 62 09 01
> 		00 00 00 00 00 00 00
>=20
> Handle 0x013D, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 3D 01 3C 01 00 D7 03 00
>=20
> Handle 0x013E, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 3E 01 08 00 00 86 80 34 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x013F, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 3F 01 3E 01 00 D7 05 00
>=20
> Handle 0x0140, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 40 01 08 00 00 86 80 35 20 00 00 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0141, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 41 01 40 01 00 D7 05 02
>=20
> Handle 0x0142, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 42 01 08 00 00 86 80 36 20 86 80 36 20 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0143, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 43 01 42 01 00 D7 05 04
>=20
> Handle 0x0144, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 44 01 11 00 00 86 80 58 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0145, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 45 01 44 01 00 D7 0E 00
>=20
> Handle 0x0146, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 46 01 08 00 00 86 80 59 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0147, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 47 01 46 01 00 D7 0E 01
>=20
> Handle 0x0148, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 48 01 11 00 00 86 80 58 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x0149, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 49 01 48 01 00 D7 0F 00
>=20
> Handle 0x014A, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 4A 01 08 00 00 86 80 59 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x014B, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 4B 01 4A 01 00 D7 0F 01
>=20
> Handle 0x014C, DMI type 192, 23 bytes
> OEM-specific Type
> 	Header and Data:
> 		C0 17 4C 01 11 00 00 86 80 4C 20 86 80 00 00 00
> 		00 00 00 00 00 00 00
>=20
> Handle 0x014D, DMI type 165, 10 bytes
> OEM-specific Type
> 	Header and Data:
> 		A5 0A 4D 01 4C 01 00 D7 12 00
>=20
> Handle 0x014E, DMI type 193, 230 bytes
> OEM-specific Type
> 	Header and Data:
> 		C1 E6 4E 01 01 01 16 00 00 00 47 65 6E 75 6E 74
> 		65 6C 69 6E 65 49 54 06 05 00 00 08 10 00 FF FB
> 		FE 77 FF FB EB BF 01 63 03 76 FF B5 F0 00 00 00
> 		00 00 00 00 C3 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 40 00 00 00 40 00 00 00 03 00
> 		00 00 20 20 00 00 77 00 00 00 02 00 00 00 09 00
> 		00 00 00 00 00 00 00 00 00 00 FB FF 9F D3 08 00
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 04 04 30 07 00 00 00 00 00 00
> 		00 00 03 06 00 00 01 00 00 00 02 00 00 00 00 01
> 		00 00 00 00 00 00 FF 02 00 00 80 0A 00 00 88 0A
> 		00 00 00 00 00 00 00 00 00 00 3F 00 00 00 00 00
> 		00 00 02 00 00 00 00 00 00 00 0A 00 00 00 00 00
> 		00 00 00 00 00 00
> 	Strings:
> 		Socket 0
>=20
> Handle 0x014F, DMI type 193, 246 bytes
> OEM-specific Type
> 	Header and Data:
> 		C1 F6 4F 01 01 02 01 00 00 00 0F 00 00 00 07 00
> 		00 00 00 00 00 00 02 00 00 00 90 00 00 00 00 00
> 		00 00 00 00 00 00 08 07 00 00 B8 0B 00 00 64 00
> 		00 00 00 00 00 00 08 07 00 00 B8 0B 00 00 64 00
> 		00 00 00 00 00 00 08 07 00 00 B8 0B 00 00 64 00
> 		00 00 00 00 00 00 08 07 00 00 B8 0B 00 00 64 00
> 		00 00 00 00 00 00 08 07 00 00 B8 0B 00 00 64 00
> 		00 00 00 00 00 00 08 00 00 80 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 21 01
> 		00 00 00 08 10 2C 49 6E 74 65 6C 28 52 29 20 58
> 		65 6F 6E 28 52 29 20 53 69 6C 76 65 72 20 34 31
> 		30 38 20 43 50 55 20 40 20 31 2E 38 30 47 48 7A
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 60
> 		00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 01 00 00 2E 30 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00
> 	Strings:
> 		Socket 0
>=20
> Handle 0x0150, DMI type 193, 230 bytes
> OEM-specific Type
> 	Header and Data:
> 		C1 E6 50 01 01 01 16 00 00 00 47 65 6E 75 6E 74
> 		65 6C 69 6E 65 49 54 06 05 00 00 08 10 10 FF FB
> 		FE 77 FF FB EB BF 01 63 03 76 FF B5 F0 00 00 00
> 		00 00 00 00 C3 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 40 00 00 00 40 00 00 00 03 00
> 		00 00 20 20 00 00 77 00 00 00 02 00 00 00 09 00
> 		00 00 00 00 00 00 00 00 00 00 FB FF 9F D3 08 00
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00 04 04 30 07 00 00 00 00 00 00
> 		00 00 03 06 00 00 01 00 00 00 02 00 00 00 00 01
> 		00 00 10 00 00 00 FF 02 00 00 80 0A 00 00 88 0A
> 		00 00 00 00 00 00 00 00 00 00 3F 00 00 00 00 00
> 		00 00 02 00 00 00 00 00 00 00 0A 00 00 00 00 00
> 		00 00 00 00 00 00
> 	Strings:
> 		Socket 1
>=20
> Handle 0x0151, DMI type 193, 246 bytes
> OEM-specific Type
> 	Header and Data:
> 		C1 F6 51 01 01 02 01 00 00 00 0F 00 00 00 07 00
> 		00 00 00 00 00 00 02 00 00 00 90 00 00 00 00 00
> 		00 00 00 00 00 00 08 07 00 00 B8 0B 00 00 64 00
> 		00 00 00 00 00 00 08 07 00 00 B8 0B 00 00 64 00
> 		00 00 00 00 00 00 08 07 00 00 B8 0B 00 00 64 00
> 		00 00 00 00 00 00 08 07 00 00 B8 0B 00 00 64 00
> 		00 00 00 00 00 00 08 07 00 00 B8 0B 00 00 64 00
> 		00 00 00 00 00 00 08 00 00 80 00 00 00 00 00 00
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 21 01
> 		00 00 00 08 10 2C 49 6E 74 65 6C 28 52 29 20 58
> 		65 6F 6E 28 52 29 20 53 69 6C 76 65 72 20 34 31
> 		30 38 20 43 50 55 20 40 20 31 2E 38 30 47 48 7A
> 		00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 60
> 		00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 		00 00 00 01 00 00 2E 30 00 00 00 00 00 00 00 00
> 		00 00 00 00 00 00
> 	Strings:
> 		Socket 1
>=20
> Handle 0x0152, DMI type 196, 5 bytes
> OEM-specific Type
> 	Header and Data:
> 		C4 05 52 01 00
>=20
> Handle 0x0153, DMI type 127, 4 bytes
> End Of Table
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--4lluKEjAFX7Zf09fXV5ictL26QPzfbbGx--

--b9oKPa2LaO82NeqHYhn216RqnHul0myBC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmABWnYFAwAAAAAACgkQlh/E3EQov+C+
WA//ZrVhyvZXNcuLCj3XchmtieYu2FUtDLrOLIKogFaC70bXjts5EY5ohaue60v7K78t/DTtl9nB
MyYIBtIOctnLHfkwQXIgRxkxSdFHsM7/AKrqasoc2NNC76vp7Mh8TdFKXVbEsUJDe7pcWVuVKB+A
P/1ULsx84iAFevGhkoXtPfcjXrBAm3RiETf+S0T5EDCw46Yulq08py0so0w2vPCYYNftsg2yxx+U
E97MHzgUL4Eaalxthp60y4RGNoCDlDbuj+iP+2/ti2DOF2RSM6WEdALjjCLONDokAkqzywXNqZ+T
uRraM12yxJg7xs87XUU4hUUUHMJa4VSHZEetAmzFUAIMycAEwlV8iSyzOnEgPV6PHPcDd1vwQo11
i4HI/hkYG015XBPsgXhBqOsvwiURUB1aHzwl9BiD+PhKvLesGUAoK6UK3nMiC+d/ajsjY8SPkRKN
7gf0uB8vPEhqynhOW2oBk9L2aajz6rI7vUtSkDahu/DBQEuXUuNznZLIr9K3hwK2nSk6bEnajd2O
LJa903LUYIt0WnjTV6arJQ/T1To8nVfUoW8+PQcYnnMPFjfi6l1fIY5VGQcavwtffanq//4yTHYL
lJDuTH5mssTMlMwkuOBzSYAxnP0TEJM38Vjr3GTpEcnpnYfjaU7uWtTS3B1YzD9QJzzio7Cx2ewm
Lw0=
=U1Wi
-----END PGP SIGNATURE-----

--b9oKPa2LaO82NeqHYhn216RqnHul0myBC--

--===============8216567510409235839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8216567510409235839==--
