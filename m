Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0B820F0CE
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 10:47:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C4B2C87D39;
	Tue, 30 Jun 2020 08:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNVi5HYHcvU9; Tue, 30 Jun 2020 08:47:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3D3B987D54;
	Tue, 30 Jun 2020 08:47:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25E8CC016E;
	Tue, 30 Jun 2020 08:47:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C512EC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 08:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C142B883C8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 08:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6VJcVkhSfnB6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 08:47:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E444A8839E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 08:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593506866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZkmxyzbFACTQmL2MzgsqgcFM7FyH01FwulQcZ4SaQhw=;
 b=FDHs4x92MJuH2y3UdWhGrptDPHYtnHsvi+WkMY5nFcprflyil6AmfAXSIsEQ9AUfJf1yW6
 GHppLKle56/Kk07VAjX1oyN/sX7Yw453dzOJbOWorOBPwffiIzpY9OyevDyj41Y2a/GXND
 tY5kBssWkNtNvVPGWgX45npc1xSW2lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-D89hQDdJM1-SK6mgbbm6fA-1; Tue, 30 Jun 2020 04:47:44 -0400
X-MC-Unique: D89hQDdJM1-SK6mgbbm6fA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 499871005512;
 Tue, 30 Jun 2020 08:47:43 +0000 (UTC)
Received: from localhost (ovpn-115-106.ams2.redhat.com [10.36.115.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2CA76E6F0;
 Tue, 30 Jun 2020 08:47:40 +0000 (UTC)
Date: Tue, 30 Jun 2020 09:47:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC 0/3] virtio: NUMA-aware memory allocation
Message-ID: <20200630084738.GC81930@stefanha-x1.localdomain>
References: <20200625135752.227293-1-stefanha@redhat.com>
 <9cd725b5-4954-efd9-4d1b-3a448a436472@redhat.com>
 <20200629092646.GC31392@stefanha-x1.localdomain>
 <20200629112212-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200629112212-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============6220193414567200161=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============6220193414567200161==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Content-Disposition: inline

--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 11:28:41AM -0400, Michael S. Tsirkin wrote:
> On Mon, Jun 29, 2020 at 10:26:46AM +0100, Stefan Hajnoczi wrote:
> > On Sun, Jun 28, 2020 at 02:34:37PM +0800, Jason Wang wrote:
> > >=20
> > > On 2020/6/25 =E4=B8=8B=E5=8D=889:57, Stefan Hajnoczi wrote:
> > > > These patches are not ready to be merged because I was unable to me=
asure a
> > > > performance improvement. I'm publishing them so they are archived i=
n case
> > > > someone picks up this work again in the future.
> > > >=20
> > > > The goal of these patches is to allocate virtqueues and driver stat=
e from the
> > > > device's NUMA node for optimal memory access latency. Only guests w=
ith a vNUMA
> > > > topology and virtio devices spread across vNUMA nodes benefit from =
this.  In
> > > > other cases the memory placement is fine and we don't need to take =
NUMA into
> > > > account inside the guest.
> > > >=20
> > > > These patches could be extended to virtio_net.ko and other devices =
in the
> > > > future. I only tested virtio_blk.ko.
> > > >=20
> > > > The benchmark configuration was designed to trigger worst-case NUMA=
 placement:
> > > >   * Physical NVMe storage controller on host NUMA node 0
>=20
> It's possible that numa is not such a big deal for NVMe.
> And it's possible that bios misconfigures ACPI reporting NUMA placement
> incorrectly.
> I think that the best thing to try is to use a ramdisk
> on a specific numa node.

Using ramdisk is an interesting idea, thanks.

Stefan

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl76/CoACgkQnKSrs4Gr
c8hYXAf9F4LW8ilmyRTvhYffEkf/Y5C/wzheDL39Si1gk1+C0wfmY3ddEKKLk+fq
W90McRJ1hjeo8BAKagw8M298S6EN3dDOr29dyA3G3DtFFrMW+zgetEw8gAVHRRmm
SxDyIJE3g3VrpCCY2w7sZp/uyxod7ozRCXqy+HLq2zVu2LuJg5eitoP15VBQQOIR
tGNeIFgMRLAFG9ps4XYtgyRtqpgnu69sh29h+lIcFA6oSn1cHbn6cdcuqlJKrz1j
CsTdPuw/nL66XjFvBnj68Tlugj0VTyTcTw9HJAhyCF396jaVZ4/9HP6vGYV7y1xX
Nfp+b8mto6LeNbICxCU0x0wpk/y0EQ==
=eAaL
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--


--===============6220193414567200161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6220193414567200161==--

