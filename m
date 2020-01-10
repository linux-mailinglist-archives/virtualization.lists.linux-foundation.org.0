Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C51373DA
	for <lists.virtualization@lfdr.de>; Fri, 10 Jan 2020 17:41:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1EC8387C76;
	Fri, 10 Jan 2020 16:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhCsP36t3VeM; Fri, 10 Jan 2020 16:41:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8F0A98829F;
	Fri, 10 Jan 2020 16:41:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66BADC0881;
	Fri, 10 Jan 2020 16:41:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54431C0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 16:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 40BDC87653
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 16:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqxGujs-zDRx
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 16:40:58 +0000 (UTC)
X-Greylist: delayed 00:08:42 by SQLgrey-1.7.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6DEC587635
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 16:40:58 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 28FDA628;
 Fri, 10 Jan 2020 11:32:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 10 Jan 2020 11:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=bBzhN1uSrKOMIdpoTn3ah8TuwDEJu
 t2dgiEO8bvnGOQ=; b=kZmfz6dDwv+xzEjlLzoBKJIDvOZARdVlGeFWyqO/jFGkn
 xo7ZfRJo1lVtUNwU9Ms+0otDCG8GK40GaMISdTKuWOosFyK9LNwTLLzrGz9YPHEX
 MkJN02wlOw56/NE82Kee5/X9sFcKgMklBLkhf6yFL0OGAiBdA88bgH7n/NU8wxR8
 4RxhpWf1oPPreltBUZWe4cc+THA/iwJAIpq36fyqQgQvNbrs6h7gciTadkixYZIx
 OV1713nediWNP/UFAPYZCSCRWVjnYs4dwJ9u3JnLGs4DseGwEBcwTIuIpCD1VD8P
 y6ZMY/G7QnvQBjfWNN3dUKfzokZW+ra4DL8nPR3ZA==
X-ME-Sender: <xms:DqcYXrdGcvQACK_z-v6yQxVY6IJ4iDQrGAI47fUqCyWrpAsfb5jdQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeifedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
 dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
 uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
 cuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepledurdeihedrfeegrdeffeen
 ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
 hhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:DqcYXu0Qmr-J3qDv0TTlHIoydHsfnZ_W2UUK6uhk-uI3AfFdNM7NfQ>
 <xmx:DqcYXqHowHfTzJ7EG3rL1CgIV5lRf5HfOsIGE7ariU67ZsxtfbmUkQ>
 <xmx:DqcYXgnGbBewh8n-HPD7lI48EioPbBO-9ukV0kEvpPAkSi3Qf6uH1w>
 <xmx:DqcYXujnbBdZIddFPuJK5m7QIwORTzu0UvCY7Fi5Oim1SImf-PGtCw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28AE03060802;
 Fri, 10 Jan 2020 11:32:14 -0500 (EST)
Date: Fri, 10 Jan 2020 17:32:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: virtualization@lists.linux-foundation.org
Subject: bochs_hw_init fails to request framebuffer on EFI boot with plymouth
 visible
Message-ID: <20200110163211.GB29736@mail-itl>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============7745235062308584373=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============7745235062308584373==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline


--uAKRQypu60I7Lcqm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: bochs_hw_init fails to request framebuffer on EFI boot with plymouth
 visible

Hi,

This is the context of "bochs_drm: failed bochs_hw_init() results in
panic". When I boot the system, if plymouth is visible, it crashes. But
if I press ESC to hide it, it boots fine. bochs_drm is build as module
and _not_ included in the initramfs, so it is loaded only after root
filesystem is mounted. And before that, efifb works just fine, including
nice graphical disk passphrase prompt.

This particular setup is running Xen nested in KVM, but I can reproduce
the crash on plain Linux within KVM too, so that probably doesn't
matter.
Versions:
 - Linux 5.4.5
 - QEMU 4.2.0

Messages about bochs_drm init when it works:

