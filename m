Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFFF4DB589
	for <lists.virtualization@lfdr.de>; Wed, 16 Mar 2022 17:00:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF790611F0;
	Wed, 16 Mar 2022 16:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_tRmsCKW33O; Wed, 16 Mar 2022 16:00:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 90456611ED;
	Wed, 16 Mar 2022 16:00:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13B49C0033;
	Wed, 16 Mar 2022 16:00:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FED4C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Mar 2022 16:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AFDF401D6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Mar 2022 16:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6xshIdfTJ0j
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Mar 2022 16:00:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54D694015A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Mar 2022 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647446437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LYg8Y6p1xxfeGmLwQhCeeh72s1nQrXUYz7kNYKxV238=;
 b=QHN3mWfI6ZccdxftgBqDbRJNdrKj99EZRaFR6UWW3flkB4RKwaHHaz539KeZ/3xoHwqRbL
 ufMVaNw3/5XUuNzqJMBM1dx74O7ZQth4M+SV0ROUxgZGMloxauuNSDTeIVjIZ0Cq1/Jwk+
 npxshUcDYvlCm/eYWD1PFmwXUiG94Ws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-X9uZG5B1MT6GdCVnylknDA-1; Wed, 16 Mar 2022 12:00:35 -0400
X-MC-Unique: X9uZG5B1MT6GdCVnylknDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A48F80352D;
 Wed, 16 Mar 2022 16:00:33 +0000 (UTC)
Received: from localhost (unknown [10.39.193.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D542C40E80E2;
 Wed, 16 Mar 2022 16:00:32 +0000 (UTC)
Date: Wed, 16 Mar 2022 16:00:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH] virtio-blk: support polling I/O
Message-ID: <YjIJnWp/HRYueLtc@stefanha-x1.localdomain>
References: <20220311152832.17703-1-suwan.kim027@gmail.com>
 <ea838f63-5f63-6f3b-f49e-1107b43f7d1c@redhat.com>
 <Yi82BL9KecQsVfgX@localhost.localdomain>
 <CACGkMEujXYNE-88=m9ohjbeAj2F7CqEUes8gOUmasTNtwn2bUA@mail.gmail.com>
 <YjCmBkjgtQZffiXw@localhost.localdomain>
 <CACGkMEtxadf1+0Db06nE3SuQZhvyELq7ZwvKaH8x_utj91dRdg@mail.gmail.com>
 <YjIDIjUwuwkfRS2d@localhost.localdomain>
 <96836799-8d1f-3865-e2e7-721150445e6a@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <96836799-8d1f-3865-e2e7-721150445e6a@nvidia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Cc: mst <mst@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 linux-block@vger.kernel.org, pbonzini <pbonzini@redhat.com>,
 Suwan Kim <suwan.kim027@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6687979598207491064=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============6687979598207491064==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TtnH6To+GCf8zkoh"
Content-Disposition: inline


--TtnH6To+GCf8zkoh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 05:36:20PM +0200, Max Gurtovoy wrote:
>=20
> On 3/16/2022 5:32 PM, Suwan Kim wrote:
> > On Wed, Mar 16, 2022 at 10:02:13AM +0800, Jason Wang wrote:
> > > On Tue, Mar 15, 2022 at 10:43 PM Suwan Kim <suwan.kim027@gmail.com> w=
rote:
> > > > On Tue, Mar 15, 2022 at 04:59:23PM +0800, Jason Wang wrote:
> > > > > On Mon, Mar 14, 2022 at 8:33 PM Suwan Kim <suwan.kim027@gmail.com=
> wrote:
> > > > >=20
> > > > > > On Mon, Mar 14, 2022 at 02:14:53PM +0800, Jason Wang wrote:
> > > > > > > =E5=9C=A8 2022/3/11 =E4=B8=8B=E5=8D=8811:28, Suwan Kim =E5=86=
=99=E9=81=93:
> > > > > > > > diff --git a/include/uapi/linux/virtio_blk.h
> > > > > > b/include/uapi/linux/virtio_blk.h
> > > > > > > > index d888f013d9ff..3fcaf937afe1 100644
> > > > > > > > --- a/include/uapi/linux/virtio_blk.h
> > > > > > > > +++ b/include/uapi/linux/virtio_blk.h
> > > > > > > > @@ -119,8 +119,9 @@ struct virtio_blk_config {
> > > > > > > >       * deallocation of one or more of the sectors.
> > > > > > > >       */
> > > > > > > >      __u8 write_zeroes_may_unmap;
> > > > > > > > +   __u8 unused1;
> > > > > > > > -   __u8 unused1[3];
> > > > > > > > +   __virtio16 num_poll_queues;
> > > > > > > >    } __attribute__((packed));
> > > > > > >=20
> > > > > > > This looks like a implementation specific (virtio-blk-pci) op=
timization,
> > > > > > how
> > > > > > > about other implementation like vhost-user-blk?
> > > > > > I didn=E2=80=99t consider vhost-user-blk yet. But does vhost-us=
er-blk also
> > > > > > use vritio_blk_config as kernel-qemu interface?
> > > > > >=20
> > > > > Yes, but see below.
> > > > >=20
> > > > >=20
> > > > > > Does vhost-user-blk need additional modification to support pol=
ling
> > > > > > in kernel side?
> > > > > >=20
> > > > >=20
> > > > > No, but the issue is, things like polling looks not a good candid=
ate for
> > > > > the attributes belonging to the device but the driver. So I have =
more
> > > > > questions:
> > > > >=20
> > > > > 1) what does it really mean for hardware virtio block devices?
> > > > > 2) Does driver polling help for the qemu implementation without p=
olling?
> > > > > 3) Using blk_config means we can only get the benefit from the ne=
w device
> > > > 1) what does it really mean for hardware virtio block devices?
> > > > 3) Using blk_config means we can only get the benefit from the new =
device
> > > >=20
> > > > This patch adds dedicated HW queue for polling purpose to virtio
> > > > block device.
> > > >=20
> > > > So I think it can be a new hw feature. And it can be a new device
> > > > that supports hw poll queue.
> > > One possible issue is that the "poll" looks more like a
> > > software/driver concept other than the device/hardware.
> > >=20
> > > > BTW, I have other idea about it.
> > > >=20
> > > > How about adding =E2=80=9Cnum-poll-queues" property as a driver par=
ameter
> > > > like NVMe driver, not to QEMU virtio-blk-pci property?
> > > It should be fine, but we need to listen to others.
> > To Michael, Stefan, Max
> >=20
> > How about using driver parameter instead of virio_blk_config?
>=20
> Yes. I mentioned that virtio_blk_config shouldn't change.

