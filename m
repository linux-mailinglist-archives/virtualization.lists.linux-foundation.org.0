Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 083CE37FB1C
	for <lists.virtualization@lfdr.de>; Thu, 13 May 2021 17:58:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EB00400D9;
	Thu, 13 May 2021 15:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wEknqkeu0dxl; Thu, 13 May 2021 15:57:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3531D4036F;
	Thu, 13 May 2021 15:57:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF06AC0001;
	Thu, 13 May 2021 15:57:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9817AC0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 15:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86E5A40132
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 15:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWk4chzNGe0n
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 15:57:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5E8F400D9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620921466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qeKoWoUkoim0C+m+NAlidhIk6zANjrHLdTbgpfFV2r0=;
 b=aasdfYxowte5nmmKfPjDG999q2uNICDY/0jIvtpc31IQl0j79Gi8vK780VtrYPNy4b2tIt
 C/H8IdMDCyCV+TfOTziau/Vgs7RVcHRSu6suIZxUfrdNAJ5uJyORawopjcJkxgGPA3rX4W
 YheDx4y9+BBEBxFT+tvGOmk1j/OBf0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-caC32aOAMVOEG8trzQFMvg-1; Thu, 13 May 2021 11:57:41 -0400
X-MC-Unique: caC32aOAMVOEG8trzQFMvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF741800D55;
 Thu, 13 May 2021 15:57:39 +0000 (UTC)
