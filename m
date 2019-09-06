Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0DBAB7A1
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 14:00:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6A85A2168;
	Fri,  6 Sep 2019 12:00:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6E249215B
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:00:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 20B03887
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:00:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0952E18C4279;
	Fri,  6 Sep 2019 12:00:46 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49891611DE;
	Fri,  6 Sep 2019 12:00:10 +0000 (UTC)
Date: Fri, 6 Sep 2019 13:00:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 14/18] virtiofs: Add a fuse_iqueue operation to put()
	reference
Message-ID: <20190906120009.GV5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-15-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-15-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.62]);
	Fri, 06 Sep 2019 12:00:47 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============4367025304054692416=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============4367025304054692416==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OlucDFihBVSxvK/7"
Content-Disposition: inline


--OlucDFihBVSxvK/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2019 at 03:48:55PM -0400, Vivek Goyal wrote:
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 85e2dcad68c1..04e2c000d63f 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -479,6 +479,11 @@ struct fuse_iqueue_ops {
>  	 */
>  	void (*wake_pending_and_unlock)(struct fuse_iqueue *fiq)
>  		__releases(fiq->waitq.lock);
> +
> +	/**
> +	 * Put a reference on fiq_priv.

I'm a bit confused about fiq->priv's role in this.  The callback takes
struct fuse_iqueue *fiq as the argument, not void *priv, so it could
theoretically do more than just release priv.

I think one of the following would be clearer:

 /**
  * Drop a reference to fiq->priv.
  */
 void (*put_priv)(void *priv);

Or:

 /**
  * Clean up when fuse_iqueue is destroyed.
  */
 void (*release)(struct fuse_iqueue *fiq);

In the second case fuse_conn_put() shouldn't check fiq->priv.

--OlucDFihBVSxvK/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1ySkkACgkQnKSrs4Gr
c8ivNAf+NYLja/k2E1pzgRX+58rLDkzT6qfQX2XKwJVUqTns/MMKaTPd/OJkf+hW
4ubt3/0sb0kFtAsyffCUY7NiLFRWbanKCEZzP1RLN/ciK2l6bGJldM5TCC0AjMXi
waisC1VR9iopyR8dEIZpZZykVQEjY2CF2UvUJwzCBph382sQM25+a6OpUQ8N2FSI
7/7VMBVILOpdeBDum2QijFCXREuqvk0Si2Kg47nTq+muuOCD/mrGg7byV/pWPvyY
2l3YzL/W0S03phxm8SlNegD0jQ9nr8po2bcY1coriYMz6WSqxDbBwmbb9Izr3aXD
phrdP6+MgQk6AvUlXsmFd/yzwtYC4Q==
=lftV
-----END PGP SIGNATURE-----

--OlucDFihBVSxvK/7--

--===============4367025304054692416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4367025304054692416==--