There are pros and cons to module parameters and configuration space
fields. Both are valid but feel free to drop the configuration space
field.

On note about module parameters: if the guest has a virtio-blk device
with a root file system and another one for benchmarking then it's
unfortunate that the number of poll queues module parameter affects both
devices.

Is there a way to set a module parameter for a specific device instance?
I guess you'd need something else like a sysfs attribute instead but the
implementation is more complex.

I'm fine with a module parameter.

Stefan

--TtnH6To+GCf8zkoh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIyCZ0ACgkQnKSrs4Gr
c8is1wgArHpcBp23+y84O9gBKCh5kWW/DmtvaPN0Ok/YGvnCsH4RzmWRD+dlwk7H
UkDfX4mtvBLyNOOIat+McV41qiopPcrq4ixsK5homQY81gu4LGkKmZ+E0OAdg2Rp
p3M1LgOB+YsjZbPzeMdhO4sEZA9AxQAkfTLM1+UXi+/QL71hN6ltuFtctHT/mGsp
HMNRhDodcmqlneilJpkij6ya7BgMTqVGRUOHgn0JLMre6FWwS4ahhGTQmwX6Zi/q
czXCLsB7aOv8H3hVZ3Ekf/EWQgrWxW/0KNYqxySkatkwHl8n5//iaIZTGAKPvUMS
J12Y9nonVvC4mrvnPFsbNXrUkmh/Ag==
=mlLW
-----END PGP SIGNATURE-----

--TtnH6To+GCf8zkoh--


--===============6687979598207491064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6687979598207491064==--