Received: from localhost (ovpn-113-21.ams2.redhat.com [10.36.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC46E687C6;
 Thu, 13 May 2021 15:57:35 +0000 (UTC)
Date: Thu, 13 May 2021 16:57:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC][PATCH] vhost/vsock: Add vsock_list file to map cid with
 vhost tasks
Message-ID: <YJ1Mbie1YGKRR6b8@stefanha-x1.localdomain>
References: <20210505163855.32dad8e7@gandalf.local.home>
MIME-Version: 1.0
In-Reply-To: <20210505163855.32dad8e7@gandalf.local.home>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Joel Fernandes <joelaf@google.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 Linux Trace Devel <linux-trace-devel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
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
Content-Type: multipart/mixed; boundary="===============6743892321065158790=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============6743892321065158790==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3QuthSgeiknbVY48"
Content-Disposition: inline


--3QuthSgeiknbVY48
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 04:38:55PM -0400, Steven Rostedt wrote:
> The new trace-cmd 3.0 (which is almost ready to be released) allows for
> tracing between host and guests with timestamp synchronization such that
> the events on the host and the guest can be interleaved in the proper ord=
er
> that they occur. KernelShark now has a plugin that visualizes this
> interaction.
>=20
> The implementation requires that the guest has a vsock CID assigned, and =
on
> the guest a "trace-cmd agent" is running, that will listen on a port for
> the CID. The on the host a "trace-cmd record -A guest@cid:port -e events"
> can be called and the host will connect to the guest agent through the
> cid/port pair and have the agent enable tracing on behalf of the host and
> send the trace data back down to it.
>=20
> The problem is that there is no sure fire way to find the CID for a guest.
> Currently, the user must know the cid, or we have a hack that looks for t=
he
> qemu process and parses the --guest-cid parameter from it. But this is
> prone to error and does not work on other implementation (was told that
> crosvm does not use qemu).

The crosvm command-line syntax is: crosvm run --cid <CID>

> As I can not find a way to discover CIDs assigned to guests via any kernel
> interface, I decided to create this one. Note, I'm not attached to it. If
> there's a better way to do this, I would love to have it. But since I'm n=
ot
> an expert in the networking layer nor virtio, I decided to stick to what I
> know and add a debugfs interface that simply lists all the registered CIDs
> and the worker task that they are associated with. The worker task at
> least has the PID of the task it represents.
>=20
> Now I can find the cid / host process in charge of the guest pair:
>=20
>   # cat /sys/kernel/debug/vsock_list
>   3	vhost-1954:2002
>=20
>   # ps aux | grep 1954
>   qemu        1954  9.9 21.3 1629092 796148 ?      Sl   16:22   0:58  /us=
r/bin/qemu-kvm -name guest=3DFedora21,debug-threads=3Don -S -object secret,=
id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-1-Fedora21=
/master-key.aes -machine pc-1.2,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff=
 -cpu qemu64 -m 1000 -overcommit mem-lock=3Doff -smp 2,sockets=3D2,cores=3D=
1,threads=3D1 -uuid 1eefeeb0-3ac7-07c1-926e-236908313b4c -no-user-config -n=
odefaults -chardev socket,id=3Dcharmonitor,fd=3D32,server,nowait -mon chard=
ev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dutc -no-shutdown -=
boot strict=3Don -device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2=
 -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,addr=3D0x6 -bloc=
kdev {"driver":"host_device","filename":"/dev/mapper/vg_bxtest-GuestFedora"=
,"node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"} -=
blockdev {"node-name":"libvirt-1-format","read-only":false,"driver":"raw","=
file":"libvirt-1-storage"} -device ide-hd,bus=3Dide.0,unit=3D0,drive=3Dlibv=
irt-1-
>  format,id=3Dide0-0-0,bootindex=3D1 -netdev tap,fd=3D34,id=3Dhostnet0 -de=
vice rtl8139,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:9f:e9:d5,bus=3Dpci.=
0,addr=3D0x3 -netdev tap,fd=3D35,id=3Dhostnet1 -device virtio-net-pci,netde=
v=3Dhostnet1,id=3Dnet1,mac=3D52:54:00:ec:dc:6e,bus=3Dpci.0,addr=3D0x5 -char=
dev pty,id=3Dcharserial0 -device isa-serial,chardev=3Dcharserial0,id=3Dseri=
al0 -chardev pipe,id=3Dcharchannel0,path=3D/var/lib/trace-cmd/virt/Fedora21=
/trace-pipe-cpu0 -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chard=
ev=3Dcharchannel0,id=3Dchannel0,name=3Dtrace-pipe-cpu0 -chardev pipe,id=3Dc=
harchannel1,path=3D/var/lib/trace-cmd/virt/Fedora21/trace-pipe-cpu1 -device=
 virtserialport,bus=3Dvirtio-serial0.0,nr=3D2,chardev=3Dcharchannel1,id=3Dc=
hannel1,name=3Dtrace-pipe-cpu1 -vnc 127.0.0.1:0 -device cirrus-vga,id=3Dvid=
eo0,bus=3Dpci.0,addr=3D0x2 -device virtio-balloon-pci,id=3Dballoon0,bus=3Dp=
ci.0,addr=3D0x4 -sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=
=3Ddeny,resourcecontrol=3Ddeny -device vhost-vsock-pci,id=3Dvsock0,guest-ci=
d=3D3,vhostfd=3D16,bus=3Dpci.0,addr=3D0x7 -msg=20
>  timestamp=3Don
>   root        2000  0.0  0.0      0     0 ?        S    16:22   0:00 [kvm=
-pit/1954]
>   root        2002  0.0  0.0      0     0 ?        S    16:22   0:00 [vho=
st-1954]

This approach relies on process hierarchy of the VMM (QEMU).
Multi-process QEMU is in development and will allow VIRTIO devices to
run as separate processes from the main QEMU. It then becomes harder to
correlate a VIRTIO device process with its QEMU process.

So I think in the end this approach ends up being as fragile as parsing
command-lines. The kernel doesn't really have the concept of a "VM" that
the vhost_vsock is associated with :). Maybe just parse QEMU and crosvm
command-lines?

Stefan

--3QuthSgeiknbVY48
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCdTG4ACgkQnKSrs4Gr
c8isgQf9GZcfCvYI4vKMA5m60y9wvx9s4lmq1TRA/KNm9vRPMrQrqGeZqG3gxewE
BvFw1Xx9Ax6mtLfQ7pHQY7SD/GkXMQh3UwDW9jPvX/qKnoNWVgp0DbXpcq4r3pQu
zA3IxTW3Vv2dNBkAK5vhW6PKVOraKVPgzxxbzZ8s8BfBCV4LDO2ILIE+871f3uCo
V6csKErHYgVfWIh4cD1OkXMyODd+A32AyUKLwb3sI0HwmJrt3E10A8XUfFIyF5GJ
P9AgwvcEVGPh4xwZ6mInfHj0pqIqKBhGcSvWPiGn4H32yLPidBioT+C+3mb859w3
7M7crEdkWw7O0xJ6B+yNjxOwwqallA==
=SzSi
-----END PGP SIGNATURE-----

--3QuthSgeiknbVY48--


--===============6743892321065158790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6743892321065158790==--

