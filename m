Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 607B42B9402
	for <lists.virtualization@lfdr.de>; Thu, 19 Nov 2020 15:00:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 99A13204DB;
	Thu, 19 Nov 2020 14:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqC3wCgvbF9I; Thu, 19 Nov 2020 14:00:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EA7ED204F2;
	Thu, 19 Nov 2020 14:00:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7264C0891;
	Thu, 19 Nov 2020 14:00:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78319C0891
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 14:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6214A204DB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 14:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SVJmsXWOxAKb
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 14:00:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id CB82B204D2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 14:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605794423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v5zriwP0OnSwK6NKoqnrYTRLRPG7ftIOBDrM7ASp+mk=;
 b=fMOnvAtLVA1FJ/mW9Eh+0QVbCd3OqJOo/3Z1zr9zdXj7nCX3R1MYlisLD1MCynLKn46J72
 yhcRLP3WbiPmRGprRu3CHARFCFHzc2Kvsux1klfgkKp8y8+UJ7KHxX+OoUpJpF756ZdEEv
 hOuI2gqTypDcrEkA0DwYXnhy/Y+dF0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-oD-l0DRzPcOrndzkvWo3nw-1; Thu, 19 Nov 2020 09:00:21 -0500
X-MC-Unique: oD-l0DRzPcOrndzkvWo3nw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 796B9100C603;
 Thu, 19 Nov 2020 14:00:19 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD0B15D6A8;
 Thu, 19 Nov 2020 14:00:11 +0000 (UTC)
Date: Thu, 19 Nov 2020 14:00:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
Message-ID: <20201119140010.GD838210@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <20201117164043.GS131917@stefanha-x1.localdomain>
 <b3343762-bb11-b750-46ec-43b5556f2b8e@oracle.com>
 <20201118044620-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201118044620-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 pbonzini@redhat.com, Mike Christie <michael.christie@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============2782564340921295505=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============2782564340921295505==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline

--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 04:54:07AM -0500, Michael S. Tsirkin wrote:
> On Tue, Nov 17, 2020 at 01:13:14PM -0600, Mike Christie wrote:
> > On 11/17/20 10:40 AM, Stefan Hajnoczi wrote:
> > > On Thu, Nov 12, 2020 at 05:18:59PM -0600, Mike Christie wrote:
> > >> The following kernel patches were made over Michael's vhost branch:
> > >>
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/log/?h=
=3Dvhost
> > >>
> > >> and the vhost-scsi bug fix patchset:
> > >>
> > >> https://lore.kernel.org/linux-scsi/20201112170008.GB1555653@stefanha=
-x1.localdomain/T/#t
> > >>
> > >> And the qemu patch was made over the qemu master branch.
> > >>
> > >> vhost-scsi currently supports multiple queues with the num_queues
> > >> setting, but we end up with a setup where the guest's scsi/block
> > >> layer can do a queue per vCPU and the layers below vhost can do
> > >> a queue per CPU. vhost-scsi will then do a num_queue virtqueues,
> > >> but all IO gets set on and completed on a single vhost-scsi thread.
> > >> After 2 - 4 vqs this becomes a bottleneck.
> > >>
> > >> This patchset allows us to create a worker thread per IO vq, so we
> > >> can better utilize multiple CPUs with the multiple queues. It
> > >> implments Jason's suggestion to create the initial worker like
> > >> normal, then create the extra workers for IO vqs with the
> > >> VHOST_SET_VRING_ENABLE ioctl command added in this patchset.
> > >=20
> > > How does userspace find out the tids and set their CPU affinity?
> > >=20
> >=20
> > When we create the worker thread we add it to the device owner's cgroup=
,
> > so we end up inheriting those settings like affinity.
> >=20
> > However, are you more asking about finer control like if the guest is
> > doing mq, and the mq hw queue is bound to cpu0, it would perform
> > better if we could bind vhost vq's worker thread to cpu0? I think the
> > problem might is if you are in the cgroup then we can't set a specific
> > threads CPU affinity to just one specific CPU. So you can either do
> > cgroups or not.
>=20
> Something we wanted to try for a while is to allow userspace
> to create threads for us, then specify which vqs it processes.

Do you mean an interface like a blocking ioctl(vhost_fd,
VHOST_WORKER_RUN) where the vhost processing is done in the context of
the caller's userspace thread?

What is neat about this is that it removes thread configuration from the
kernel vhost code. On the other hand, userspace still needs an interface
indicating which vqs should be processed. Maybe it would even require an
int worker_fd =3D ioctl(vhost_fd, VHOST_WORKER_CREATE) and then
ioctl(worker_fd, VHOST_WORKER_BIND_VQ, vq_idx)? So then it becomes
complex again...

Stefan

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+2emoACgkQnKSrs4Gr
c8jXaAf/eOlKgp0ihGCZvY9wziHeB36cX6eC0Dv+PJy3mJGo2l+FH5eS5saaT9As
OchpLrd+7iNH5qN6NL9GxP3TuiWa7mjIjAxNA7QQYq976m6sZShkVldvzZGcxron
M2ow96BMZznx/O9FlXS5GOqB9GOjL8cq1b5g4lt4uVbMHQL/MhqBc5byq0UzX6NG
Aw2wcTfrsqX7hXFb0Y2dj/BE2+tCAuMYsVzs107UQdaxezKVkU+Xhpy17U04iD7h
Ej1D4O088QNDcx8YTlrGRBG4O1A63u4SWSFcSut+W+vGqUJ8mdUrahqp7iyM9mkY
sxBWIzLKVhQ0VkKsGxeDGeeYVNEpiA==
=1sap
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--


--===============2782564340921295505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2782564340921295505==--

