Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C1E2B6003
	for <lists.virtualization@lfdr.de>; Tue, 17 Nov 2020 14:04:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ACE28859C2;
	Tue, 17 Nov 2020 13:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HqrxQzluFgK8; Tue, 17 Nov 2020 13:04:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 15B27859EA;
	Tue, 17 Nov 2020 13:04:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D35A0C07FF;
	Tue, 17 Nov 2020 13:04:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE58EC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 13:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B70C72042B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 13:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BV0yWmnJBPCy
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 13:04:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 9595D2040E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605618269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kNa5O/Hj0HBQuu1Ns8AweW8QzcPZsqmg4/YkfGYf+Iw=;
 b=Xwp56/KT49sbsswI0OIMC0uLJI9JtB+oqXYDcJ2RFaiaPyPiR9XQ9fQImgUBzGARz9Jrp4
 td62IOWG8uOQz+9Dc6v1Cb3ErELwCJtlBDV+/UOBU46fHp9GMfx4HnUBs+zs43I7MFcF6O
 bZC+8zhS/tGlnaSicCH3Y4MfsD1voXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-MyAQ-weGMI6SqUW7jvbcQg-1; Tue, 17 Nov 2020 08:04:25 -0500
X-MC-Unique: MyAQ-weGMI6SqUW7jvbcQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1334A6D585;
 Tue, 17 Nov 2020 13:04:24 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EA7D55760;
 Tue, 17 Nov 2020 13:04:18 +0000 (UTC)
Date: Tue, 17 Nov 2020 13:04:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 01/10] vhost: remove work arg from vhost_work_flush
Message-ID: <20201117130417.GK131917@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <1605223150-10888-3-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605223150-10888-3-git-send-email-michael.christie@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============2694591092897439339=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============2694591092897439339==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EVcIhgQsEzAXu06J"
Content-Disposition: inline

--EVcIhgQsEzAXu06J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2020 at 05:19:01PM -0600, Mike Christie wrote:
> diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> index f22fce5..8795fd3 100644
> --- a/drivers/vhost/scsi.c
> +++ b/drivers/vhost/scsi.c
> @@ -1468,8 +1468,8 @@ static void vhost_scsi_flush(struct vhost_scsi *vs)
>  	/* Flush both the vhost poll and vhost work */
>  	for (i = 0; i < VHOST_SCSI_MAX_VQ; i++)
>  		vhost_scsi_flush_vq(vs, i);
> -	vhost_work_flush(&vs->dev, &vs->vs_completion_work);
> -	vhost_work_flush(&vs->dev, &vs->vs_event_work);
> +	vhost_work_dev_flush(&vs->dev);
> +	vhost_work_dev_flush(&vs->dev);

These two calls can be combined into a single call now.

--EVcIhgQsEzAXu06J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+zylEACgkQnKSrs4Gr
c8hrVwf+Mw0t1WPblvn8yE7/N+vf0dXbjADIoB7GyZgfdmFl4j1KGKlUh0ou0Kqb
Jth2D1ZdGZH640h2T+KEiGahhxXOP5yKL3GuEQcy80cd/93c+jpR4QRnUvg8xCSH
CrVg4cIAuf8cZAUXDjj7a5VeL7z3yI6Diq6iWX6Y8I8JOMtYBdI4DUeLJjUagIiL
qv65Rakq6rUcSDuQtl0uJopuWBM9sdntAUCrJLbBZakQThdBW7eu+L0TUbWI+w2k
iCSNazGQV2yqgRWfN8cKqC2bPG2rVVmghPK3XWCLkjSoNnnEizR/d1BrRLOHs/Rg
YoNm0XOtXilZ2v9oOenhdNIoekvUpA==
=j25G
-----END PGP SIGNATURE-----

--EVcIhgQsEzAXu06J--


--===============2694591092897439339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2694591092897439339==--