[   33.802504] parport_pc parport_pc.956: Unable to set coherent dma mask: =
disabling DMA
[   33.873522] MCE: In-kernel MCE decoding enabled.
[   33.899895] parport_pc parport_pc.888: Unable to set coherent dma mask: =
disabling DMA
[   33.977738] parport_pc parport_pc.632: Unable to set coherent dma mask: =
disabling DMA
[   34.071587] bochs-drm 0000:00:02.0: remove_conflicting_pci_framebuffers:=
 bar 0: 0xc0000000 -> 0xc0ffffff
[   34.096014] bochs-drm 0000:00:02.0: remove_conflicting_pci_framebuffers:=
 bar 2: 0xc1087000 -> 0xc1087fff
[   34.149109] fb0: switching to bochsdrmfb from EFI VGA
[   34.170491] Console: switching to colour dummy device 80x25
[   34.178497] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
[   34.188729] [drm] Found bochs VGA, ID 0xb0c5.
[   34.189974] [drm] Framebuffer size 16384 kB @ 0xc0000000, mmio @ 0xc1087=
000.
[   34.200131] [TTM] Zone  kernel: Available graphics memory: 2004604 KiB
[   34.202006] [TTM] Initializing pool allocator
[   34.233679] [TTM] Initializing DMA pool allocator
[   34.246468] [drm] Found EDID data blob.
[   34.249477] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:02.0 =
on minor 0
[   34.276315] fbcon: bochs-drmdrmfb (fb0) is primary device
[   34.283968] Console: switching to colour frame buffer device 128x48
[   34.345742] ppdev: user-space parallel port driver
[   34.566261] bochs-drm 0000:00:02.0: fb0: bochs-drmdrmfb frame buffer dev=
ice


Messages about bochs_drm init when it crashes:

[   32.889058] bochs-drm 0000:00:02.0: remove_conflicting_pci_framebuffers:=
 bar 0: 0xc0000000 -> 0xc0ffffff
[   32.891801] bochs-drm 0000:00:02.0: remove_conflicting_pci_framebuffers:=
 bar 2: 0xc1087000 -> 0xc1087fff
[   32.921205] parport_pc parport_pc.956: Unable to set coherent dma mask: =
disabling DMA
[   32.927873] parport_pc parport_pc.888: Unable to set coherent dma mask: =
disabling DMA
[   32.946529] parport_pc parport_pc.632: Unable to set coherent dma mask: =
disabling DMA
[   32.951345] fb0: switching to bochsdrmfb from EFI VGA
[   32.963031] Console: switching to colour dummy device 80x25
[   32.979805] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
[   33.015380] MCE: In-kernel MCE decoding enabled.
[   33.030158] bochs-drm 0000:00:02.0: BAR 0: can't reserve [mem 0xc0000000=
-0xc0ffffff pref]
[   33.032576] [drm:bochs_hw_init [bochs_drm]] *ERROR* Cannot request frame=
buffer


Full logs: https://gist.github.com/marmarek/ca4fdcfd33d7e5258f15082fafa27bfc

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4YpwsACgkQ24/THMrX
1ywSNgf/VhZ17Zg1EAO4EsXhTfcOqxG/Aj5J/hZeNMEAjfPXyMLMr2F0Rvr9XSsx
9uPkApVruutonI6JqfI/EmiObIS1wMwyaQDcgwEgnlWYuoVan0hELh2kICtP6ywU
HBmKYyKJ8xJ5kcViEoSbsgTsB0hNp8QLNOTDsEgof/FFksJaQsbI4TmaIAafrTjr
OS7TLZli/iwAWM1mB6PqfR9ihUkcVTZ9/rQOwnhaPz8kqIHgk83wZWCpDfvq8oP7
H3pQp7CFnq1PAZNqOJo5Wks0bcaCbxRq676xtGvcltPrWcv90LrmT2vlrZq+/4bJ
C3Up5SZuHixOmqJ0xPVcz9nSaSmKmQ==
=wKEj
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

--===============7745235062308584373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7745235062308584373==--
