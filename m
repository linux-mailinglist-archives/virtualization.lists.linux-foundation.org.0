Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2068C2CC007
	for <lists.virtualization@lfdr.de>; Wed,  2 Dec 2020 15:48:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0DEBC8715A;
	Wed,  2 Dec 2020 14:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gues729dPrWA; Wed,  2 Dec 2020 14:48:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 230288715D;
	Wed,  2 Dec 2020 14:48:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FEEDC0052;
	Wed,  2 Dec 2020 14:48:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 687CEC0052
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 14:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 578BA878BC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 14:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RixDtl90bnE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 14:48:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 83BB787847
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606920504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3/ciYHLKJ3yILLDkyTRzHDrbddemmdv1ABt1jTeUwBY=;
 b=cbxIcb2ZQ+QplGyxzL6us2gWxLd+CdRgVQ1d1sEqLqRh3BvLVhKXUv5G1HVYzKf1pOqKxC
 IJtawwOo5rh4NTYaep+0IaITZzmQ/6CzOR1z2ZpTJoZNvhWNZHG0QzesvENeDDs0PalwqO
 F+nCSveuR+gmUgDiOw6b5pbUW2w3PuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-D1PchtsSN9eOsqlRyAadYQ-1; Wed, 02 Dec 2020 09:48:21 -0500
X-MC-Unique: D1PchtsSN9eOsqlRyAadYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86DBD185E48E;
 Wed,  2 Dec 2020 14:48:20 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2C0C5D6BA;
 Wed,  2 Dec 2020 14:48:16 +0000 (UTC)
Date: Wed, 2 Dec 2020 14:48:15 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 1/1 V2] vhost scsi: fix lun reset completion handling
Message-ID: <20201202144815.GN655829@stefanha-x1.localdomain>
References: <1605716857-4949-1-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605716857-4949-1-git-send-email-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: target-devel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-scsi@vger.kernel.org, mst@redhat.com
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
Content-Type: multipart/mixed; boundary="===============6888752869745277300=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============6888752869745277300==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dPW7zu3hTOhZvCDO"
Content-Disposition: inline

--dPW7zu3hTOhZvCDO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 10:27:37AM -0600, Mike Christie wrote:
> vhost scsi owns the scsi se_cmd but lio frees the se_cmd->se_tmr
> before calling release_cmd, so while with normal cmd completion we
> can access the se_cmd from the vhost work, we can't do the same with
> se_cmd->se_tmr. This has us copy the tmf response in
> vhost_scsi_queue_tm_rsp to our internal vhost-scsi tmf struct for
> when it gets sent to the guest from our worker thread.
>=20
> Fixes: Fixes: efd838fec17b ("vhost scsi: Add support for LUN resets.")
> Signed-off-by: Mike Christie <michael.christie@oracle.com>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>=20
> V2:
> - Added fixes line.
>=20
>  drivers/vhost/scsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

This will go through Michael Tsirkin or Martin K. Petersen's tree.

--dPW7zu3hTOhZvCDO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/HqS8ACgkQnKSrs4Gr
c8jtgggAxim0I6O6jk2HCjqRjI0QXlKtp0ziC1scmHzQSibKHY+nJ5CiZ45ec5lV
mZofBAD7UDhyo+nBTxZN1eTWsE42CPBEcicLX8ZmUCUfjtUtM1o7MumfdTJ0ezt2
MtVi00JVN4AIrJYG74a9V7v/KCctNHoaCUCy/kXJYb++tuPFBFKWe2OuNncKVJe5
f6QvCIHvdTAHDDnjz4HvVlJZLBOjzbGenPntQ6NxYFCm9Lsk1WyPJEQhxdUvfvBL
wzbSC2Wzbqp7h06WXoQMZxTbFfl1sA4KnQM+aT1u+O54YCck7UoxnYo8sj9JzYqa
g8+8MjtpZxwB3tmuKFcCEzE25ZHQ3g==
=SZ59
-----END PGP SIGNATURE-----

--dPW7zu3hTOhZvCDO--


--===============6888752869745277300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6888752869745277300==--

