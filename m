Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 14380AB666
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 12:52:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4C3612145;
	Fri,  6 Sep 2019 10:52:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 76A1F2124
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:52:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3CD9B623
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:52:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8532800DD4;
	Fri,  6 Sep 2019 10:52:16 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C21C460BF1;
	Fri,  6 Sep 2019 10:52:11 +0000 (UTC)
Date: Fri, 6 Sep 2019 11:52:10 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 08/18] virtiofs: Drain all pending requests during
	->remove time
Message-ID: <20190906105210.GP5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-9-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-9-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Fri, 06 Sep 2019 10:52:16 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, mst@redhat.com, linux-kernel@vger.kernel.org,
	dgilbert@redhat.com, virtio-fs@redhat.com, linux-fsdevel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7323030670655801549=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============7323030670655801549==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4IFtMBbmeqbTM/ox"
Content-Disposition: inline


--4IFtMBbmeqbTM/ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2019 at 03:48:49PM -0400, Vivek Goyal wrote:
> +static void virtio_fs_drain_queue(struct virtio_fs_vq *fsvq)
> +{
> +	WARN_ON(fsvq->in_flight < 0);
> +
> +	/* Wait for in flight requests to finish.*/
> +	while (1) {
> +		spin_lock(&fsvq->lock);
> +		if (!fsvq->in_flight) {
> +			spin_unlock(&fsvq->lock);
> +			break;
> +		}
> +		spin_unlock(&fsvq->lock);
> +		usleep_range(1000, 2000);
> +	}

I think all contexts that call this allow sleeping so we could avoid
usleep here.

--4IFtMBbmeqbTM/ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1yOloACgkQnKSrs4Gr
c8gmeQgAoJQJeQAjTj+aeNGzBdb4oLsqKKM6Q+4z3dqyaIM7pOTsdgiPZ/q1DA5U
3/e2c4UFDTEg+r9xvEx5FFgBiPFrpwGU3N8mroPEUY9yueCllNsIZmS0y8n76YDb
dCAPCksGMF4o9AWlHAMnxFoao+EfbsJd1mNU/7f7hFqFQoAuCu64321mwhqtOO+V
PXUqk6wTZtWxPAzvZCO93D4DuUfrW7jzHRNyvCvgPiJLCTU43uptr1PDJKuDCxAp
Sqpb5jJevhxuwbc84hIEnKY/0ERKxjky+XWBsHHc1Yy/CWAdNCyU0tW8OuUaG5+k
FF9UbW4BK3wqyzMhWOd/4jDbTz6oyA==
=x8L/
-----END PGP SIGNATURE-----

--4IFtMBbmeqbTM/ox--

--===============7323030670655801549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7323030670655801549==--
