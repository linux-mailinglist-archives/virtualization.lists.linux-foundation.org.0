Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C2B2B5EB4
	for <lists.virtualization@lfdr.de>; Tue, 17 Nov 2020 12:53:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8242F87072;
	Tue, 17 Nov 2020 11:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y+vBnEV39G5Q; Tue, 17 Nov 2020 11:53:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E253D87071;
	Tue, 17 Nov 2020 11:53:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB9CDC07FF;
	Tue, 17 Nov 2020 11:53:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C60E8C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 11:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8A5E220117
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 11:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ouLqhFsjCu2O
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 11:53:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id CFC8620110
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605613995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ORGIWbDZHVGHQKz+yXjGHqNxxtUKUaElXUNeXuBfTrk=;
 b=KYj9uZRjcsTGCqXD+KhiKrjItNzYLHnrXJhzxOv3jeP4txNOHJ+VLGVweLs8rE8QyghsuH
 YFNc49Dvx2ifwS63ZFwnxBazcN4f5Hr/L9XnU/KcW/6R+GrSYTFoav4g3aRWVpfqHb1QKz
 Xn/QVFwYaxFzZhatxN7J7eJfD7q/GTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-DCiX4ymnPyG1vYC0E1eKrQ-1; Tue, 17 Nov 2020 06:53:11 -0500
X-MC-Unique: DCiX4ymnPyG1vYC0E1eKrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 286778018A1;
 Tue, 17 Nov 2020 11:53:10 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC17010013D0;
 Tue, 17 Nov 2020 11:53:06 +0000 (UTC)
Date: Tue, 17 Nov 2020 11:53:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 1/1] qemu vhost scsi: add VHOST_SET_VRING_ENABLE support
Message-ID: <20201117115305.GJ131917@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <1605223150-10888-2-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605223150-10888-2-git-send-email-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Content-Type: multipart/mixed; boundary="===============8220499009399960458=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============8220499009399960458==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ublo+h3cBgJ33ahC"
Content-Disposition: inline

--Ublo+h3cBgJ33ahC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2020 at 05:19:00PM -0600, Mike Christie wrote:
> +static int vhost_kernel_set_vring_enable(struct vhost_dev *dev, int enable)
> +{
> +    struct vhost_vring_state s;
> +    int i, ret;
> +
> +    s.num = 1;
> +    for (i = 0; i < dev->nvqs; ++i) {
> +        s.index = i;
> +
> +        ret = vhost_kernel_call(dev, VHOST_SET_VRING_ENABLE, &s);
> +        /* Ignore kernels that do not support the cmd */
> +        if (ret == -EPERM)
> +            return 0;
> +        if (ret)
> +            goto disable_vrings;
> +    }

The 'enable' argument is ignored and this function acts on all
virtqueues, while the ioctl acts on a single virtqueue only.

This function's behavior is actually "vhost_kernel_enable_vrings()"
(plural), not "vhost_kernel_set_vring_enable()" (singular).

Please rename this function and drop the enable argument.

--Ublo+h3cBgJ33ahC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+zuaEACgkQnKSrs4Gr
c8ggbgf/amsccaIgLNwt7fBI9E5/mNlfsgJGbQlcgWAJWJ6giGQfPamIN2qEFbS9
TbTbc8ng7fqj3q9VA/QSYqqGT4o4S3ejHaluLfL8OG3NQhjB1jl1tv1B1hqUpbjh
7BvoLZvmN4mEBCwTMInavK7mBXwgIJX6dxAZdU6ZGiW3KjlNQQK01erQax/PFvrz
siTJLUyQP6RiIctvZ3TREgvdoCo7iS1YkxcDtRQU3Y1aVUSg49pUaq/oeLg5FMDi
HoIqvlqazYoI/asj1Fgli1qtZMX2tPom7IwdxPc+5pmyHkh4lT1JR0wwulWnwapb
x/T7SH6sVbYXRrs+JlLTrw7yvtAZwg==
=9dMr
-----END PGP SIGNATURE-----

--Ublo+h3cBgJ33ahC--


--===============8220499009399960458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8220499009399960458==--

