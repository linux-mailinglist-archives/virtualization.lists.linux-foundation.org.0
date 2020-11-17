Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B152B694E
	for <lists.virtualization@lfdr.de>; Tue, 17 Nov 2020 17:04:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E5F4086FC6;
	Tue, 17 Nov 2020 16:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hff8YNfNQNZZ; Tue, 17 Nov 2020 16:04:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 82A3486F98;
	Tue, 17 Nov 2020 16:04:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F31BC07FF;
	Tue, 17 Nov 2020 16:04:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67A1FC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 55CF5861A0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:04:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyJ44DYr8kjk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:04:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BA5AF86124
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605629075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QAvCna+clDX4lZQI5nvorTls2cvWVMz8okgtfWJTHKI=;
 b=FQJHw8vHypA2+H+Pz655M2SuEVMgsgpERoyoXGS3FLijxdIcIhoq9aWUsOrxfw69cXnN2J
 rlQpUtlXc8EBD3MxqB8B5iVIEkyFi/FJKwu5D0IulTkQBRLoXI/XtNnCJFfU8+4a9Ots1Q
 LRAWnFBushIVEmPx19DGyGFRIWmHmy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-Rvj2yrciNbW8ZnE6T7_S1Q-1; Tue, 17 Nov 2020 11:04:32 -0500
X-MC-Unique: Rvj2yrciNbW8ZnE6T7_S1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA53A8042A7;
 Tue, 17 Nov 2020 16:04:30 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452BD1841D;
 Tue, 17 Nov 2020 16:04:27 +0000 (UTC)
Date: Tue, 17 Nov 2020 16:04:26 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 06/10] vhost scsi: make SCSI cmd completion per vq
Message-ID: <20201117160426.GO131917@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <1605223150-10888-8-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605223150-10888-8-git-send-email-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, mst@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, pbonzini@redhat.com
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
Content-Type: multipart/mixed; boundary="===============3195685329833493489=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============3195685329833493489==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/UvyDgxjlFfP/4zZ"
Content-Disposition: inline

--/UvyDgxjlFfP/4zZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 05:19:06PM -0600, Mike Christie wrote:
> In the last patches we are going to have a worker thread per IO vq.
> This patch separates the scsi cmd completion code paths so we can
> complete cmds based on their vq instead of having all cmds complete
> on the same worker thread.
>=20
> Signed-off-by: Mike Christie <michael.christie@oracle.com>
> ---
>  drivers/vhost/scsi.c | 48 +++++++++++++++++++++++++---------------------=
--
>  1 file changed, 25 insertions(+), 23 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--/UvyDgxjlFfP/4zZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+z9IoACgkQnKSrs4Gr
c8j3GQf/Qf0GdIULIC6ID0rnGPCWs44LKDFOtvHlByy3GfUC9uN86EvbUUVr//2v
sWCmnejk/fX8lr9iwwbw3v2LBio+avFi47iOd5HxLRW23EAHdkzbgP4DPQDQGVGg
RW5h5+SJFSvsZavgx58zu2zKIIEL7zmJ/ik57DqjmDyDEBeBZmibE/PNdeHLzlt4
/nWAIdG2eFuNP8vXPy49799ilcJd5A6ONmNwie9Xve7ptRWM4SLU32Jb6yPDsL6W
AHwTMdvcWbTxjGJuUdIhtnwivYUP203mX2EMxW2x/29t02eULUDIww/4Bj4RoC7F
FmaH54Wk0eoNDs+DYLL9Y3+VQkeL5Q==
=5DGA
-----END PGP SIGNATURE-----

--/UvyDgxjlFfP/4zZ--


--===============3195685329833493489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3195685329833493489==--

