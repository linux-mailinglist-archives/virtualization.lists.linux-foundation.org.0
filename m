Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6C02B5E07
	for <lists.virtualization@lfdr.de>; Tue, 17 Nov 2020 12:11:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BEB5385B9D;
	Tue, 17 Nov 2020 11:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Tu7Pod7Vj38; Tue, 17 Nov 2020 11:11:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 12DAF8545E;
	Tue, 17 Nov 2020 11:11:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3BC5C07FF;
	Tue, 17 Nov 2020 11:11:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FC5BC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 11:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 436F2203A9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 11:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gx1IV1Sg+V8N
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 11:11:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 5CFB82011B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605611491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ITDbJ5FeObPmxp9jb5MtpoVUKiHieLkWbG48UC2H4M=;
 b=M7xmkxtL3fdBZbZYKxFIi/1zRuQc/tTJBWw34OGwixeaNMsgBqGQhvnbKFUlgkkHw1LgJw
 /3mxE7aRSb0o9CD6lYw5AAmIvL2NUgJ0/q3W8MS8RHFqTH8JF6J+3QAkZsqK/16f5Q7x5l
 2RwsnBHWZUMWDDBYNv2jFElll38W3Nk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-7tS0sVaAN0awBuS74jjcyg-1; Tue, 17 Nov 2020 06:11:26 -0500
X-MC-Unique: 7tS0sVaAN0awBuS74jjcyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8561802B61;
 Tue, 17 Nov 2020 11:11:25 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 468555D707;
 Tue, 17 Nov 2020 11:11:22 +0000 (UTC)
Date: Tue, 17 Nov 2020 11:11:21 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH RFC 04/12] vdpa: add vdpa simulator for block device
Message-ID: <20201117111121.GD131917@stefanha-x1.localdomain>
References: <20201113134712.69744-1-sgarzare@redhat.com>
 <20201113134712.69744-5-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113134712.69744-5-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Eli Cohen <elic@nvidia.com>
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
Content-Type: multipart/mixed; boundary="===============3659141440077138874=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============3659141440077138874==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Content-Disposition: inline

--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2020 at 02:47:04PM +0100, Stefano Garzarella wrote:
> +static void vdpasim_blk_work(struct work_struct *work)
> +{
> +	struct vdpasim *vdpasim = container_of(work, struct vdpasim, work);
> +	u8 status = VIRTIO_BLK_S_OK;
> +	int i;
> +
> +	spin_lock(&vdpasim->lock);
> +
> +	if (!(vdpasim->status & VIRTIO_CONFIG_S_DRIVER_OK))
> +		goto out;
> +
> +	for (i = 0; i < VDPASIM_BLK_VQ_NUM; i++) {
> +		struct vdpasim_virtqueue *vq = &vdpasim->vqs[i];
> +
> +		if (!vq->ready)
> +			continue;
> +
> +		while (vringh_getdesc_iotlb(&vq->vring, &vq->iov, &vq->iov,
> +					    &vq->head, GFP_ATOMIC) > 0) {
> +
> +			int write;
> +
> +			vq->iov.i = vq->iov.used - 1;
> +			write = vringh_iov_push_iotlb(&vq->vring, &vq->iov, &status, 1);
> +			if (write <= 0)
> +				break;

We're lucky the guest driver doesn't crash after VIRTIO_BLK_T_GET_ID? :)

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+zr9kACgkQnKSrs4Gr
c8iPWQgAum2Wx+ML7CwyIMXTLzRGqriW1/Z2uu/EQd5+DN1mh1OwzeQx+lyRC/I/
ateKy1MSPp6uXbOBPcjwNjoO/i9rpgMAv5k+T7zsCYjGYyUksR3+uyipbDo11qsW
FRkBsxyffjMmQupvEVoDj125ACqgtc8uajpbU9qdwGeDSEDiGWf4yuma1Jo9speI
VNH6UL4lmffCVhz1c385SW9L6oi0wVYBQlECdkKadgZsTWW3vN5sufKW53/8MHod
MTnf85IqyDbRMMVcXR5nD/B577+04gmSjauzHpIg9iDXDG35zgB6Uk4tV+wv9XA7
RuZaCUywt6pKH9zkeO4+Kcpxd6h4jw==
=58Zf
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--


--===============3659141440077138874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3659141440077138874==--

