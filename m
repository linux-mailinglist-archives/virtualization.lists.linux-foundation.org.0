Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ACEFB2B3
	for <lists.virtualization@lfdr.de>; Wed, 13 Nov 2019 15:40:23 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A0C7DDC0;
	Wed, 13 Nov 2019 14:40:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2B1B3BA9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 14:40:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 3A11E8A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573656010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=bSHrFQsbaC1yAitK7Law8cbj6Z2ZKZzmHqlB5M3qljE=;
	b=brfr55ZKu3Txa/qEfIXgJc9C/9PXXcbVyGb8rLXHHuiv/86Jnxxc8fqB43rojLLWpMVXJP
	uICnQHvE2ZJk2pzGIwyyoGKCpCY+LcBy+vhYKx+EDeGSqNKskASiQyQSiCjWGVhmrrnS/c
	rQq3bl/V5RUUjIMzY133om/2FDTLGhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-177-yOlrfIIcMb-iBtVC6B25Hg-1; Wed, 13 Nov 2019 09:40:08 -0500
X-MC-Unique: yOlrfIIcMb-iBtVC6B25Hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C76C8EDBC1;
	Wed, 13 Nov 2019 14:40:07 +0000 (UTC)
Received: from localhost (ovpn-117-166.ams2.redhat.com [10.36.117.166])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBE4860C88;
	Wed, 13 Nov 2019 14:40:03 +0000 (UTC)
Date: Wed, 13 Nov 2019 14:40:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 3/3] virtiofs: Use completions while waiting for queue to
	be drained
Message-ID: <20191113144002.GB554680@stefanha-x1.localdomain>
References: <20191030150719.29048-1-vgoyal@redhat.com>
	<20191030150719.29048-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191030150719.29048-4-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, linux-kernel@vger.kernel.org, dgilbert@redhat.com,
	virtio-fs@redhat.com, linux-fsdevel@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============1496840029369470473=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

--===============1496840029369470473==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline

--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 30, 2019 at 11:07:19AM -0400, Vivek Goyal wrote:
> While we wait for queue to finish draining, use completions instead of
> uslee_range(). This is better way of waiting for event.

s/uslee_range()/usleep_range()/

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3MFcIACgkQnKSrs4Gr
c8iVMQgAlnZ9d6GvnmORD+LRCvqgvHMMUlFoZS9nF/QBnEG7N4Pqr8BPRJw7Gi0D
uBdcZjReMZY2fG9ZNXoMA0ivvPUPa3eDEBeuXlQrp8Qw4yx32ciL9VYvKly8vvV2
2SMpOnsiuxDhldW2norjAP2piC7VCt+ni8x0yMTECQbaIfvrMhAxR/be/NWOj3pa
RIFzuyeB4yqi73m0yRXtuN4AwL8Fzq/R0NFAfZDlGSiDmhWJ+xIJpPiL4ZfwVBaK
hwzVPIkrA6TmDNNLtI7aCmVrQiA8lpnMH5FbKLmobmXjhedf4PwtiUEMSa3ESC6Y
lBzMsJ4gnruQmDefdEdC1G7ohBHzSg==
=47Ie
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--


--===============1496840029369470473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1496840029369470473==--

