Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A2109553775
	for <lists.virtualization@lfdr.de>; Tue, 21 Jun 2022 18:10:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E808983F84;
	Tue, 21 Jun 2022 16:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E808983F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Fhhx7MY53eH; Tue, 21 Jun 2022 16:10:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 967CE83F7D;
	Tue, 21 Jun 2022 16:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 967CE83F7D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7589C0081;
	Tue, 21 Jun 2022 16:10:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3676DC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 16:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F963404ED
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 16:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F963404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zFk3V9zpTzOd
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 16:10:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4DA0404B4
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk
 [95.217.213.242])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4DA0404B4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 16:10:13 +0000 (UTC)
Received: from 168.7-181-91.adsl-dyn.isp.belgacom.be ([91.181.7.168]
 helo=deadeye)
 by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <ben@decadent.org.uk>)
 id 1o3gSA-0001rR-QL; Tue, 21 Jun 2022 18:10:10 +0200
Received: from ben by deadeye with local (Exim 4.95)
 (envelope-from <ben@decadent.org.uk>) id 1o3gSA-001lbD-9I;
 Tue, 21 Jun 2022 18:10:10 +0200
Message-ID: <a1a127d144d65937c5543c142e69213c9b8d2d40.camel@decadent.org.uk>
Subject: Re: virtio_balloon regression in 5.19-rc3
From: Ben Hutchings <ben@decadent.org.uk>
To: Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>
Date: Tue, 21 Jun 2022 18:10:00 +0200
In-Reply-To: <CACGkMEs45CCniTjbxr3OThdbG=Q4nGrm_11LLDfR4rRLetSx0A@mail.gmail.com>
References: <64c567bc77c4fbe7bfe37467cc1c89d24a45c37a.camel@decadent.org.uk>
 <402bb9b5-7d6e-ed69-8b66-3ebefd80ff15@redhat.com>
 <CACGkMEs45CCniTjbxr3OThdbG=Q4nGrm_11LLDfR4rRLetSx0A@mail.gmail.com>
User-Agent: Evolution 3.44.1-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 91.181.7.168
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
Cc: debian-kernel@lists.debian.org, "Michael S. Tsirkin" <mst@redhat.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 virtualization <virtualization@lists.linux-foundation.org>
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
Content-Type: multipart/mixed; boundary="===============2826385770905273157=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============2826385770905273157==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-18guuWA2Rs44JNkFHwRr"


--=-18guuWA2Rs44JNkFHwRr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-06-21 at 17:34 +0800, Jason Wang wrote:
> On Tue, Jun 21, 2022 at 5:24 PM David Hildenbrand <david@redhat.com> wrot=
e:
> >=20
> > On 20.06.22 20:49, Ben Hutchings wrote:
> > > I've tested a 5.19-rc3 kernel on top of QEMU/KVM with machine type
> > > pc-q35-5.2.  It has a virtio balloon device defined in libvirt as:
> > >=20
> > >     <memballoon model=3D"virtio">
> > >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x05" slot=3D"0x=
00" function=3D"0x0"/>
> > >     </memballoon>
> > >=20
> > > but the virtio_balloon driver fails to bind to it:
> > >=20
> > >     virtio_balloon virtio4: init_vqs: add stat_vq failed
> > >     virtio_balloon: probe of virtio4 failed with error -5
> > >=20
> >=20
> > Hmm, I don't see any recent changes to drivers/virtio/virtio_balloon.c
> >=20
> > virtqueue_add_outbuf() fails with -EIO if I'm not wrong. That's the
> > first call of virtqueue_add_outbuf() when virtio_balloon initializes.
> >=20
> >=20
> > Maybe something in generic virtio code changed?
>=20
> Yes, we introduced the IRQ hardening. That could be the root cause and
> we've received lots of reports so we decide to disable it by default.
>=20
> Ben, could you please try this patch: (and make sure
> CONFIG_VIRTIO_HARDEN_NOTIFICATION is not set)
>=20
> https://lore.kernel.org/lkml/20220620024158.2505-1-jasowang@redhat.com/T/

Yes, that patch fixes the regression for me.

Ben.

--=20
Ben Hutchings
Any smoothly functioning technology is indistinguishable
from a rigged demo.

--=-18guuWA2Rs44JNkFHwRr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmKx7VgACgkQ57/I7JWG
EQmvrQ/+IRi2atnEKmlvl2BpjvDAPIgPUaaKWHZ0maLpvhcxvzwY5f6lZhRSlumr
rUNilVFmA79hxDQL1SDV4uluqZYgaKA09K7Q7BSGWRskRJwog4yTkaaAEfJTsiTe
zf3Fm/0dMTRbs8VHwcXqeGPiihertKLmwm3T/km+AVTXngpRuLGMt2HjRnClrcWj
dbb2rQIU6ur/6JHKbz1qNI4YNHdPjdBWqDd+KJBvUQ6QUUYlbbVyO5sO+KSXY1gu
UgslR/NfNIAezFkOaomenRPQEBzg90+ePhnEG5YL9J3xYjxKmJfy0z7gxlwh1xv+
GR/7cCkVWZCJ0wpP0ZvmnRgWndebVs1GizgPwaMN2hNUgsja0t41MgNvVAyzE5LX
m7XYO49ZcHV3OoDS5ByOxEAR5Hk1NETYoJbTSq7/s2k69RN89U2Kk/oVB+vqyl/F
n9kM7nBdXAy05ExcUrFVRT8LGPbgR8Dpoo3pn1mwGtqPZ9NM893Ka8RrZPNeNvX0
7qXyJGhxZOSuer8kdLO5JwTGDfank4KeMenMNg8h4oeBPDXt4Lgj6iQmoxZBe44q
NBW/iiN3VUrswC1x7itQUeveq/lFg/2orB3c4tRNGMB3PeFx88dWzn4sVw/DwF1l
A/oZ1sl/EmtaCHC0zmLjbOGEtFQ5ZI2EHqgulNXEmMvRaEIJ73s=
=gNBI
-----END PGP SIGNATURE-----

--=-18guuWA2Rs44JNkFHwRr--

--===============2826385770905273157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2826385770905273157==--
